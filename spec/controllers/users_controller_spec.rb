require 'rails_helper'

describe UsersController, type: :controller do

	#let(:user) {User.create!(email: "testerbob@test.com", password: "testerbob")}
	#let(:different_user) {User.create!(email: "testeranne@test.com", password: "testeranne")}
	before do
		@user = FactoryGirl.create(:user)
	end


	describe 'GET #show' do
		context 'User is logged in' do
			before do
				sign_in @user
			end

			it "loads correct user details" do
				get :show, params:{id: @user.id}
				expect(response).to have_http_status(200)
				expect(assigns(:user)).to eq @user
			end
		end

		context 'No user is logged in' do
			it 'redirects to login' do
				get :show, params:{id: @user.id}
				expect(response).to redirect_to(new_user_session_path)
			end
		end

		context 'User tries to GET #show from different user' do
			before do
				sign_in @user
			end

			it 'is not allowed to view user show' do
				@different_user = FactoryGirl.create(:user)
				get :show, params:{id: @different_user.id}
				expect(response).to redirect_to(root_path)
			end
		end				
	end	
end