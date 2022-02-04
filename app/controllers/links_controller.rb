class LinksController < ApplicationController
  def show 
    @link = Link.find_by(slug: params[:slug])
    if @link
      redirect_to @link.url
    else
      render 'errors/404', status: 404
    end
  end

  def new 
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    respond_to do |format|
      if @link.save
        format.js
      else
        format.html { render :new }
      end
    end
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end
