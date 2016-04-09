Feature: Edit a project

    In order to edit a project, the user must be logged in and the user must have a project.
    The project consists of name, description and type.
    The user must update at least one of the three inputs.

    Scenario: User successfully edit a project
        Given the user is logged in
            And the user has a project
            And visits the page to edit a project
        When the user update a field
        Then the project must be updated in the database
