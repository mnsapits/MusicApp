class BandsController < ApplicationController
  def index
    if logged_in?
      @bands = Band.all
    else
      redirect_to new_session_url
    end
  end

  def create
    @band = Band.create(band_params)
    if @band.save
      render :show
    else
      flash[:errors] = @band.error.full_messages
      redirect_to new_band_url
    end
  end

  def new
  end

  def edit
    @band = Band.find(params[:id])

  end

  def show
    @band = Band.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end
end
