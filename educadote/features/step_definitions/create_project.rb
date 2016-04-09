Before do

    #Create user
    @user = User.new(:email => 'create_project@example.com', :password => "abcd", :password_confirmation => "abcd", :user_type => '1', :full_name => 'Johnny B. Good', :country => 'Brasil', :state => 'ES', :city => 'Serra', :address => 'Rodovia ES 010',
    :phone_number => '123456789', :confirmed_at => Time.current, :confirmation_token => '')

    @user.save!

    #This is to ensure the user is not logged in
    current_driver = Capybara.current_driver
    begin
        Capybara.current_driver = :rack_test
        page.driver.submit :delete, user_sessions_path, {}
    ensure
        Capybara.current_driver = current_driver
    end

end

Given(/^the user is logged in and visits the page to create a project$/) do

    visit "/"
    click_on 'Logar'

    fill_in 'Email', :with => 'create_project@example.com'
    fill_in 'Senha', :with => 'abcd'

    click_button 'Entrar'
    click_on 'Cadastrar Projetos'

end

#Scenario 1: Successfull

When(/^the user fills the data$/) do

    fill_in 'Name', :with => 'Teste Cucumber'
    fill_in 'Project type', :with => 'Teste 1'
    fill_in 'Description', :with => 'Teste 1'

    click_button 'Criar Project'

end

Then(/^the project must be already stored in the database$/) do
    project = Project.find_by name: 'Teste Cucumber'

    assert_equal(project.description, 'Teste 1')

    click_on 'Sair'

end

#Scenario 2

When(/^the user fills the data but doesn't fill the name$/) do

  fill_in 'Project type', :with => 'Teste 1'
  fill_in 'Description', :with => 'Teste 1'

  click_button 'Criar Project'
end

Then(/^the project should not be stored in the database$/) do
    find_button('Criar Project', :visible => :all).visible?
end

#Scenario 3

When(/^the user fills the data but doesn't fill the project type$/) do
    fill_in 'Name', :with => 'Teste Cucumber'
    fill_in 'Description', :with => 'Teste 1'

end

#Scenario 4
When(/^the user fills the data but doesn't fill the description$/) do
    fill_in 'Name', :with => 'Teste Cucumber'
    fill_in 'Project type', :with => 'Teste 1'

end
