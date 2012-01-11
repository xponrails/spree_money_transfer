require 'spree_core'   
require "spree_money_transfer/version"

module SpreeMoneyTransfer
  class Engine < Rails::Engine
    engine_name 'spree_money_transfer'

    config.autoload_paths += %W(#{config.root}/lib)

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.application.config.cache_classes ? require(c) : load(c)
      end

      Dir.glob(File.join(File.dirname(__FILE__), "../app/overrides/*.rb")) do |c|
        Rails.application.config.cache_classes ? require(c) : load(c)
      end

      Dir.glob(File.join(File.dirname(__FILE__), "../app/mailers/*.rb")) do |c|
        Rails.application.config.cache_classes ? require(c) : load(c)
      end
    end

    # register of MoneyTransfer PaymentMethod 
    initializer "spree_money_transfer.register.payment_methods" do |app|
      app.config.spree.payment_methods += [
        PaymentMethod::MoneyTransfer
      ]
    end

    config.to_prepare &method(:activate).to_proc
  end
end
