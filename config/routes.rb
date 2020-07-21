Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :notdogs do
    resources :bookings, only: [:new, :create]
    resources :messages, only: [:new, :create]
  end
  resources :bookings, only: [:index, :show, :edit, :update]
end

#               root GET    /                                                  pages#home
#    notdog_bookings POST   /notdogs/:notdog_id/bookings(.:format)             bookings#create
# new_notdog_booking GET    /notdogs/:notdog_id/bookings/new(.:format)         bookings#new
#    notdog_messages POST   /notdogs/:notdog_id/messages(.:format)             messages#create
# new_notdog_message GET    /notdogs/:notdog_id/messages/new(.:format)         messages#new
#            notdogs GET    /notdogs(.:format)                                 notdogs#index
#                    POST   /notdogs(.:format)                                 notdogs#create
#         new_notdog GET    /notdogs/new(.:format)                             notdogs#new
#        edit_notdog GET    /notdogs/:id/edit(.:format)                        notdogs#edit
#             notdog GET    /notdogs/:id(.:format)                             notdogs#show
#                    PATCH  /notdogs/:id(.:format)                             notdogs#update
#                    PUT    /notdogs/:id(.:format)                             notdogs#update
#                    DELETE /notdogs/:id(.:format)                             notdogs#destroy
#           bookings GET    /bookings(.:format)                                bookings#index
#       edit_booking GET    /bookings/:id/edit(.:format)                       bookings#edit
#            booking GET    /bookings/:id(.:format)                            bookings#show
#                    PATCH  /bookings/:id(.:format)                            bookings#update
#                    PUT    /bookings/:id(.:format)                            bookings#update

