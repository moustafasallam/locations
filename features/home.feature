Feature: Home page
  visit home page

  Scenario Outline: Viewing application's home page
    Given query=
    When I am on the homepage
    Then result table should have column with title "<title>"

    Examples:
      | title |
      | City |
      | ID |
      | Country |