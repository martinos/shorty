require 'test_helper'

describe AddressesController do
  describe "Given that I am signed in" do
    setup do
      @me = create(:user)
      @bob = create(:user)
      sign_in @me
      @address = create(:address, user_id: @me.id, url: 'http://example.com') 
    end

    it "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:addresses)
    end

    it "should create address" do
      assert_difference('Address.count') do
        post :create, address: { url: @address.url, user_id: @me.id}
      end
      assert_redirected_to addresses_path
    end

    it "should show address" do
      get :show, id: @address
      assert_response :success
    end

    it "should get edit" do
      get :edit, id: @address
      assert_response :success
    end
  end

  describe "with no user signed in" do
    setup do
      @address = build(:address) 
    end

    it "should not create an address and redirect to login" do
      assert_no_difference('Address.count') do
        post :create, address: { url: @address.url  } 
      end
      assert_redirected_to new_user_session_path
    end

    it 'should redirect resolved short url' do
      @address.url = "http://www/example.com"
      @address.save!

      get :short, id: @address.short_path
      assert_redirected_to @address.url
    end

    it 'should return 404 if short url does not exist' do
      get :short, id: 'doesnotexist' 
      assert_response :not_found
    end
  end
end
