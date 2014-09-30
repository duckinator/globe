require 'spinny/global_variables/version'
require 'spinny/utilities'

# Reimplements global variables using module variables!
#
# Mostly because global_variable_defined?, global_variable_get, and
# global_variable_set are magnificent things.
module Spinny
  # This module reimplements global variables using class variables.
  # There are convenience methods defined on the Kernel module, like Ruby has
  # for class variables.
  module GlobalVariables
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
    Spinny::GlobalVariables.defined?(name)
  end

  def global_variable_get(name)
    Spinny::GlobalVariables.get(name)
  end

  def global_variable_set(name, value)
    Spinny::GlobalVariables.set(name, value)
  end

  #
  def global(x)
    if x.is_a?(Hash)
      Spinny::GlobalVariables.set(x)
    else
      Spinny::GlobalVariables.get(x)
    end
  end
end
