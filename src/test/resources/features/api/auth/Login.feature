Feature:  API --Auth -- Login a User--  post---  /user/login

        As a registered user(Seller/Vendor/System-Admin)
        I want to get logged into on marketcube
        So that I am able to access the platform and manage my inventory



  Scenario: Login with valid registered user details as a seller
    When User enters email and password
      | email                                 | password       |
      | vikrant.singh+100@successive.tech     | 123456789      |
    Then User should be able to login to the system and now User will Land on Home Page


  Scenario: Login with valid registered user details as a Vendor
    When User enters email and password
      | email                             | password       |
      | vikrant.singh+10@successive.tech  | 1234567890     |
    Then User should be able to login to the system and now User will Land on Home Page



  Scenario Outline: User wants to enter the system without following the valid field credentials
    When User enters email and password
      |email      |password   |
      |<email>    |<password> |
    Then User should not be able to login into to the system and user should get validation error message
      |  Incorrect credentials provided   |
      |  Incorrect credentials provided   |
      |  Password is required.            |
      |  Email is required.               |
      |  Email is required.               |
      |  User not verified                |
    Examples:
      | email                                 | password        |
      | TRrsggsvb@gassbbb                     | 123456789       |
      | vikrant.singh@successive.tech         | 987654321       |
      | vikrant.singh@successive.tech         |                 |
      |                                       | 123456789       |
      |                                       |                 |
      | vikrant.singh+105314@successive.tech  | Mohit@1989      |

#    Bug --space before password string it aaccepts
##UserNotFound   ---User not found.'  ------------how to test
#  InvalidTokenData------Invalid token data provided.---------------how to test


  Scenario: We create a login scenario that is used by all api for testing their functionality
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+100@successive.tech     | 123456789      |
    Then User should be able to login to the system and store token



