Feature: Login

    In order to do anything, the user must login in the website.

    Scenario: User successfully login in the website
        Given the user visits the login page
        When the user fills the email and password with a valid user
        Then the user should be logged in


    Scenario: User email is wrong
        Given the user visits the login page
        When the user fills the email and password with a invalid email
        Then the user should not be logged in

    Scenario: User password is wrong
        Given the user visits the login page
        When the user fills the email and password with a invalid password
        Then the user should not be logged in
