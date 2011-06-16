class SuggestionsController < ApplicationController
  def new
    @suggestion = Suggestion.new
  end

  def create
    @suggestion = Suggestion.new(params[:suggestion])
    
    if @suggestion.save
      redirect_to root_path, :notice => 'sponsor'
    else
      render :action => 'new'
    end
  end

end
