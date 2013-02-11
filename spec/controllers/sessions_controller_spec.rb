require 'spec_helper'

describe SessionsController do
  before do
    FactoryGirl.create(:user)
    post :create, { :user => { :email => User.first.email } }
  end

  describe "#create" do
    it "assigns the session's session token equal to user's" do
      User.first.session_token.should == session[:session_token]
    end
  end

  describe "#destroy" do
    before do
      delete :destroy, { :id => User.first.id }
    end

    it "sets the session_token to nil for session and user" do
      session[:session_token].should be_nil
    end

    it "sets the session_token to nil for session and user" do
      User.first.session_token.should be_nil
    end
  end
end
