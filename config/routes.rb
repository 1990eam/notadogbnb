Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :bookings, only: [:show]
  end
  resources :notdogs do
    resources :bookings, only: [:new, :create]
    resources :messages, only: [:new, :create, :edit, :update, :destroy]
    resources :reviews, only: [:index]
  end
  resources :bookings, only: [:index, :show, :edit, :update, :destroy] do
    resources :reviews, only: [ :new, :create ]
  end
end

#               root GET    /                                                  pages#home
#    notdog_bookings POST   /notdogs/:notdog_id/bookings(.:format)             bookings#create
# new_notdog_booking GET    /notdogs/:notdog_id/bookings/new(.:format)         bookings#new
#    notdog_messages POST   /notdogs/:notdog_id/messages(.:format)             messages#create
# new_notdog_message GET    /notdogs/:notdog_id/messages/new(.:format)         messages#new
# edit_notdog_message GET    /notdogs/:notdog_id/messages/:id/edit(.:format)   messages#edit
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


#                   Prefix Verb   URI Pattern                                  Controller#Action
#         new_user_session GET    /users/sign_in(.:format)                     devise/sessions#new
#             user_session POST   /users/sign_in(.:format)                     devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                    devise/sessions#destroy
#        new_user_password GET    /users/password/new(.:format)                devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)               devise/passwords#edit
#            user_password PATCH  /users/password(.:format)                    devise/passwords#update
#                          PUT    /users/password(.:format)                    devise/passwords#update
#                          POST   /users/password(.:format)                    devise/passwords#create
# cancel_user_registration GET    /users/cancel(.:format)                      devise/registrations#cancel
#    new_user_registration GET    /users/sign_up(.:format)                     devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                        devise/registrations#edit
#        user_registration PATCH  /users(.:format)                             devise/registrations#update
#                          PUT    /users(.:format)                             devise/registrations#update
#                          DELETE /users(.:format)                             devise/registrations#destroy
#                          POST   /users(.:format)                             devise/registrations#create
#                     root GET    /                                            pages#home
#          notdog_bookings POST   /notdogs/:notdog_id/bookings(.:format)       bookings#create
#       new_notdog_booking GET    /notdogs/:notdog_id/bookings/new(.:format)   bookings#new
#                  notdogs GET    /notdogs(.:format)                           notdogs#index
#                          POST   /notdogs(.:format)                           notdogs#create
#               new_notdog GET    /notdogs/new(.:format)                       notdogs#new
#              edit_notdog GET    /notdogs/:id/edit(.:format)                  notdogs#edit
#                   notdog GET    /notdogs/:id(.:format)                       notdogs#show
#                          PATCH  /notdogs/:id(.:format)                       notdogs#update
#                          PUT    /notdogs/:id(.:format)                       notdogs#update
#                          DELETE /notdogs/:id(.:format)                       notdogs#destroy
#                 bookings GET    /bookings(.:format)                          bookings#index
#             edit_booking GET    /bookings/:id/edit(.:format)                 bookings#edit
#                  booking GET    /bookings/:id(.:format)                      bookings#show
#                          PATCH  /bookings/:id(.:format)                      bookings#update
#                          PUT    /bookings/:id(.:format)                      bookings#update
#          booking_reviews POST   /bookings/:booking_id/reviews(.:format)      reviews#create
#       new_booking_review GET    /bookings/:booking_id/reviews/new(.:format)  reviews#new

