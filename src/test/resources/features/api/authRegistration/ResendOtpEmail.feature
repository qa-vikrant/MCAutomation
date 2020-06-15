Feature: API -  Auth - Resend otp email.--  put---  /user/resend-otp

        As as Seller user
        User wants to Resend otp email of own vendors in form of Reset Vendor Credentials( Password Reset on your account has been requested.)
        (Sends a request message for a password reset to your vendor email account)

        As as System Admin user
        User wants to Resend otp email of any vendors in form of Reset Vendor Credentials( Password Reset on your account has been requested.)


        Action---in form of Reset Vendor Credentials Button click by seller( User requested to reset vendor password for marketplace account.)
        then user click on marketplace login link and enters the email and password that user got by their registered emailId and enters the new password



  Scenario Outline: Login with valid registered user details as a Seller and user wants to Reset own Vendor Credentials.
    When User is able to log into application
      | email                              | password      |
      | vikrant.singh+100@successive.tech  | 123456789     |
    Then User should be able to login to the system and store token
    And user enters desired vendor details to Reset Credentials
      | email                             | id                        |
      | <email>                           | <id>                      |
    And user make a request to Reset Vendor Credentials
    Then user should be able to Reset Vendor Credentials
    Examples:
      | email                               | id                        |
      | vikrant.singh+101@successive.tech   | 5ed8a71f146a2c0019c666d9  |


  Scenario Outline: Login with valid registered user details as a System-Admin and user wants to Reset Vendor Credentials.
    When User is able to log into application
      | email                         | password     |
      | systemadmin@marketcube.io     | 12345678n@N  |
    Then User should be able to login to the system and store token
    And user enters desired vendor details to Reset Credentials
      | email                             | id                        |
      | <email>                           | <id>                      |
    And user make a request to Reset Vendor Credentials
    Then user should be able to Reset Vendor Credentials
    Examples:
      | email                               | id                        |
      | vikrant.singh+101@successive.tech   | 5ed8a71f146a2c0019c666d9  |



  Scenario Outline: Login with valid registered user details as a Seller and user wants to Reset Credentials of another seller's vendor
    When User is able to log into application
      | email                             | password     |
      | vikrant.singh@successive.tech     | 1234@Vik     |
    Then User should be able to login to the system and store token
    And user enters desired vendor details to Reset Credentials
      | email                             | id                        |
      | <email>                           | <id>                      |
    And user make a request to Reset Vendor Credentials
    Then user should not be able to Reset Vendor Credentials and user should get validation error message
       |  Invalid supplier provided, Not found. |
    Examples:
      | email                               | id                        |
      | vikrant.singh+101@successive.tech   | 5ed8a71f146a2c0019c666d9  |




  Scenario Outline: Login with valid registered user details as a Vendor and user wants to Reset Credentials of another seller's vendor
    When User is able to log into application
      | email                             | password     |
      | vikrant.singh+64@successive.tech  | 1234567890   |
    Then User should be able to login to the system and store token
    And user enters desired vendor details to Reset Credentials
      | email                             | id                        |
      | <email>                           | <id>                      |
    And user make a request to Reset Vendor Credentials
    Then user should not be able to Reset Vendor Credentials and user should get validation error message
      |  User is not authorized to perform this action. |
    Examples:
      | email                               | id                        |
      | vikrant.singh+101@successive.tech   | 5ed8a71f146a2c0019c666d9  |



  Scenario Outline: Login with valid registered user details as a Seller and without follow field validation user wants to Reset own Vendor Credentials.
    When User is able to log into application
      | email                             | password     |
      | vikrant.singh+60@successive.tech  | 1234@Vik     |
    Then User should be able to login to the system and store token
    And user enters desired vendor details to Reset Credentials
      | email                             | id                        |
      | <email>                           | <id>                      |
    And user make a request to Reset Vendor Credentials
    Then user should not be able to Reset Vendor Credentials and user should get validation error message
      |  Email is required.                       |
      |  Invalid email provided.                  |
      |  VendorId is required.                    |
      |  Invalid VendorId provided                |
      |  Invalid VendorId provided                |
      |  Invalid VendorId provided                |
    Examples:
      | email                             | id                        |
      |                                   | 5ed4fec71c0841001251023d  |
      | vikranst.singh                    | 5ed4fec71c0841001251023d  |
      | vikrant.singh+7@successive.tech   |                           |
      | vikrant.singh+7@successive.tech   | 12345678901234567890123   |
      | vikrant.singh+7@successive.tech   | 123456789012345678901234  |
      | vikrant.singh+7@successive.tech   | 1234567890123456789012345 |





  Scenario Outline: Login with valid registered user details as a System-Admin and without follow field validation user wants to Reset own Vendor Credentials.
    When User is able to log into application
      | email                             | password     |
      | systemadmin@marketcube.io         | 12345678n@N  |
    Then User should be able to login to the system and store token
    And user enters desired vendor details to Reset Credentials
      | email                             | id                        |
      | <email>                           | <id>                      |
    And user make a request to Reset Vendor Credentials
    Then user should not be able to Reset Vendor Credentials and user should get validation error message
      |  Email is required.                       |
      |  Invalid email provided.                  |
      |  VendorId is required.                    |
      |  Invalid VendorId provided                |
      |  Invalid VendorId provided                |
      |  Invalid VendorId provided                |
    Examples:
      | email                             | id                        |
      |                                   | 5ed4fec71c0841001251023d  |
      | vikranst.singh                    | 5ed4fec71c0841001251023d  |
      | vikrant.singh+7@successive.tech   |                           |
      | vikrant.singh+7@successive.tech   | 12345678901234567890123   |
      | vikrant.singh+7@successive.tech   | 123456789012345678901234  |
      | vikrant.singh+7@successive.tech   | 1234567890123456789012345 |



  Scenario Outline: User make a request to Reset Vendor Credentials with valid field by passing Incorrect/blank token data
    And user enters desired vendor details to Reset Credentials
      | email                               | id                        |
      | vikrant.singh+101@successive.tech   | 5ed8a71f146a2c0019c666d9  |
    When user make request to Reset Vendor Credentials with Incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then user should not be able to Reset Vendor Credentials and user should get validation error message
      | Invalid token provided          |
      | token is required.              |
    Examples:
      | token                           |
      | sgshhshhshhshshhsh              |
      |                                 |
