Feature: Removing a project

    In order to edit a project, the user must be logged in and the user must have a project.
    The project consists of name, description and type.
    The user must fill the three inputs.

    Scenario: User successfully remove a project
        Given the user is logged
            And the user has a project to remove
            And visits the page with the projects
        When the user clicks to remove a project
        Then the project must be removed from the database
