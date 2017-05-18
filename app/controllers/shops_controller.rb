class ShopsController < ApplicationController
  def index

    render 'index.html.erb'
  end

  def upload
    redirect_to '/uploads/new'
  end

  def users_shops
    user = User.find_by(id: session[:user_id])
    @user = user.username
    p "#"*20
    p params[:age_l]
    p params[:age_h]
    p params[:gender_v]
    p params[:gender_c]
    p "#"*20
    render 'shops.html.erb'
  end
end
