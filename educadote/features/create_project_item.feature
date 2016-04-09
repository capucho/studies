Feature: Adding an item to a project

    In order to make the project, the teacher must add the itens that will be bought for the project.

    Scenario:
        Given I am a logged in professor
            And I have a project
        When I click to add an item
            And fill the fields
        Then I should have an item associated to a project
