require 'wot/globals/version'
require 'wot/utilities'

# Reimplements global variables using class variables.
#
# Mostly because global_variable_defined?, global_variable_get, and
# global_variable_set are magnificent things.
#
# There are convenience methods defined on the Kernel module,
# like Ruby has for class and instance variables.
module Globe
  @@globals = {}

  class << self
    # Returns `true` if the given instance variable is defined in _obj_.
    # String arguments are converted to symbols.
    def defined?(name)
      @@globals.keys.include?(name)
    end

    def set(name, value)
      @@globals[name] = value
    end

    def get(name)
      @@globals[name]
    end
  end
end

module Kernel
  #
  def global_variable_defined?(name)
    Globe.defined?(name)
  end

  def global_variable_get(name)
    Globe.get(name)
  end

  def global_variable_set(name, value)
    Globe.set(name, value)
  end

  #
  def global(obj)
    if obj.is_a?(Hash)
      obj.each do |k, v|
        Globe.set(k, v)
      end
    else
      Globe.get(obj)
    end
  end
end
