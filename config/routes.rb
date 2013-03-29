Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :gateway do
    match '/dotpay_pl/comeback/' => 'dotpay_pl#comeback', :as => :dotpay_pl_comeback
    match '/dotpay_pl/complete/:order_id' => 'dotpay_pl#complete', :as => :dotpay_pl_complete
    match '/dotpay_pl/:gateway_id/:order_id' => 'dotpay_pl#show', :constraints => { :geteway_id => /[0-9]+/ }, :as => :dotpay_pl
  end
end
