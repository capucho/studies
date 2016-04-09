require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  setup do
      @project = projects(:one)
  end

  test 'should create new' do
      copy = Project.new
      copy.name = @project.name

      assert_equal(copy.name, @project.name, 'Validando copia do usuario')
  end

  test 'should change project name' do
      @project.name = 'Testando'
      @project.save

      assert_equal(@project.name, 'Testando', 'Salvando nome usuario alterado')
  end

  # Testing the validations

  test 'should not save empty project' do
      project_test = Project.new
      assert_not project_test.save, 'Salvou o projeto sem nada '
  end

  test 'should not save project invalid project type' do
      project_test = projects(:empty_project_type)
      assert_not project_test.save, 'Salvou projeto com tipo incorreto'
  end
  
  test 'should not save project invalid description' do
      project_test = projects(:empty_description)
      assert_not project_test.save, 'Salvou usuario com descricao invalido'
  end

  test 'should not save project invalid name' do
      project_test = projects(:empty_name)
      assert_not project_test.save, 'Salvou usuario com nome invalido'
  end

end
