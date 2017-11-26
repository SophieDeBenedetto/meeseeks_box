class Search
  attr_reader :search_form
  
  def self.for(options)
    new(options).for
  end

  def initialize(options)
    @search_form = SearchForm.new(options)
  end

  def for
    search_form.random ? random_search : attribute_search
  end


  private

  def random_search
    rand_id  = (0..Scene.maximum(:id)).to_a.sample
    Scene.find(rand_id)
  end
  
  def attribute_search
    SceneQueryBuilder.build_query(search_form).sample
  end
end