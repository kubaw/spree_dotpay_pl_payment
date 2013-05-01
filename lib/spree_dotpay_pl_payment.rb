module SpreeDotpayPlPayment
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_dotpay_pl_payment'

    config.autoload_paths += %W(#{config.root}/lib)

    initializer 'spree.register.payment_methods' do |app|
      app.config.spree.payment_methods << Spree::PaymentMethod::DotpayPl
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc

  end
end
