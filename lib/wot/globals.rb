require 'wot/globals/version'
require 'wot/utilities'

# Reimplements global variables using module variables!
#
# Mostly because global_variable_defined?, global_variable_get, and
# global_variable_set are magnificent things.
module Wot
  # This module reimplements global variables using class variables.
  # There are convenience methods defined on the Kernel module, like Ruby has
  # for class variables.
  module Globals
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
end

module Kernel
  #
  def global_variable_defined?(name)
    Wot::Globals.defined?(name)
  end

  def global_variable_get(name)
    Wot::Globals.get(name)
  end

  def global_variable_set(name, value)
    Wot::Globals.set(name, value)
  end

  #
  def global(obj)
    if obj.is_a?(Hash)
      obj.each do |k, v|
        Wot::Globals.set(k, v)
      end
    else
      Wot::Globals.get(obj)
    end
  end
end
