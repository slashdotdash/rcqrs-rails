class <%= class_name %>Controller < ApplicationController
  def new
    @command = <%= class_name %>Command.new
  end
  
  def create
    @command = <%= class_name %>Command.new(params[:command])
    if @command.valid?
      publish(@command)
      redirect_to root_path
    else
      render :action => 'new'
    end
  end
end