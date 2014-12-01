class AddressesController < ApplicationController
  before_action :authenticate_user!, except: [:short]
  before_action :set_address, only: [:show, :edit, :update]

  respond_to :html, :json

  def index
    @address = Address.new
    @addresses = current_user.addresses.order_by("created_at DESC")
    respond_with(@addresses)
  end

  def show
    respond_with(@address)
  end

  def create
    @address = current_user.addresses.build(address_params)
    authorize @address

    respond_to do |format|
      if @address.save
        format.html { redirect_to action: :index }
        format.json { render json: @address }
        format.js { }
      else
        format.html { render action: "new" }
        format.xml { render json: @address }
      end
    end
  end
  
  def short
    @address = Address.where(:short_path => params[:id]).first
    if @address
      @address.access_count += 1
      @address.save!
      redirect_to @address.url
    else
      render :file => "#{Rails.root}/public/404.html",  :status => 404
    end
  end

  private

    def set_address
      @address = Address.find(params[:id])
    end

    def address_params
      params.require(:address).permit(:url)
    end
end
