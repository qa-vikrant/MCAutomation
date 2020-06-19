Feature:  API -Order - Update order.-  put -  /order

          As a registered user,
          I want to update order

  Scenario Outline: Login with valid registered user details as a seller and user wants to update order
    When User is able to log into application
      | email                                 | password        |
      | vikrant.singh+60@successive.tech      | 123456789       |
    Then User should be able to login to the system and store token
    And User enters order details for update order
      | sellerId     | shopifyOrderId     |  id     |
      | <sellerId>   | <shopifyOrderId>   |  <id>   |
    And User enters notes to be filled by customer for update order
      |  notes update by automation    |
    And user make a request to update order
    Then User should be able to update order
    Examples:
      | sellerId                   | shopifyOrderId   | id                       |
      | 5e467ab03dcebee6ad14a23f   | 2270810013833    | 5eb12c358914c200170a1ad0 |
      | 5e467ab03dcebee6ad14a23f   | 2270810013833    |                          |
      | 5e467ab03dcebee6ad14a23f   |                  | 5eb12c358914c200170a1ad0 |




  Scenario Outline: Login with valid registered user details as a vendor and user wants to update order
    When User is able to log into application
      | email                                 | password        |
      | vikrant.singh+61@successive.tech      | 1234567890      |
    Then User should be able to login to the system and store token
    And User enters order details for update order
      | sellerId     | shopifyOrderId     |  id     |
      | <sellerId>   | <shopifyOrderId>   |  <id>   |
    And User enters notes to be filled by customer for update order
      |  notes update by automation    |
    And user make a request to update order
    Then User should be able to update order
    Examples:
      | sellerId                   | shopifyOrderId   | id                       |
      | 5e467ab03dcebee6ad14a23f   | 2270810013833    | 5eb12c358914c200170a1ad0 |
      | 5e467ab03dcebee6ad14a23f   | 2270810013833    |                          |
      | 5e467ab03dcebee6ad14a23f   |                  | 5eb12c358914c200170a1ad0 |




  Scenario Outline: Login with valid registered user details as a seller and without follow field validation user wants to update order
    When User is able to log into application
      | email                                 | password        |
      | vikrant.singh+60@successive.tech      | 123456789       |
    Then User should be able to login to the system and store token
    And User enters order details for update order
      | sellerId     | shopifyOrderId     |  id     |
      | <sellerId>   | <shopifyOrderId>   |  <id>   |
    And User enters notes to be filled by customer for update order
      |  notes update by automation    |
    And user make a request to update order
    Then User should not be able to update order and user should get validation error message
      | SellerId is required.                        |
      | Invalid SellerId provided                    |
      | Invalid SellerId provided                    |
      | Invalid SellerId provided                    |
      | Invalid SellerId provided                    |
      | shopifyOrderId or id is required.            |
      | Invalid shopifyOrderId provided              |
      | Invalid shopifyOrderId provided              |
      | Invalid shopifyOrderId provided              |
      | Invalid shopifyOrderId provided              |
      | Invalid order provided                       |
      | Invalid order provided                       |
      | Invalid order provided                       |
      | Invalid order provided                       |
      | Invalid shopifyOrderId or id provided        |
      | Invalid shopifyOrderId provided              |
      | Invalid order provided                       |
    Examples:
      | sellerId                   | shopifyOrderId            | id                       |
      |                            | 2270810013833             | 5eb12c358914c200170a1ad0 |
      | 12345678901234567890123    | 2270810013833             |                          |
      | 123456789012345678901234   |                           | 5eb12c358914c200170a1ad0 |
      | 1234567890123456789012345  | 2270810013833             | 5eb12c358914c200170a1ad0 |
      | aaaaaaaaaaaaaaaaaaaaaaaa   | 2270810013833             |                          |
      | 5e467ab03dcebee6ad14a23f   |                           |                          |
      | 5e467ab03dcebee6ad14a23f   | 1234567890123             |                          |
      | 5e467ab03dcebee6ad14a23f   | 1234567                   |                          |
      | 5e467ab03dcebee6ad14a23f   | 12345678901234            |                          |
      | 5e467ab03dcebee6ad14a23f   | aaaaaaaaaaaaa             |                          |
      | 5e467ab03dcebee6ad14a23f   |                           | 12345678901234567890123  |
      | 5e467ab03dcebee6ad14a23f   |                           | 123456789012345678901234 |
      | 5e467ab03dcebee6ad14a23f   |                           | 1234567890123456789012345|
      | 5e467ab03dcebee6ad14a23f   |                           | aaaaaaaaaaaaaaaaaaaaaaaa |
      | 5e467ab03dcebee6ad14a23f   | 1234567890123             | 123456789012345678901234 |
      | 5e467ab03dcebee6ad14a23f   | 1234567890123             | 5eb12c358914c200170a1ad0 |
      | 5e467ab03dcebee6ad14a23f   | 2270810013833             | 123456789012345678901234 |




  Scenario Outline: Login with valid registered user details as a vendor and without follow field validation user wants to update order
    When User is able to log into application
      | email                                 | password        |
      | vikrant.singh+61@successive.tech      | 1234567890      |
    Then User should be able to login to the system and store token
    And User enters order details for update order
      | sellerId     | shopifyOrderId     |  id     |
      | <sellerId>   | <shopifyOrderId>   |  <id>   |
    And User enters notes to be filled by customer for update order
      |  notes update by automation    |
    And user make a request to update order
    Then User should not be able to update order and user should get validation error message
      | SellerId is required.                        |
      | Invalid SellerId provided                    |
      | Invalid SellerId provided                    |
      | Invalid SellerId provided                    |
      | Invalid SellerId provided                    |
      | shopifyOrderId or id is required.            |
      | Invalid shopifyOrderId provided              |
      | Invalid shopifyOrderId provided              |
      | Invalid shopifyOrderId provided              |
      | Invalid shopifyOrderId provided              |
      | Invalid order provided                       |
      | Invalid order provided                       |
      | Invalid order provided                       |
      | Invalid order provided                       |
      | Invalid shopifyOrderId or id provided        |
      | Invalid shopifyOrderId provided              |
      | Invalid order provided                       |
    Examples:
      | sellerId                   | shopifyOrderId            | id                       |
      |                            | 2270810013833             | 5eb12c358914c200170a1ad0 |
      | 12345678901234567890123    | 2270810013833             |                          |
      | 123456789012345678901234   |                           | 5eb12c358914c200170a1ad0 |
      | 1234567890123456789012345  | 2270810013833             | 5eb12c358914c200170a1ad0 |
      | aaaaaaaaaaaaaaaaaaaaaaaa   | 2270810013833             |                          |
      | 5e467ab03dcebee6ad14a23f   |                           |                          |
      | 5e467ab03dcebee6ad14a23f   | 1234567890123             |                          |
      | 5e467ab03dcebee6ad14a23f   | 1234567                   |                          |
      | 5e467ab03dcebee6ad14a23f   | 12345678901234            |                          |
      | 5e467ab03dcebee6ad14a23f   | aaaaaaaaaaaaa             |                          |
      | 5e467ab03dcebee6ad14a23f   |                           | 12345678901234567890123  |
      | 5e467ab03dcebee6ad14a23f   |                           | 123456789012345678901234 |
      | 5e467ab03dcebee6ad14a23f   |                           | 1234567890123456789012345|
      | 5e467ab03dcebee6ad14a23f   |                           | aaaaaaaaaaaaaaaaaaaaaaaa |
      | 5e467ab03dcebee6ad14a23f   | 1234567890123             | 123456789012345678901234 |
      | 5e467ab03dcebee6ad14a23f   | 1234567890123             | 5eb12c358914c200170a1ad0 |
      | 5e467ab03dcebee6ad14a23f   | 2270810013833             | 123456789012345678901234 |


  Scenario Outline: User make a request to Update a order with valid field by passing Incorrect/blank token data
    And User enters order details for update order
      | sellerId     | shopifyOrderId     |  id     |
      | <sellerId>   | <shopifyOrderId>   |  <id>   |
    And User enters notes to be filled by customer for update order
      |  notes update by automation    |
    And user make a request to update order with Incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then User should not be able to update order and user should get validation error message
      | Invalid token provided          |
      | token is required.              |
    Examples:
      | token                           |
      | sgshhshhshhshshhsh              |
      |                                 |





  Scenario Outline: Login with valid registered user details as a seller and user wants to update order of another seller
    When User is able to log into application
      | email                                 | password        |
      | vikrant.singh@successive.tech         | HaiVikki432     |
    Then User should be able to login to the system and store token
    And User enters order details for update order
      | sellerId     | shopifyOrderId     |  id     |
      | <sellerId>   | <shopifyOrderId>   |  <id>   |
    And User enters notes to be filled by customer for update order
      |  notes update by another seller  |
    And user make a request to update order
    Then User should not be able to update order and user should get validation error message
      | User is not authorized to perform this action. |
    Examples:
      | sellerId                   | shopifyOrderId   | id                       |
      | 5e467ab03dcebee6ad14a23f   | 2270810013833    | 5eb12c358914c200170a1ad0 |



  Scenario Outline: Login with valid registered user details as a vendor and user wants to update order of another seller
    When User is able to log into application
      | email                                 | password        |
      | vikrant.singh@successive.tech         | HaiVikki4321    |
    Then User should be able to login to the system and store token
    And User enters order details for update order
      | sellerId     | shopifyOrderId     |  id     |
      | <sellerId>   | <shopifyOrderId>   |  <id>   |
    And User enters notes to be filled by customer for update order
      |  notes update by another vendor |
    And user make a request to update order
    Then User should not be able to update order and user should get validation error message
      | User is not authorized to perform this action. |
    Examples:
      | sellerId                   | shopifyOrderId   | id                       |
      | 5e467ab03dcebee6ad14a23f   | 2270810013833    | 5eb12c358914c200170a1ad0 |
