FactoryGirl.define do

	sequence(:email) { |n| "user#{n}@test.com" }

	factory :user do
		email 
		password "testerbob"
		first_name "Tester"
		last_name "Bob"
		admin false

		factory :admin_user do
      admin true
    end
	end
end
