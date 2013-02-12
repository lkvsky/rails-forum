require 'spec_helper'

describe UsersController do
  describe '#show' do
    let(:user) { double("user") }

    before do
      User.stub(:find).with("1234").and_return(user)
      get :show, { :id => 1234 }
    end

    it "assigns the requested user" do
      assigns(:user).should == user
    end
  end

  describe "#create" do
    let(:params) do
      { :user => {
          :name => "name", :email => "name@gmail.com"
        }
      }
    end

    it "creates the user" do
      expect do
        post :create, params
      end.to change{User.count}.by(1)
    end

    it "redirects after successful create" do
      post :create, params
      expect(response).to redirect_to(root_path)
    end
  end
end
