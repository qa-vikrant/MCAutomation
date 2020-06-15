Feature: API -Auth - Verify Email.--  put---  /user/verify-email

        As a new user(Vendor Role)
        I want to verify new registered Email on marketcube app ,
        for that user click on verification link ,where verification link got by user on their registered emailId
        (new vendor confirms the token by clicking on a link that has been sent to its registered email)

  Scenario: User as a new Vendor wants to verify their emailId with the help of verification link in form of Token
    When User enters the emaliId and password field for registration
      | email             | password      |
      | vikrant.singh+    | 123456789     |
    And User make a request to get register into the system
    Then User should be able to registered successfully into the system
    And User enters the verification link in form of Token
      |     token       |
      |                 |
    And User make a request to confirms the token by clicking on a link that has been sent to its registered email
    Then User should be able to verify their emailId and Vendor should get message as a Your Email is Verified Successfully.



  Scenario Outline: Without follow field validation user wants to verify their emailId
    And User enters the verification link in form of Token
      |     token       |
      |    <token>      |
    And User make a request to confirms the token by clicking on a link that has been sent to its registered email
    Then User should not be able to verify their emailId and user should get validation error message
      | Token is required.           |
      | Invalid token provided       |
      | Invalid token provided       |
      | Token is expired, Please request for resend verification link      |
    Examples:
      |     token                                          |
      |                                                    |
      |  1111111111111111111111111111111                   |
      |  aaaaaaaaaaaassssssssssssssssssssssssssssssssss    |
      |  310a818842278e1ddbaf2a271b478d802da7862b1dbf640da98dd7dc7efbe5f3d42ef7674baf46948169c8adb167a736c9458e0fea92ee1c8cf6e502c1df3f22               |

