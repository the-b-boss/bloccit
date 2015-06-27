FactoryGirl.define do 
  factory :comment do 
    body "This is a new comment."
    user
    post

    after(:build) do |comment| 
      comment.class.skip_callback(:create, :after, :send_favorites_emails)
    end
  end
end
