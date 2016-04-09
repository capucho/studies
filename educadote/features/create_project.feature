Feature: Create a project

    In order to create a project, the user must be logged in.
    The project consists of name, description and type.
    The user must fill the three inputs.

    Scenario: User successfully create a project
        Given the user is logged in and visits the page to create a project
        When the user fills the data
        Then the project must be already stored in the database

    Scenario: User doesn't fill the project name
        Given the user is logged in and visits the page to create a project
        When the user fills the data but doesn't fill the name
        Then the project should not be stored in the database

    Scenario: User doesn't fill the project type
        Given the user is logged in and visits the page to create a project
        When the user fills the data but doesn't fill the project type
        Then the project should not be stored in the database

    Scenario: User doesn't fill the project description
        Given the user is logged in and visits the page to create a project
        When the user fills the data but doesn't fill the description
        Then the project should not be stored in the database
