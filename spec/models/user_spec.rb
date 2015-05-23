require 'rails_helper'

describe User do 

  include TestFactories
  include Devise::TestHelpers

  describe "#favorited(post)" do

    before do 
      @post = associated_post
      @user = authenticated_user
      sign_in @user
    end

    xit "returns 'nil' if the user has not favorited the post" do 
      expect( @user.favorites.find_by_post_id(@post.id) ).to be_nil
    end

    it "returns the appropriate favorite if it exists" do 
      favorite = @user.favorites.where(post: @post).create
      expect( @user.favorites.find_by_post_id(@post.id) ).not_to be_nil
    end

    xit "returns 'nil' if the user has favorited another post" do 
      expect( )
    end

  end
end