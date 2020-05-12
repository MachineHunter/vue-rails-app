module Api
  class UserPagesController < ApplicationController
    def index
      @user = if params[:id].zero?
                current_user
              else
                User.find(params[:id])
              end
      @status = @user.status
    end
  end
end
