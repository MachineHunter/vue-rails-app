module Api
  class UserPagesController < ApplicationController
    def index
      @user = User.find(params[:id])
      @status = @user.status
    end
  end
end
