class LaunchController < ApplicationController

  def index
    
  end

  def create
    @launch = Launch.new
    
    if @launch.save
      redirect_to launch_path
    else
      render :action => 'index'
    end
  end

end