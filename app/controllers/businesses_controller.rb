class BusinessesController < ApplicationController

  def index
      @businesses = Business.all
  end

  def show
      @business = Business.find(params[:id])
  end
  def new
      @business = Business.new
  end

  def edit
      @business = Business.find(params[:id])
  end

  def create
      @business = Business.create(business_params)

      if @business.save
          redirect_to business_path(@business)
      else
          render 'new'
      end
  end

  def update
      @business = Business.find(params[:id])

      if @business.update(business_params)
        redirect_to businesses_path(@business)
      else
        render 'edit'
      end
  end

  def destroy
      @business = Business.find(params[:id])
      @business.destroy

      redirect_to businesses_path(@business)
  end

  private
    def business_params
        params.require(:business).permit(:business_type)
    end
end
