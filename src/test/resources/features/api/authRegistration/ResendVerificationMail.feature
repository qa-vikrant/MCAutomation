Feature: API -- Auth --- Resend verification email.--- put--  /user/resend-email

        As a new user(Vendor Role)
        After registration on MarketCube App ,User wants to resend verification link on their registered emailId
        (By clicking on Resend Verification Email Button)


  Scenario: User as a new Vendor wants to resend verification link on their registered EmailId
    When User enters the emaliId and password field for registration
      | email             | password      |
      | vikrant.singh+    | 123456789     |
    And User make a request to get register into the system
    Then User should be able to registered successfully into the system
    And User enters emailId to resend verification link
      |  email         |
      |                |
    And User make a request to resend verification link on their registered emailId
    Then User should be able to resend verification link on their registered emailId



  Scenario Outline: Without follow field validation user wants to resend verification link on their registered EmailId
   And User enters emailId to resend verification link
     |  email         |
     |  <email>       |
   And User make a request to resend verification link on their registered emailId
   Then User should not be able to resend verification link on their registered emailId and user should get validation error message
     |  Email is required.              |
     |  User not found                  |
     |  User already verified           |
     |  Invalid email provided.         |
     |  Invalid email provided.         |
   Examples:
     |  email                              |
     |                                     |
     | vikrant.singh+1@successive.tech     |
     | vikrant.singh+64@successive.tech    |
     | vikrant.singh                       |
     | aaaaaaaaaaaaaaaaaa                  |

#    SellerNotAllowed ---Please use your shopify account to manage this functionality. User is not allowed to do it from here.---How to test