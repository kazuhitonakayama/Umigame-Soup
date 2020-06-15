class UsersController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
    @all = @user.posts
  end
end
