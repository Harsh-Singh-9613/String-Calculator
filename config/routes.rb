Rails.application.routes.draw do
  root "calculators#index"
  post "calculate", to: "calculators#calculate"
end
