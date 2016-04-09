require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  setup do
       @project = projects(:one)
       @project.save
       @item = items(:one)
       @item.project_id = @project.id

  end

   test 'should create new' do
       copy = Item.new
       copy.name = @item.name
       copy.save
       assert_equal(copy.name, @item.name, 'Validando copia do item')
   end

   test 'should change item name' do
       @item.name = 'Testando'
       @item.save

       assert_equal(@item.name, 'Testando', 'Salvando nome item alterado')
   end

   #Testing the validations

   test 'should not save empty item' do
       item_test = Item.new
       assert_not item_test.save, 'Salvou o projeto sem nada '
   end

   test 'should not save item invalid item type' do
       item_test = items(:empty_name)
       assert_not item_test.save, 'Salvou projeto com tipo incorreto'
   end

   test 'should not save item invalid description' do
       item_test = items(:empty_description)
       assert_not item_test.save, 'Salvou item com descricao invalido'
   end

   test 'should not save item invalid name' do
       item_test = items(:empty_price)
       assert_not item_test.save, 'Salvou item com nome invalido'
   end


end
