module Api
  class UserPagesController < ApplicationController
    def index
      @user = current_user
    end
  end
end
