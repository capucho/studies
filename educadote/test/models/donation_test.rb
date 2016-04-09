require 'test_helper'

class DonationTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end

   setup do
        @project = projects(:one)
        @project.save
        @user = users(:all_right)
        @user.save
        @donation = donations(:one)
        @donation.user_id = @user.id
        @donation.project_id = @project.id

   end

   test 'should create new' do
       copy = Donation.new
       copy.value = @donation.value
       copy.save
       assert_equal(copy.value, @donation.value, 'Validando copia do item')
   end

   test 'should change donation value' do
       @donation.value = 15
       @donation.save

       assert_equal(@donation.value, 15, 'Salvando nome item alterado')
   end
   test 'should not save empty donation' do
       donation = Donation.new
       assert_not donation.save, 'Salvou o projeto sem nada '
   end

end
