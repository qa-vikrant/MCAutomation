         Feature: API --  Auth - Update one time password--  put--  /user/otp

              As a User(Vendor)
              I want to reset password for marketplace account(GENERATE_PASSWORD)
              So that I am able to access the platform and manage my inventory with new password

              Action---in form of Reset Vendor Credentials Button click by seller( User requested to reset vendor password for marketplace account.)
              then user click on marketplace login link and enters the email and password that user got by their registered emailId and enters the new password



      Scenario: User wants to Password Reset after enters newPassword on login link that user got by their registered emailId
        When user enter emailId and password that users have received on their registered email id
          |  email                                | password           |
          | vikrant.singh+101@successive.tech     | 7ac890fea04550e3   |
        And User enters newPassword
          | newPassword |
          | 1234567890  |
        And User make a request to Password Reset
        And User should be able to Password Reset
        When User enters email and password
          | email                                 | password       |
          | vikrant.singh+101@successive.tech     | 1234567890     |
        Then User should be able to login to the system and now User will Land on Home Page




      Scenario Outline: Without follow field validation User wants to Password Reset.
        When user enter emailId and password that users have received on their registered email id
          |  email                                | password             |
          |  <email>                              | <password>           |
        And User enters newPassword
          | newPassword   |
          | <newPassword> |
        And User make a request to Password Reset
        And User should not be able to Password Reset and user should get validation error message
          | Email is required.                                    |
          | Password is required.                                 |
          | NewPassword is required.                              |
          | Current and new password can not be same              |
          | Current Password Incorrect.                           |
          | Password should be minimum 8 characters long          |
          | Invalid user provided                                 |
          | Invalid email provided                                |
          | Otp already used.                                     |
        Examples:
          |  email                                | password           | newPassword         |
          |                                       | 7ac890fea04550e3   | 1234567890          |
          | vikrant.singh+101@successive.tech     |                    | 1234567890          |
          | vikrant.singh+101@successive.tech     | 7ac890fea04550e3   |                     |
          | vikrant.singh+101@successive.tech     | 7ac890fea04550e3   | 7ac890fea04550e3    |
          | vikrant.singh+101@successive.tech     | d1550d9            | 1234567890          |
          | vikrant.singh+101@successive.tech     | 7ac890fea04550e3   | 1234567             |
          | vikrant.singh+1@successive.tech       | 7ac890fea04550e3   | 1234567890          |
          | vikrant.singh                         | 7ac890fea04550e3   | 1234567890          |
          | vikrant.singh+101@successive.tech     | 7ac890fea04550e3   | 1234567890          |




#        SellerNotAllowed-----Please use your shopify account to manage this functionality. User is not allowed to do it from here.----How to test