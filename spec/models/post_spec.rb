require 'spec_helper'

describe Post do
  let(:user) { double("User", :id => 1) }

  subject(:post) { Post.create(:title => "post title", :text => "post text", :user_id => 1)}

  it { should respond_to(:title) }
  it { should respond_to(:text) }
  it { should respond_to(:user_id) }

  it "should validate user_id" do
    post.user_id = nil
    expect { post.save! }.to raise_error
  end
end