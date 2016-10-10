require 'rails_helper'

describe UsersController, :type => :controller do
  #let(:user) {User.create!(email: "peter@example.com", password: "1234567890")}
  #let(:user2) {User.create!(email: "peter2@gmail.com", password: "1234567890")}
  user = FactoryGirl.create(:user)
  user2 = FactoryGirl.create(:user) #, email: "peter9@gmail.com")

  describe 'GET #show' do
    context "user is logged in" do
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
      it 'redirects to log in' do
        get :show, id: user.id
        expect(response).to redirect_to(root_path)
      end
    end

    context "User cannot access another users page" do
      it 'user cannot access user2 page' do
        get :show, id: user2.id
        expect(response).to redirect_to(root_path)
        expect(response).to have_http_status(302)
      end
    end
  end
end
