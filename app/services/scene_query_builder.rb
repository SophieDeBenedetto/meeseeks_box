class SceneQueryBuilder
  attr_reader :query, :search_object
  
  def initialize(search_object, query=nil)
    @query         = query || Scene.select(scene[Arel.star])
    @search_object = search_object
  end

  def by_season
    reflect(query.where(scene[:season].eq(search_object.season)))
  end

  def by_episode
    reflect(query.where(scene[:episode].eq(search_object.episode)))
  end

  def by_keyword
    reflect(query.where(scene[:dialogue].matches("%#{search_object.keyword}%")))
  end
  
  private

  def scene
    Scene.arel_table
  end

  def reflect(query)
    self.class.new(search_object, query)
  end
end