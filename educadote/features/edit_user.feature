Feature: Edit user

    In order to edit a user successfully, the following rules apply:

    The fields full_name, email, country, state, city, address, password_digest must be present.
    The name must be bigger then 3 chars.
    The email must be unique and valid.

    Scenario: Edit a user sucessfully
        Given I am logged in as an user
            And I am at the user edition page
        When I edit the user data correctly
        Then I should have a user updated in the database
