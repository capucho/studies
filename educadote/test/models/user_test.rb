require 'test_helper'
require 'bcrypt'


class UserTest < ActiveSupport::TestCase


    setup do
        @user = users(:all_right)
    end

    test 'the truth' do
        assert true
    end

    test 'should create new' do
        copy = User.new
        copy.full_name = @user.full_name

        assert_equal(copy.full_name, @user.full_name, 'Validando copia do usuario')
    end

    test 'should change user name' do
        @user.full_name = 'Testando'
        @user.save

        assert_equal(@user.full_name, 'Testando', 'Salvando nome usuario alterado')
    end

    # Testing the validations

    test 'should not save empty user' do
        user_test = User.new
        assert_not user_test.save, 'Salvou o usuario sem nome e email'
    end

    test 'should not save user invalid name' do
        user_test = users(:name_too_small)
        assert_not user_test.save, 'Salvou usuario com nome menor que 3 caracteres'
    end

    test 'should not save user invalid email' do
        user_test = users(:email_invalid)
        assert_not user_test.save, 'Salvou usuario com email incorreto'
    end

    test 'should not save user invalid state' do
        user_test = users(:state_invalid)
        assert_not user_test.save, 'Salvou usuario com Estado invalido'
    end

    #Testing authentication
    test 'should be logged in' do
        user_test = users(:all_right)
        user_test.confirmed_at = Time.now
        user_test.confirmation_token = ''
        user_test.password_digest = BCrypt::Password.create("abcd")

        assert user_test.authenticate("abcd")



    end

end
