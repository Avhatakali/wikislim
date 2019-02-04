class PlacesController < ApplicationController

  def index

  end

  def show

  end

  def new
      @business = Business.find(params[:business_id])
      @place = @business.places.new
  end

  def edit
      @place = Place.find(params[:id])
      @business = Business.find(params[:business_id])
      @business = @place.business
  end

  def create
    @business = Business.find(params[:business_id])
    @place = @business.places.create(place_params)

    if @place.save
        redirect_to business_path(@business)
    else
        render 'new'
    end
  end

  def update
    @place = Place.find(params[:id])
    @business = @place.business

    if @place.update(place_params)
      redirect_to business_path(@business)
    else
      render 'edit'
    end
  end

  def destroy
      @business = Business.find(params[:business_id])
      @place = @business.places.find(params[:id])
      @place.destroy

      redirect_to business_path(@business)
  end
  private
    def place_params
        params.require(:place).permit(:name, :address, :phone, :website, :hours_of_oparation)
    end
end
