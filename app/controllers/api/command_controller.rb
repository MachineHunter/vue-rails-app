module Api
  class CommandController < ApplicationController
    def index
      @commands = current_user.command.all
    end
  end
end
