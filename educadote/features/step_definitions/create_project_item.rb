Before do

    @user = User.new(:email => 'create_project_item@example.com', :password => "abcd", :password_confirmation => "abcd", :user_type => '1', :full_name => 'Johnny B. Good', :country => 'Brasil', :state => 'ES', :city => 'Serra', :address => 'Rodovia ES 010', :phone_number => '123456789',
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

Given(/^I am a logged in professor$/) do
    visit '/'

    click_on 'Logar'

    fill_in 'Email', :with => 'create_project_item@example.com'
    fill_in 'Senha', :with => 'abcd'

    click_on 'Entrar'

end

Given(/^I have a project$/) do
    click_on 'Cadastrar Projetos'

    fill_in 'Name', :with => 'Project adding item'
    fill_in 'Project type', :with => 'add item'
    fill_in 'Description', :with => 'Add Item'

    click_button 'Criar Project'

end

When(/^I click to add an item$/) do
    click_on 'Meus projetos'

    click_on 'Adicionar Item no projeto'



end

When(/^fill the fields$/) do


    fill_in 'Name', :with => 'New Item'

    fill_in 'Description', :with => 'Add Item'

    fill_in 'Price', :with => '10.0'

    click_on 'Criar'
end

Then(/^I should have an item associated to a project$/) do
    #if the edit button showed up is because created the item
    find_link('Edit', :visible => :all).visible?
end
