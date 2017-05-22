require 'rails_helper'

describe UsersController, type: :controller do

	let(:user) {User.create!(email: "testerbob@test.com", password: "testerbob")}
	let(:different_user) {User.create!(email: "testeranne@test.com", password: "testeranne")}

	describe 'GET #show' do
		context 'User is logged in' do
			before do
				sign_in user
			end

			it "loads correct user details" do
				get :show, id: user.id
				expect(response).to have_http_status(200)
				expect(assigns(:user)).to eq user
			end
		end

		context 'No user is logged in' do
			it 'redirects to login' do
				get :show, id: user.id
				expect(response).to redirect_to(new_user_session_path)
			end
		end

		context 'User tries to GET #show from different user' do
			before do
				sign_in different_user
			end

			it 'is not allowed to view user show' do
				get :show, id: user.id
				expect(response).to redirect_to(root_path)
			end
		end				
	end	
end