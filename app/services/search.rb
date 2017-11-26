class Search
  include ActiveModel::Model

  attr_reader :season, :episode, :keyword, :random, :search_query

  def self.for(options)
    new(options).for
  end

  def initialize(options={})
    @season       = options[:season]
    @episode      = options[:episode]
    @keyword      = options[:keyword]  
    @random       = options[:random]      
  end

  def for
    random ? random_search : query_search
  end


  private
  attr_writer :search_query

  def random_search
    max_id  = Scene.maximum(:id)
    rand_id = (0..max_id).to_a.sample
    Scene.find(rand_id)
  end

  def query_search
    do_search 
    take_random_result
  end
  
  def do_search
    @search_query = SceneQueryBuilder.new(self)
    search_criteria.each do |attr, val|
      @search_query = search_query.send("by_#{attr}")
    end
  end

  def take_random_result
    search_query.query.sample
  end

  def attributes
    {season: season, episode: episode, keyword: keyword}
  end

  def search_criteria
    attributes.reject {|k, v| !v || v.strip == ""}
  end
end