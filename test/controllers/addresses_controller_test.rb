require 'test_helper'

describe AddressesController do
  describe "with one user sign in" do
    setup do
      @me = create(:user)
      sign_in @me
      @address = create(:address, user: @me) 
    end

    it "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:addresses)
    end

    it "should get new" do
      get :new
      assert_response :success
    end

    it "should create address" do
      assert_difference('Address.count') do
        post :create, address: { url: @address.url }
      end

      assert_redirected_to address_path(assigns(:address))
    end

    it "should show address" do
      get :show, id: @address
      assert_response :success
    end

    it "should get edit" do
      get :edit, id: @address
      assert_response :success
    end

    it "should update address" do
      patch :update, id: @address, address: { url: @address.url }
      assert_redirected_to address_path(assigns(:address))
    end

    it "should destroy address" do
      assert_difference('Address.count', -1) do
        delete :destroy, id: @address
      end

      assert_redirected_to addresses_path
    end
  end

  # describe "with no user signed in" do
  #   setup do
  #     @address = build(:address) 
  #   end

  #   it "should not create an address" do
  #     assert_no_difference('Address.count') do
  #       post :create, address: { url: @address.url  } 
  #     end
      
  #     assert_response :forbidden
  #   end
  # end
end
