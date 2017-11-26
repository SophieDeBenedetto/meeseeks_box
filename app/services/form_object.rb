class FormObject
  include ActiveModel::Model

  def new(options)
    options.each do |attr, val|
      send("#{attr}=", val)
    end
  end

  def attributes
    attr_hash = {}
    instance_variables.each do |var|
      var_name            = var.to_s.split("@")[1..-1].first
      attr_hash[var_name] = instance_variable_get(var)
    end
    attr_hash
  end
end