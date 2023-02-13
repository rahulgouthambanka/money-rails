module MoneyRails
  module ActiveModel
    module Attributes
      private

      if Gem::Version.new(Rails.version) >= Gem::Version.new("6.1")
        def _write_attribute(*args)
          super(*args)
        end

        def write_attribute(*args)
          _write_attribute(*args)
        end
      end
    end
  end
end
