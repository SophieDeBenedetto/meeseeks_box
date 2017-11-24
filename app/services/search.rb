class Search
  include ActiveModel::Model

  attr_reader :season, :episode, :keyword, :search_query

  def self.for(options)
    new(options).for
  end

  def initialize(options=nil)
    @season       = options[:season]
    @episode      = options[:episode]
    @keyword      = options[:keyword]        
  end

  def for
    do_search 
    take_random_result
  end


  private
  
  def do_search
    @search_query = SceneQueryBuilder.new(self)
    search_criteria.each do |attr, val|
      search_query.send("by_#{attr}")
    end
  end

  def take_random_result
    search_query.query.sample
  end

  def attributes
    {season: season, episode: episode, keyword: keyword}
  end

  def search_criteria
    attributes.reject {|k, v| !v}
  end
end