Feature: API -   Auth - Update order settings of User---  put---  /user/setting



        As a registered user(Seller/Vendor)
        I want to Update order settings of User


  Scenario Outline: Login with valid registered user details as a seller and user wants to update order settings
    When User is able to log into application
      | email                             | password    |
      | vikrant.singh+60@successive.tech  | 1234@Vik    |
    Then User should be able to login to the system and store token
    And User enters order settings details
      | id            | isAcceptOrder    |
      | <id>          | <isAcceptOrder>  |
    And User make a request to update order settings
    Then User should be able to update order settings
    Examples:
      | id                       | isAcceptOrder  |
      | 5ec606dbde6a7c0019f397cb | true           |
      | 5ec606dbde6a7c0019f397cb | false          |




  Scenario Outline: Login with valid registered user details as a seller and user wants to update order settings of another seller
    When User is able to log into application
      | email                             | password    |
      | vikrant.singh@successive.tech     | 1234@Vik    |
    Then User should be able to login to the system and store token
    And User enters order settings details
      | id            | isAcceptOrder    |
      | <id>          | <isAcceptOrder>  |
    And User make a request to update order settings
    Then User should not be able to update order settings and user should get validation error message
      | Invalid Id provided, Not found.                     |
      | Invalid Id provided, Not found.                     |
    Examples:
      | id                       | isAcceptOrder  |
      | 5ec606dbde6a7c0019f397cb | false          |
      | 5ec606dbde6a7c0019f397cb | true           |





  Scenario Outline: Login with valid registered user details as a Vendor and user wants to update order settings
    When User is able to log into application
      | email                             | password     |
      | vikrant.singh+62@successive.tech  | 1234567890   |
    Then User should be able to login to the system and store token
    And User enters order settings details
      | id            | isAcceptOrder    |
      | <id>          | <isAcceptOrder>  |
    And User make a request to update order settings
    Then User should be able to update order settings
    Examples:
      | id                       | isAcceptOrder  |
      | 5eba522ef6d77600196d76f2 | true           |
      | 5eba522ef6d77600196d76f2 | false          |



  Scenario Outline: Login with valid registered user details as a Vendor and user wants to update order settings of another vendor
    When User is able to log into application
      | email                             | password     |
      | vikrant.singh+61@successive.tech  | 1234567890   |
    Then User should be able to login to the system and store token
    And User enters order settings details
      | id            | isAcceptOrder    |
      | <id>          | <isAcceptOrder>  |
    And User make a request to update order settings
    Then User should not be able to update order settings and user should get validation error message
      | Invalid Id provided, Not found.                     |
      | Invalid Id provided, Not found.                     |
    Examples:
      | id                       | isAcceptOrder  |
      | 5eba522ef6d77600196d76f2 | true           |
      | 5eba522ef6d77600196d76f2 | false          |



  Scenario Outline: Login with valid registered user details as a seller and without follow field validation user wants to update order settings
    When User is able to log into application
      | email                             | password    |
      | vikrant.singh+60@successive.tech  | 1234@Vik    |
    Then User should be able to login to the system and store token
    And User enters order settings details
      | id            | isAcceptOrder    |
      | <id>          | <isAcceptOrder>  |
    And User make a request to update order settings
    Then User should not be able to update order settings and user should get validation error message
      | Id is required.                  |
      | Invalid Id provided, Not found.  |
      | Invalid Id provided, Not found.  |
      | Invalid Id provided, Not found.  |
      | Invalid Id provided, Not found.  |
    Examples:
      | id                        | isAcceptOrder  |
      |                           | true           |
      | 12345678901234567890123   | false          |
      | 123456789012345678901234  | true           |
      | 1234567890123456789012345 | true           |
      | aaaaaaaaaaaaaaaaaaaaaaaa  | true           |




  Scenario Outline: Login with valid registered user details as a Vendor and without follow field validation user wants to update order settings
    When User is able to log into application
      | email                             | password     |
      | vikrant.singh+62@successive.tech  | 1234567890   |
    Then User should be able to login to the system and store token
    And User enters order settings details
      | id            | isAcceptOrder    |
      | <id>          | <isAcceptOrder>  |
    And User make a request to update order settings
    Then User should not be able to update order settings and user should get validation error message
      | Id is required.                  |
      | Invalid Id provided, Not found.  |
      | Invalid Id provided, Not found.  |
      | Invalid Id provided, Not found.  |
      | Invalid Id provided, Not found.  |
    Examples:
      | id                        | isAcceptOrder  |
      |                           | true           |
      | 12345678901234567890123   | false          |
      | 123456789012345678901234  | true           |
      | 1234567890123456789012345 | true           |
      | aaaaaaaaaaaaaaaaaaaaaaaa  | true           |





  Scenario Outline: User make a request to update order settings with valid field details by passing Incorrect/blank token data
    And User enters order settings details
      | id                       | isAcceptOrder    |
      | 5eba522ef6d77600196d76f2 | false            |
    And User make a request to update order settings with incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then User should not be able to update order settings and user should get validation error message
      | Invalid token provided          |
      | Token is required.              |
    Examples:
      | token                                                |
      |  sgshhshhshhshshhshsssssssssssssssssssss             |
      |                                                      |



