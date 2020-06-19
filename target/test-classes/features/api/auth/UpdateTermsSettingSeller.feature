Feature: API -   Auth - Update term settings of seller --  put --  /user/term

          As a registered user
          I want to update terms setting for seller

          {when "type":"preFulfillment" then "days":null  , when "isReturn":false then "returnPeriod":null ,"type":"preFulfillment/postFulfillment/postReturn"}


  Scenario Outline: Login with valid registered user details as a seller and user wants to update terms setting
    When User is able to log into application
      | email                             | password    |
      | vikrant.singh+60@successive.tech  | 1234@Vik    |
    Then User should be able to login to the system and store token
    And User enters returns policy details
      | isReturn       | returnPeriod          |
      | <isReturn>     | <returnPeriod>        |
    And User enters Payment terms details
      | days      | type   |
      |  <days>   | <type> |
    When User make a request to update the terms settings
    Then User should be able to update the terms settings
    Examples:
      |    isReturn    | returnPeriod   |  days |   type                |
      |    true        |     10         |   2   |   postFulfillment     |


  Scenario Outline: Login with valid registered user details as a seller and user wants to update terms setting when product return is not available
    When User is able to log into application
      | email                             | password    |
      | vikrant.singh+60@successive.tech  | 1234@Vik    |
    Then User should be able to login to the system and store token
    And User enters returns policy details
      | isReturn       | returnPeriod          |
      | <isReturn>     | <returnPeriod>        |
    And User enters Payment terms details
      | days      | type   |
      |  <days>   | <type> |
    When User make a request to update the terms settings
    Then User should be able to update the terms settings
    Examples:
      |    isReturn    | returnPeriod   |  days |   type               |
      |    False       |                |   2   |   postReturn         |




  Scenario Outline: Login with valid registered user details as a seller and without follow field validation user wants to update terms setting
    When User is able to log into application
      | email                             | password    |
      | vikrant.singh+60@successive.tech  | 1234@Vik    |
    Then User should be able to login to the system and store token
    And User enters returns policy details
      | isReturn       | returnPeriod          |
      | <isReturn>     | <returnPeriod>        |
    And User enters Payment terms details
      | days      | type   |
      |  <days>   | <type> |
    When User make a request to update the terms settings
    Then User should not be able to update the terms settings and user should get validation error message
       | Payment terms are required       |
       | Payment terms are required       |
       | Days must be greater than zero   |
       | Days must be greater than zero   |
       | Days must be greater than zero   |
       | Days must be greater than zero   |
    Examples:
      |    isReturn    | returnPeriod   |  days |   type                |
      |    true        |     10         |       |                       |
      |    true        |     10         |   2   |                       |
      |    true        |                |   2   |   postFulfillment     |
      |    true        |     10         |       |   postFulfillment     |
      |    true        |     10         |       |   postReturn          |



  Scenario Outline: Login with valid registered user details as a seller and without follow field validation user wants to update terms settings
    When User is able to log into application
      | email                             | password    |
      | vikrant.singh+60@successive.tech  | 1234@Vik    |
    Then User should be able to login to the system and store token
    And User enters returns policy details
      | isReturn       | returnPeriod          |
      | <isReturn>     | <returnPeriod>        |
    And User enters Payment terms details
      | days      | type   |
      |  <days>   | <type> |
    When User make a request to update the terms settings
    Then User should not be able to update the terms settings and user should get validation error message
      | Payment terms are required       |
    Examples:
      |    isReturn    | returnPeriod   |  days |   type                |
      |    false       |     12         |   22  | preFulfillment        |



  Scenario Outline: User make a request to update the terms settings with valid field details by passing Incorrect/blank token data
    And User enters returns policy details
      | isReturn       | returnPeriod   |
      | true           | 12             |
    And User enters Payment terms details
      | days      | type               |
      |  13       | postFulfillment    |
    And User make a request to update the terms settings with incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then User should not be able to update the terms settings and user should get validation error message
      | Invalid token provided          |
      | Token is required.              |
    Examples:
      | token                                                |
      |  sgshhshhshhshshhshsssssssssssssssssssss             |
      |                                                      |
