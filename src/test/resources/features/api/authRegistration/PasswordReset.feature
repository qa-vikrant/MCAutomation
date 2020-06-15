  Feature: API --  Auth - Reset password.--  put--  /user/reset-password

    As a User(Seller/Vendor)
    I want reset password for marketplace account
    So that I am able to access the platform and manage my inventory with new password

    Action---in form of Forgot Password Button( User requested to reset your password for your marketplace account.)
    then user click on token link that user got by their registered emailId and enters the new password



  Scenario: User wants to reset password after clicking on token link that user got by their registered emailId
    When User enters the registered email for token creation
      | email                               |
      | vikrant.singh+101@successive.tech   |
    And User make a request to create a token
    Then Token has been created successfully and user should get a message request to reset password for marketplace account
    And User enters new passowrd
      | newPassword |
      | 1234567890  |
    And User make a request to reset marketplace password
    And User should be able to reset marketplace password
    When User enters email and password
      | email                                 | password       |
      | vikrant.singh+101@successive.tech     | 1234567890     |
    Then User should be able to login to the system and now User will Land on Home Page



  Scenario: User wants to re-use the same token to reset password second time
    When User enters new passowrd
      | newPassword |
      | 1234567890  |
    And User make a request to reset marketplace password
    Then User should not be able to reset password and user should get validation error message
      | Token is expired, Please request for reset password link   |



  Scenario Outline: Without follow password field validation user wants to reset marketplace password
    When User enters the registered email for token creation
      | email                               |
      | vikrant.singh+101@successive.tech   |
    And User make a request to create a token
    Then Token has been created successfully and user should get a message request to reset password for marketplace account
    And User enters new passowrd
      | newPassword    |
      | <newPassword>  |
    And User make a request to reset marketplace password
    Then User should not be able to reset password and user should get validation error message
      | NewPassword is required.                          |
      | Password should be minimum 8 characters long      |
    Examples:
      | newPassword         |
      |                     |
      | 1234567             |


    Scenario Outline: Without follow Token field validation user wants to reset marketplace password
      And User enters new passowrd
        | newPassword    |  token     |
        | <newPassword>  | <token>    |
      And User make a request to reset marketplace password
      Then User should not be able to reset password and user should get validation error message
        | Token is required.                                         |
        | Token is expired, Please request for reset password link   |
      Examples:
        | newPassword         |  token     |
        | 1234567890          |            |
        | 1234567890          |  token     |