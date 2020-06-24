Feature: API - Auth - Update default commission of seller--  put--  /user/default-commission

    As a registered user
    I want to change the commission



  Scenario Outline: Login with valid registered user details as a seller and user wants to update flat commission
    When User is able to log into application
      | email                             | password    |
      | vikrant.singh+60@successive.tech  | 1234@Vik    |
    Then User should be able to login to the system and store token
    And User enters the commision details
      | commissionType     | commission    |
      | <commissionType>   | <commission>  |
    When User make a request to update the commission
    Then User should be able to update the commission
     Examples:
       | commissionType     | commission  |
       | flat               |      9      |




  Scenario Outline: Login with valid registered user details as a seller and user wants to update percentage commission
    When User is able to log into application
      | email                             | password    |
      | vikrant.singh+60@successive.tech  | 1234@Vik    |
    Then User should be able to login to the system and store token
    And User enters the commision details
      | commissionType     | commission    |
      | <commissionType>   | <commission>  |
    When User make a request to update the commission
    Then User should be able to update the commission
    Examples:
      | commissionType     | commission  |
      | percentage         |      2      |




  Scenario Outline: Login with valid registered user details as a seller and without follow field validation user wants to update commission
    When User is able to log into application
      | email                             | password    |
      | vikrant.singh+60@successive.tech  | 1234@Vik    |
    Then User should be able to login to the system and store token
    And User enters the commision details
      | commissionType     | commission    |
      | <commissionType>   | <commission>  |
    When User make a request to update the commission
    Then User should not be able to update the commission and user should get validation error message
      |  Commission is required.             |
      |  CommissionType is required.         |
      |  Invalid commissionType provided.    |
      |  Invalid commissionType provided     |
    Examples:
      | commissionType     | commission  |
      | flat               |             |
      |                    |      2      |
      | 1111111111         |      2      |
      | aaaaaaaaaa         |      2      |




  Scenario Outline: User make a request to update the commission with valid field details by passing Incorrect/blank token data
    And User enters the commision details
      | commissionType     | commission    |
      | percentage         |      2      |
    And User make a request to update the commission with incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then User should not be able to update the commission and user should get validation error message
      | Invalid token provided          |
      | Token is required.              |
    Examples:
      | token                                                |
      |  sgshhshhshhshshhshsssssssssssssssssssss             |
      |                                                      |




