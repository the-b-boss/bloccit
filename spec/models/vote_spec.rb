require 'rails_helper'


describe Vote do
  describe "validations" do

    describe "value validation" do

      before do 
        @post = Post.create(title: 'Post title', body: 'Post bodies must be pretty long.')
        @vote = @post.votes.create(value: '3')
      end

      it "only allows -1 or 1 as values" do
        expect(@vote.valid?).to eq(false)
      end
    end
  end
end