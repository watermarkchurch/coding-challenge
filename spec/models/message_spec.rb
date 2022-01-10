require 'rails_helper'

RSpec.describe Message, type: :model do
  
  it "should be valid" do
    expect(Message.new(title: "Test Message", content: "Lorem ipsum")).to be_valid  
  end

  it "should not be valid with empty title" do
    expect(Message.new(title: "", content: "Lorem ipsum")).to_not be_valid  
  end

  it "should not be valid with empty content" do
    expect(Message.new(title: "Test Message", content: "")).to_not be_valid  
  end

  it "should not be valid with empty title and content" do
    expect(Message.new(title: "", content: "")).to_not be_valid  
  end
  
end
