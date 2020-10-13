class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def my_friends
    @friends = current_user.friends
  end

  def search_friends
    render json: params[:friend]
  end

  def search
    if params[:friend].present?
      @friend = params[:friend]
      if @friend
        respond_to do |format|
          format.js { render partial: 'users/friend_result' }
        end
      else
        respond_to do |format|
          flash.now[:alert] = 'Cannot find search.'
          format.js { render partial: 'users/friend_result' }
        end
      end
    else
      respond_to do |format|
        flash[:alert] = 'Please enter a name our email to search.'
        format.js { render partial: 'users/friend_result' }
      end
    end
  end
end
