class Api::UserPagesController < ApplicationController
  def index
    @user = current_user
  end
end
