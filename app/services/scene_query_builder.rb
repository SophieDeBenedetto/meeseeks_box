class SceneQueryBuilder
  attr_reader :query, :search_form

  def self.build_query(search_form)
    query_conditions = collect_query_methods(search_form)
    query_builder    = new(search_form)
    query_conditions.inject(query_builder) { |query, method| query.send(method) }.query
  end

  def self.collect_query_methods(search_form)
    search_form.attributes.keys.map do |key|
      "by_#{key.to_s}" if search_form.attributes[key] && !search_form.attributes[key].empty?
    end.compact
  end

  def initialize(search_form, query=nil)
    @search_form = search_form
    @query       = query || base_query
  end

  def base_query
    Scene.select(scene[Arel.star])
  end

  def by_season
    reflect(query.where(scene[:season].eq(search_form.season)))
  end

  def by_episode
    reflect(query.where(scene[:episode].eq(search_form.episode)))
  end

  def by_keyword
    reflect(query.where('dialogue ~* :word', word: "\s#{search_form.keyword}"))
  end
  
  private

  def scene
    Scene.arel_table
  end

  def reflect(query)
    self.class.new(search_form, query)
  end
end