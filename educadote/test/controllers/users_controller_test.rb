require 'test_helper'

class UsersControllerTest < ActionController::TestCase
    setup do
        @user = users(:all_right)
    end

    test 'should get index' do
        get :index
        assert_response :success
        assert_not_nil assigns(:users)
    end

    test 'should get new' do
        get :new
        assert_response :success
    end

    test 'should create user' do
        @user.password = 'abcd'
        @user.password_confirmation = 'abcd'

        assert_difference('User.count') do
            post(:create, user: { address: @user.address, city: @user.city, country: @user.country, email: "jhcapucho@gmail.com", full_name: @user.full_name, password: @user.password, password_confirmation: @user.password_confirmation, phone_number: @user.phone_number, state: @user.state, user_type: @user.user_type })
        end

        assert_redirected_to user_path(assigns(:user))
    end

    test 'should show user' do
        get :show, id: @user
        assert_response :success
    end

    test 'should update user' do
        patch :update, id: @user, user: { address: @user.address, city: @user.city, country: @user.country, email: @user.email, full_name: @user.full_name, password: @user.password, phone_number: @user.phone_number, state: @user.state, user_type: @user.user_type }
        assert_redirected_to user_path(assigns(:user))
    end

    test "should destroy user" do
      assert_difference('User.count', -1) do
        delete :destroy, id: @user
      end

      assert_redirected_to users_path
    end
end
