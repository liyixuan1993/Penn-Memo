# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'Test User'
    email 'example@example.com'
    password 'changeme'
    password_confirmation 'changeme'
    admin false
  end

  factory :admin, class: User do
  	name "Admin"
  	email 'chenw4@seas.upenn.edu'
  	password 'abcde'
  	password_confirmation 'abcde'
    admin true
  end
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  
end