# == Route Map
#
#                   Prefix Verb     URI Pattern                    Controller#Action
#              rails_admin          /admin                         RailsAdmin::Engine
#                     root GET      /                              home#index
#                responses GET      /responses(.:format)           responses#index
#                          POST     /responses(.:format)           responses#create
#             new_response GET      /responses/new(.:format)       responses#new
#            edit_response GET      /responses/:id/edit(.:format)  responses#edit
#                 response GET      /responses/:id(.:format)       responses#show
#                          PATCH    /responses/:id(.:format)       responses#update
#                          PUT      /responses/:id(.:format)       responses#update
#                          DELETE   /responses/:id(.:format)       responses#destroy
#                user_tags GET      /user_tags(.:format)           user_tags#index
#                          POST     /user_tags(.:format)           user_tags#create
#             new_user_tag GET      /user_tags/new(.:format)       user_tags#new
#            edit_user_tag GET      /user_tags/:id/edit(.:format)  user_tags#edit
#                 user_tag GET      /user_tags/:id(.:format)       user_tags#show
#                          PATCH    /user_tags/:id(.:format)       user_tags#update
#                          PUT      /user_tags/:id(.:format)       user_tags#update
#                          DELETE   /user_tags/:id(.:format)       user_tags#destroy
#         new_user_session GET      /users/sign_in(.:format)       devise/sessions#new
#             user_session POST     /users/sign_in(.:format)       devise/sessions#create
#     destroy_user_session DELETE   /users/sign_out(.:format)      devise/sessions#destroy
#            user_password POST     /users/password(.:format)      devise/passwords#create
#        new_user_password GET      /users/password/new(.:format)  devise/passwords#new
#       edit_user_password GET      /users/password/edit(.:format) devise/passwords#edit
#                          PATCH    /users/password(.:format)      devise/passwords#update
#                          PUT      /users/password(.:format)      devise/passwords#update
# cancel_user_registration GET      /users/cancel(.:format)        devise/registrations#cancel
#        user_registration POST     /users(.:format)               devise/registrations#create
#    new_user_registration GET      /users/sign_up(.:format)       devise/registrations#new
#   edit_user_registration GET      /users/edit(.:format)          devise/registrations#edit
#                          PATCH    /users(.:format)               devise/registrations#update
#                          PUT      /users(.:format)               devise/registrations#update
#                          DELETE   /users(.:format)               devise/registrations#destroy
#                    memos GET      /memos(.:format)               memos#index
#                          POST     /memos(.:format)               memos#create
#                 new_memo GET      /memos/new(.:format)           memos#new
#                edit_memo GET      /memos/:id/edit(.:format)      memos#edit
#                     memo GET      /memos/:id(.:format)           memos#show
#                          PATCH    /memos/:id(.:format)           memos#update
#                          PUT      /memos/:id(.:format)           memos#update
#                          DELETE   /memos/:id(.:format)           memos#destroy
#                          GET|POST /memos/:id(.:format)           memos#show
#                     tags GET      /tags(.:format)                tags#index
#                          POST     /tags(.:format)                tags#create
#                  new_tag GET      /tags/new(.:format)            tags#new
#                 edit_tag GET      /tags/:id/edit(.:format)       tags#edit
#                      tag GET      /tags/:id(.:format)            tags#show
#                          PATCH    /tags/:id(.:format)            tags#update
#                          PUT      /tags/:id(.:format)            tags#update
#                          DELETE   /tags/:id(.:format)            tags#destroy
#
# Routes for RailsAdmin::Engine:
#   dashboard GET         /                                      rails_admin/main#dashboard
#       index GET|POST    /:model_name(.:format)                 rails_admin/main#index
#         new GET|POST    /:model_name/new(.:format)             rails_admin/main#new
#      export GET|POST    /:model_name/export(.:format)          rails_admin/main#export
# bulk_delete POST|DELETE /:model_name/bulk_delete(.:format)     rails_admin/main#bulk_delete
# bulk_action POST        /:model_name/bulk_action(.:format)     rails_admin/main#bulk_action
#        show GET         /:model_name/:id(.:format)             rails_admin/main#show
#        edit GET|PUT     /:model_name/:id/edit(.:format)        rails_admin/main#edit
#      delete GET|DELETE  /:model_name/:id/delete(.:format)      rails_admin/main#delete
# show_in_app GET         /:model_name/:id/show_in_app(.:format) rails_admin/main#show_in_app
#

Rails.application.routes.draw do
  get 'memolist/index'

  get 'priority_page/index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'home#index'

  resources :responses
  resources :user_tags
  devise_for :users

  resources :memos do
  match 'memos/:id' => 'memos#show', via: [:get, :post]
  collection do
    get'sort/:field' => 'memos#sort'
  end
  end


  resources :memos
  get "memos/:id/unreadToRead" => "memos#unreadToRead", :as => "activate_notification"
  match "memos/:id/unreadToRead" => "memos#unreadToRead", via: [:get, :put]

  resources :unreads

  resources :tags


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
