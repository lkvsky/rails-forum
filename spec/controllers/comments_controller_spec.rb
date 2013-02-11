require 'spec_helper'

describe CommentsController do
  before do
    FactoryGirl.create(:user)
    FactoryGirl.create(:post)
  end

  let(:params) do
    { :comment => {
        :text => "this is a comment!", :user_id => 1, :post_id => 1
      }
    }
  end

  describe "#create" do
    it "creates the comment" do
      expect do
        post :create, params
      end.to change{Comment.count}.by(1)
    end

    it "redirects to the post#show page" do
      post :create, params
      expect(response).to redirect_to(post_path(Post.first))
    end
  end

  describe "#destroy" do
    before do
      post :create, params
    end

    it "destroys the comment" do
      expect do
        delete :destroy, { :id => 1 }
      end.to change{Comment.count}.by(-1)
    end
  end
end
