  Feature: Auth -- Change Password---    put--    /user/password

         As a registered user(Seller/Vendor/System-Admin)
         User wants to change the Password with existing password


  Scenario Outline: Login with valid registered user details as a Vendor and user wants to change password with existing password
    When User is able to log into application
      | email                            | password  |
      | vikrant.singh+10@successive.tech |<password> |
    Then User should be able to login to the system and store token
    And User enter the valid old Password and valid new password
      | newPassword   | password   |
      | <newPassword> | <password> |
    And User make a request to change the Password with existing password
    Then User should be able to change the Password with existing password successfully
    Examples:
      | newPassword                | password                   |
      | 999999999999999999999999   | 1234567890                 |
      | 00000000000000000          | 999999999999999999999999   |
      | ababababababbabababababa   | 00000000000000000          |
      | ************************   | ababababababbabababababa   |
      | WeWeWeWeWeWeWeWe@#@#@#@#   | ************************   |
      | 12345678                   | WeWeWeWeWeWeWeWe@#@#@#@#   |
      | 123456789123456789123456789123456789123456789123456789123456789123456789123456789   | 12345678                  |
      | ababababababbabababababaWeWeWeWeWeWeWeWe@#@#@#@#************************                  | 123456789123456789123456789123456789123456789123456789123456789123456789123456789  |
      | 12         3456          789        | ababababababbabababababaWeWeWeWeWeWeWeWe@#@#@#@#************************      |
      | 1234              56789             | 12         3456          789                  |
      | 1234567890                          | 1234              56789                       |




  Scenario Outline: Login with valid registered user details as a Vendor and without follow field validation user wants to change password with existing password
    When User is able to log into application
      | email                            | password   |
      | vikrant.singh+10@successive.tech | 1234567890 |
    Then User should be able to login to the system and store token
    And User enter the valid old Password and valid new password
      | newPassword   | password   |
      | <newPassword> | <password> |
    And User make a request to change the Password with existing password
    Then User should not be able to change password and user should get validation error message
      | Current and new password can not be same     |
      | Password should be minimum 8 characters long |
      | Invalid password provided                    |
      | NewPassword is required.                     |
      | Password is required.                        |
      | NewPassword is required.                     |
    Examples:
      | newPassword  | password    |
      | 1234567890   | 1234567890  |
      | 1234567      | 12345678    |
      | 1234567890   | 12345678    |
      |              | 123456789   |
      | 123456789    |             |
      |              |             |




    Scenario Outline: Login with valid registered user details as a Vendor and without follow token field validation user wants to change password with existing password
      When User is able to log into application
        | email                            | password   |
        | vikrant.singh+10@successive.tech | 1234567890 |
      Then User should be able to login to the system and store token
      And User enter the valid old Password and valid new password
        | newPassword   | password   | token   |
        | <newPassword> | <password> | <token> |
      And User make a request to change the Password with existing password
      Then User should not be able to change password and user should get validation error message
        | Token is required.                            |
        | Invalid token provided.                       |
      Examples:
        | newPassword  | password    | token               |
        | 123456789    | 1234567890  |                     |
        | 123456789    | 1234567890  | tokenDataToBeTested |




    Scenario Outline: User make a request to change the Password with existing password with valid field by passing Incorrect/blank token data
      And User enter the valid old Password and valid new password
        | newPassword   | password   |
        | 123456789     | 1234567890 |
      When User make a request to change the Password with existing password with Incorrect/blank token field in form of without login credentials
        |  token                      |
        | <token>                     |
      Then User should not be able to change password and user should get validation error message
        | Invalid token provided          |
        | Token is required.              |
      Examples:
        | token                           |
        |  sgshhshhshhshshhsh             |
        |                                 |

