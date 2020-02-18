Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'question', to: 'games#question', as: :question
  get 'answer', to: 'games#answer', as: :answer
end
