module MoneyRails
  class Railtie < ::Rails::Railtie
    initializer 'moneyrails.initialize', after: 'active_record.initialize_database' do
      MoneyRails::Hooks.init
    end

    config.to_prepare do |_app|
      ActiveSupport.on_load(:active_record) do
        require_relative "active_model/attributes"
        ::ActiveModel::Attributes.prepend(MoneyRails::ActiveModel::Attributes)
      end
    end
  end
end
