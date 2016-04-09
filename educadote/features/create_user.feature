Feature: Create user

    In order to create a user successfully, the following rules apply:

    The fields full_name, email, country, state, city, address, password_digest must be present.
    The name must be bigger then 3 chars.
    The email must be unique and valid.


    Scenario: Creating a user sucessfully
        Given I am at the user creation page
        When I input the user data correctly
        Then I should have a user stored in the database

    Scenario: Creating a user unsuccessfully due to name too small
        Given I am at the user creation page
        When I input the name too small
        Then I should not have a user stored in the database

    Scenario: Creating a user unsuccessfully due to invalid email
        Given I am at the user creation page
        When I input a invalid email
        Then I should not have a user stored in the database

    Scenario: Creating a user unsuccessfully due to invalid country
        Given I am at the user creation page
        When I input a invalid country
        Then I should not have a user stored in the database

    Scenario: Creating a user unsuccessfully due to invalid state
        Given I am at the user creation page
        When I input a invalid state
        Then I should not have a user stored in the database

    Scenario: Creating a user unsuccessfully due to invalid address
        Given I am at the user creation page
        When I input a invalid address
        Then I should not have a user stored in the database

    Scenario: Creating a user unsuccessfully due to invalid phone
        Given I am at the user creation page
        When I input a invalid phone
        Then I should not have a user stored in the database

    Scenario: Creating a user unsuccessfully due to different password and password confirmation
        Given I am at the user creation page
        When I input a different password and password confirmation
        Then I should not have a user stored in the database
