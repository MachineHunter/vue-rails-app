module Api
  class UserPagesController < ApplicationController
    def show
      @user = if params[:id].to_i.zero?
                current_user
              else
                User.find(params[:id])
              end
      @status = @user.status
    end
  end
end
