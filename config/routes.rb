Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    
    get "/", to: 'payments#make_payment'
    
    post "/checkout", to: 'payments#checkout'
    
    root 'payments#make_payment'
    
end
