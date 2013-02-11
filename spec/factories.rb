FactoryGirl.define do
  factory :user do
    name 'name'
    email 'e@mail.com'
  end
  factory :post do
    title 'this is the post title'
    text 'this is the post text'
    user_id 1
  end
end