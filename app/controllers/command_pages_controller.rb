class CommandPagesController < ApplicationController
  def index; end

  def new; end

  def show; end

  def download
    @command = Command.find(params[:id])
    @command_file = @command.command_file
    @zipdata = @command_file.zipdata
    send_data(@zipdata, type: 'application/zip', filename: @command_file.filename)
  end
end
