class Api::UserPagesController < ApplicationController
  def index
    @users = User.all
  end
end
