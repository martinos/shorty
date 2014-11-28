class AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @addresses = current_user.addresses
    respond_with(@addresses)
  end

  def show
    respond_with(@address)
  end

  def new
    @address = Address.new
    respond_with(@address)
  end

  def create
    @address = current_user.addresses.build(address_params)
    authorize @address
    @address.save
    respond_with(@address)
  end

  def destroy
    authorize @address
    @address.destroy
    respond_with(@address)
  end

  private

    def set_address
      @address = Address.find(params[:id])
    end

    def address_params
      params.require(:address).permit(:url)
    end
end
