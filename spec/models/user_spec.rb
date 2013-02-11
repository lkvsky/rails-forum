require 'spec_helper'

describe User do
  subject(:user) { User.create(:name => "jerry", :email => "jerrz@gmail.com") }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:posts) }

  it "validates name" do
    user.name = nil
    expect { user.save! }.to raise_error
  end

  it "validates email" do
    user.email = nil
    expect { user.save! }.to raise_error
  end
end