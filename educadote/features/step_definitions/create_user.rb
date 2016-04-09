Before do

    #This is to ensure the user is not logged in
    current_driver = Capybara.current_driver
    begin
        Capybara.current_driver = :rack_test
        page.driver.submit :delete, user_sessions_path, {}
    ensure
        Capybara.current_driver = current_driver
    end

end

Given(/^I am at the user creation page$/) do
    visit "/"
    click_on 'Cadastrar Usuario'
end

When(/^I input the user data correctly$/) do
    fill_in 'Nome completo', :with => 'Joao Capucho'
    fill_in 'Email', :with => 'testando@email.com'
    fill_in 'Pais', :with => 'Brasil'
    fill_in 'Cidade', :with => 'Serra'
    fill_in 'Estado', :with => 'ES'
    fill_in 'Endereco', :with => 'Rodovia ES 010'
    fill_in 'Telefone', :with => '123456789'
    fill_in 'Senha', :with => 'abcde'
    fill_in 'Confirme sua senha', :with => 'abcde'

    click_on 'Criar'

end

Then(/^I should have a user stored in the database$/) do
    user = User.find_by email: 'testando@email.com'

    assert_equal(user.email, 'testando@email.com')
end


#scenario 2

When(/^I input the name too small$/) do
    fill_in 'Nome completo', :with => 'Jo'
    fill_in 'Email', :with => 'testando@email.com'
    fill_in 'Pais', :with => 'Brasil'
    fill_in 'Cidade', :with => 'Serra'
    fill_in 'Estado', :with => 'ES'
    fill_in 'Endereco', :with => 'Rodovia ES 010'
    fill_in 'Telefone', :with => '123456789'
    fill_in 'Senha', :with => 'abcde'
    fill_in 'Confirme sua senha', :with => 'abcde'

    click_on 'Criar'
end

Then(/^I should not have a user stored in the database$/) do
    #If the 'Criar' button exists, it proves that the user didn't logged successfully
    find_button('Criar', :visible => :all).visible?
end

#scenario 3

When(/^I input a invalid email$/) do
    fill_in 'Nome completo', :with => 'Joao Henrique'
    fill_in 'Email', :with => 'testandoemail.com'
    fill_in 'Pais', :with => 'Brasil'
    fill_in 'Cidade', :with => 'Serra'
    fill_in 'Estado', :with => 'ES'
    fill_in 'Endereco', :with => 'Rodovia ES 010'
    fill_in 'Telefone', :with => '123456789'
    fill_in 'Senha', :with => 'abcde'
    fill_in 'Confirme sua senha', :with => 'abcde'

    click_on 'Criar'
end

#scenario 4

When(/^I input a invalid country$/) do
    fill_in 'Nome completo', :with => 'Joao Henrique'
    fill_in 'Email', :with => 'testandoemail.com'
    fill_in 'Cidade', :with => 'Serra'
    fill_in 'Estado', :with => 'ES'
    fill_in 'Endereco', :with => 'Rodovia ES 010'
    fill_in 'Telefone', :with => '123456789'
    fill_in 'Senha', :with => 'abcde'
    fill_in 'Confirme sua senha', :with => 'abcde'

    click_on 'Criar'
end

#scenario 5

When(/^I input a invalid state$/) do
    fill_in 'Nome completo', :with => 'Joao Henrique'
    fill_in 'Email', :with => 'testandoemail.com'
    fill_in 'Pais', :with => 'Brasil'
    fill_in 'Cidade', :with => 'Serra'
    fill_in 'Estado', :with => 'ESAF'
    fill_in 'Endereco', :with => 'Rodovia ES 010'
    fill_in 'Telefone', :with => '123456789'
    fill_in 'Senha', :with => 'abcde'
    fill_in 'Confirme sua senha', :with => 'abcde'

    click_on 'Criar'
end

#scenario 6

When(/^I input a invalid address$/) do
    fill_in 'Nome completo', :with => 'Joao Henrique'
    fill_in 'Email', :with => 'testandoemail.com'
    fill_in 'Pais', :with => 'Brasil'
    fill_in 'Cidade', :with => 'Serra'
    fill_in 'Estado', :with => 'ES'

    fill_in 'Telefone', :with => '123456789'
    fill_in 'Senha', :with => 'abcde'
    fill_in 'Confirme sua senha', :with => 'abcde'

    click_on 'Criar'
end

#scenario 7

When(/^I input a invalid phone$/) do
    fill_in 'Nome completo', :with => 'Joao Henrique'
    fill_in 'Email', :with => 'testandoemail.com'
    fill_in 'Pais', :with => 'Brasil'
    fill_in 'Cidade', :with => 'Serra'
    fill_in 'Estado', :with => 'ES'
    fill_in 'Endereco', :with => 'Rodovia ES 010'
    fill_in 'Senha', :with => 'abcde'
    fill_in 'Confirme sua senha', :with => 'abcde'

    click_on 'Criar'
end

When(/^I input a different password and password confirmation$/) do
    fill_in 'Nome completo', :with => 'Joao Henrique'
    fill_in 'Email', :with => 'testandoemail.com'
    fill_in 'Pais', :with => 'Brasil'
    fill_in 'Cidade', :with => 'Serra'
    fill_in 'Estado', :with => 'ES'
    fill_in 'Endereco', :with => 'Rodovia ES 010'
    fill_in 'Telefone', :with => '123456789'
    fill_in 'Senha', :with => 'abcdefega'
    fill_in 'Confirme sua senha', :with => 'abcde'

    click_on 'Criar'
end
