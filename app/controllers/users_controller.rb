class UsersController < ApplicationController

  expose(:user, attributes: :user_params)
  expose(:found_users) { User.by_search_params(search_params).order(order_params) }

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if user.save
      redirect_to user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def update
    if user.save
      redirect_to user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :projects_ids)
  end

  def search_params
    return {} unless params[:users]
    params.require(:users).permit(:first_name, :last_name, :email, :projects_ids)
  end

  def order_params
    params[:order]
  end
end
