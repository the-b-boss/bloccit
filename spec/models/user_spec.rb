require 'rails_helper'

describe User do 

  include TestFactories
#  include Devise::TestHelpers

  describe "#favorited(post)" do

    before do 
      @post = associated_post
      @user = authenticated_user
#      sign_in @user
    end

    it "returns 'nil' if the user has not favorited the post" do 
      expect( @user.favorited(@post) ).to be_nil
    end

    it "returns the appropriate favorite if it exists" do
      favorite = @user.favorites.create(post_id: @post.id)
      expect( @user.favorited(@post) ).to eq favorite
    end

    it "returns 'nil' if the user has favorited another post" do 
      post2 = associated_post
      favorite = @user.favorites.create(post_id: post2.id)
      expect( @user.favorited(@post) ).to be_nil
    end

  end
end