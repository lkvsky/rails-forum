require 'spec_helper'

describe PostsController do

  describe "#show" do
    let(:post) { double("Post", :user_id => 1) }
    before do
      Post.stub(:find).with("1234").and_return(post)
      get :show, { :id => 1234 }
    end

    it "assigns the requested post" do
      assigns(:post).should == post
    end

    it "renders the show template" do
      expect(response).to render_template("show")
    end
  end

  describe "#create" do
    let(:params) do
      { :post => {
          :title => "title!", :text => "body here", :user_id => 1
        }
      }
    end

    it "creates the post" do
      expect do
        post :create, params
      end.to change{Post.count}.by(1)
    end

    it "redirects after successful create" do
      post :create, params
      expect(response).to redirect_to(root_path)
    end
  end
end
