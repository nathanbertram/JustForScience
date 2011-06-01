class LaunchesController < ApplicationController

  def index
    @launch = Launch.new
  end

  def create
    @launch = Launch.new(params[:launch])
    
    if @launch.save
      redirect_to root_path, :notice => 'thanks'
    else
      render :action => 'index'
    end
  end

end