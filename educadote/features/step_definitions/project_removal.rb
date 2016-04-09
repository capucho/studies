Before do

    @user = User.new(:email => 'remove_project@example.com', :password => "abcd", :password_confirmation => "abcd", :user_type => '1', :full_name => 'Johnny B. Good', :country => 'Brasil', :state => 'ES', :city => 'Serra', :address => 'Rodovia ES 010', :phone_number => '123456789',
    :confirmed_at => Time.current, :confirmation_token => '')

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

Given(/^the user is logged$/) do
    visit '/'

    click_on 'Logar'

    fill_in 'Email', :with => 'edit_project@example.com'
    fill_in 'Senha', :with => 'abcd'

    click_on 'Entrar'
end

Given(/^the user has a project to remove$/) do
    click_on 'Cadastrar Projetos'

    fill_in 'Name', :with => 'Project removal'
    fill_in 'Project type', :with => 'add item'
    fill_in 'Description', :with => 'Add Item'

    click_button 'Criar Project'
end


Given(/^visits the page with the projects$/) do
    click_on 'Meus projetos'

end

When(/^the user clicks to remove a project$/) do
    click_on 'Remover'

end

Then(/^the project must be removed from the database$/) do
    project = Project.find_by name: 'Project removal'

    assert_equal(project, nil)
end
