module Unitwise
  # A prefix can be used with metric atoms to modify their scale.
  class Prefix < Base
    liner :scalar

    # The data loaded from the UCUM spec files
    # @api semipublic
    def self.data
      @data ||= begin
        # Psych 3.3.2+
        YAML.unsafe_load File.open(data_file)
      rescue NoMethodError
        YAML.load File.open(data_file)
      end
    end

    # The location of the UCUM spec prefix data file
    # @api semipublic
    def self.data_file
      Unitwise.data_file 'prefix'
    end
  end
end
