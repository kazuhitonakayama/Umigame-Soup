class UsersController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
    @all = @user.posts

    @likes=Like.where(user_id: @user.id)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = 'ユーザーを削除しました。'
    redirect_to :root
  end
end
