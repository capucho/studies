Before do
 @user = User.new(email: 'edit_user@example.com', password: 'abcd', password_confirmation: 'abcd', user_type: '1', full_name: 'Johnny B. Good', country: 'Brasil', state: 'ES', city: 'Serra', address: 'Rodovia ES 010', phone_number: '123456789',
                  confirmed_at: Time.current, confirmation_token: '')

 @user.save!

 # This is to ensure the user is not logged in
 current_driver = Capybara.current_driver
 begin
  Capybara.current_driver = :rack_test
  page.driver.submit :delete, user_sessions_path, {}
 ensure
  Capybara.current_driver = current_driver
 end
end

Given(/^I am logged in as an user$/) do
 visit '/'

 click_on 'Logar'

 fill_in 'Email', with: 'edit_project@example.com'
 fill_in 'Senha', with: 'abcd'

 click_on 'Entrar'
end

Given(/^I am at the user edition page$/) do
 click_on 'Meu Perfil'
 click_on 'Edit'
end

When(/^I edit the user data correctly$/) do
 fill_in 'Cidade', with: 'Vix'

 fill_in 'Senha', with: 'admin'
 fill_in 'Confirme sua senha', with: 'admin'

 click_on 'Criar'
end

Then(/^I should have a user updated in the database$/) do
 find_link 'Edit'

 click_on 'Sair'
end
