Before do

    @user = User.new(:email => 'user_login@example.com', :password => "abcd", :password_confirmation => "abcd", :user_type => '1', :full_name => 'Johnny B. Good', :country => 'Brasil', :state => 'ES', :city => 'Serra', :address => 'Rodovia ES 010', :phone_number => '123456789',
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

Given(/^the user visits the login page$/) do

    visit '/'

    click_on 'Logar'
end

#Scenario 1: Login Successful

When(/^the user fills the email and password with a valid user$/) do

    fill_in 'Email', :with => 'user_login@example.com'
    fill_in 'Senha', :with => 'abcd'

    click_on 'Entrar'

end

Then(/^the user should be logged in$/) do
    #If the 'Sair' button exists, it proves that the user logged in successfully.
    find_link('Sair', :visible => :all).visible?

    click_on 'Sair'

end

#Scenario 2: Login unsuccessful - wrong username

When(/^the user fills the email and password with a invalid email$/) do
    fill_in 'Email', :with => 'user_log@example.com'
    fill_in 'Senha', :with => 'abcd'

    click_on 'Entrar'
end

Then(/^the user should not be logged in$/) do

    #If the 'Logar' button exists, it proves that the user didn't logged successfully
    find_link('Logar', :visible => :all).visible?
end

#Scenario 3: Login unsuccessful - wrong email

When(/^the user fills the email and password with a invalid password$/) do
    fill_in 'Email', :with => 'user_login@example.com'
    fill_in 'Senha', :with => 'abcdefg'

    click_on 'Entrar'
end
