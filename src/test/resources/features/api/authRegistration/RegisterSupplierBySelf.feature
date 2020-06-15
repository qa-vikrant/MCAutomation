Feature: Auth -- Auth - Register Supplier by Self--  post--  /user/register

          As a new user
          I want regsiter as a vendor on marketcube directly,
          So that I am able to access the platform and manage my inventory

  Scenario: User wants to register directly on marketcube app as a new vendor
    When User enters the emaliId and password field for registration
      | email             | password      |
      | vikrant.singh+    | 123456789     |
    And User make a request to get register into the system
    Then User should be able to registered successfully into the system


  Scenario Outline: Without follow field validation ,user wants to register directly on marketcube app as a new vendor
    When User enters the emaliId and password field for registration
      | email      | password        |
      | <email>    | <password>      |
    And User make a request to get register into the system
    Then User should not be able to register on marketcube app and user should get validation error message
      | Email is required.                             |
      | Password is required.                          |
      | Email is required.                             |
      | Password should be minimum 8 characters long   |
      | Invalid email provided                         |
      | Invalid email provided                         |
    Examples:
      | email                  | password      |
      |                        | 123456789     |
      | vikrant.singh+         |               |
      |                        |               |
      | vikrant.singh+         | 1234567       |
      | vikrant                | 123456789     |
      | 12345678901222333      | 123456789     |


  Scenario: User wants to register directly on marketcube app as a new vendor with already registered email
    When User enters the emaliId and password field for registration
      | email                                     | password      |
      | vikrant.singh+101@successive.tech         | 123456789     |
    And User make a request to get register into the system
    Then User should not be able to register on marketcube app and user should get validation error message
      | Already registered email.         |








