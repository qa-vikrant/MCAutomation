Feature: API - Login as a registered user

  As a registered user
  I want to get logged into on marketcube
  So that I am able to access the platform and manage my inventory

  Scenario: Login with valid registered user details
    When User is enters email and password
    |email                     | password  |
    |systemadmin@marketcube.io | 123456789 |
    Then user should be able to login to the system

  Scenario Outline: Verify that User is not able to Login with invalid Username and invalid Password
    When User is enters email and password
      |email   | password  |
      |<email> | <password> |
    Then user should not be able to login to system
    Examples:
      |email | password  |
      | ytfytvtvytvabc@gmail.com | 12345678999 |
      | systemadmin@marketcube.io | 123452236789 |
      | systemadmin11@marketcube.io | 123456789 |

  Scenario: Verify that validation message is displayed in the case when User leaves Username or Password as blank
    When User is enters email and password
      |email   | password  |
      |        |           |
    When User is enters email and password
      |email   | password  |
      | systemadsklfjkldsjflksdjlkfjsdlkfjlksdjflksdjlkfjsklfjlksdjflksjlkfjslkjflksjdflksdjlkfjdslkfjklsdjflkdsjflkdsjlkfjsdlkdjflksdjflksdjlfkjsdlkfjsdlkdmin@marketcube.io | 123456789234082309809283094802938409823098409283098409283094809283094820938409283094820938409238409 |
      | &*(&(*&*(&(*&(*&*(&(*&*(&* | *(&(*&*(&(*&(*&(*&(*& |
    Then user should not be able to login to system