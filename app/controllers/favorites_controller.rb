class FavoritesController < ApplicationController
  def index
    @posts = current_user.favorite_posts
  end

  def create
    favorite = current_user.favorites.create(post_id: params[:format])
    redirect_to post_path(params[:format])
  end

  def destroy
    favorite = current_user.favorites.find_by(user_id: current_user.id, post_id: params[:id]).destroy
    redirect_to post_path(params[:id])
  end
end
