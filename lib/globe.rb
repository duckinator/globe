require "globe/version"

# Reimplements global variables using a Hash.
#
# Mostly because global_variable_defined?, global_variable_get, and
# global_variable_set are magnificent things.
#
# There are convenience methods defined on the Kernel module,
# like Ruby has for class and instance variables.
module Globe
  Variables = Hash.new
end

module Kernel
  def global_variable_defined?(name)
    Globe::Variables.has_key?(name)
  end

  def global_variable_get(name)
    Globe::Variables.fetch(name)
  end

  def global_variable_set(name, value)
    Globe::Variables.store(name, value)
  end

  def global(obj)
    if obj.is_a?(Hash)
      obj.each do |k, v|
        global_variable_set(k, v)
      end
    else
      global_variable_get(obj)
    end
  end
end
