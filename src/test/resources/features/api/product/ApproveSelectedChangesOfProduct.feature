Feature: API -  Product - Approve Selected Changes of a product.  put-  /product/approve-selected

         As a seller user
         I want to approve selected Changes of a product.

         As a vendor user
         I want to approve selected Changes of a product.


  Scenario Outline:Login with valid registered user details as a seller and user want to approve selected Changes of a product
    When User is able to log into application
      | email                                 | password        |
      | vikrant.singh@successive.tech         | HaiVikki432     |
    Then user should be able to login to the system and store token
    And user enter the selected fields to approval
      | title               |
      | description         |
    And user enter product id and seller id for selected changes of a product
      | seller   | id     |
      | <seller> | <id>   |
    When user make request to selected changes of a product
    Then user should be able to selected changes of a product
    Examples:
      | seller                    | id                        |
      | 5e29912fbfec74a0272e9a92  | 5e9eeec32efe400018047ac7  |



  Scenario Outline:Login with valid registered user details as a vendor and user want to approve selected Changes of a product
    When User is able to log into application
      | email                                 | password         |
      | vikrant.singh@successive.tech         | HaiVikki4321     |
    Then user should be able to login to the system and store token
    And user enter the selected fields to approval
      | title               |
      | description         |
    And user enter product id and seller id for selected changes of a product
      | seller     | id     |
      | <seller>   | <id>   |
    When user make request to selected changes of a product
    Then user should not be able to selected changes of a product and user should get validation error message
      | User is not authorized to perform this action.       |
    Examples:
      | seller                    | id                        |
      | 5e29912fbfec74a0272e9a92  | 5e9eeec32efe400018047ac7  |


  Scenario Outline:Login with valid registered user details as a seller and user want to approve selected Changes of a product for  another seller product
    When User is able to log into application
      | email                                 | password        |
      | vikrant.singh+13@successive.tech      | 1234512345Q@     |
    Then user should be able to login to the system and store token
    And user enter the selected fields to approval
      | title               |
      | description         |
    And user enter product id and seller id for selected changes of a product
      | seller   | id     |
      | <seller> | <id>   |
    When user make request to selected changes of a product
    Then user should not be able to selected changes of a product and user should get validation error message
      | User is not authorized to perform this action.       |
    Examples:
      | seller                    | id                        |
      | 5e29912fbfec74a0272e9a92  | 5e9eeec32efe400018047ac7  |


  Scenario Outline:Login with valid registered user details as a seller and without follow field validation user want to approve selected Changes of a product
    When User is able to log into application
      | email                                 | password        |
      | vikrant.singh@successive.tech         | HaiVikki432     |
    Then user should be able to login to the system and store token
    And user enter the selected fields to approval
      | title               |
      | description         |
    And user enter product id and seller id for selected changes of a product
      | seller   | id     |
      | <seller> | <id>   |
    When user make request to selected changes of a product
    Then user should not be able to selected changes of a product and user should get validation error message
      | SellerId is required.                                |
      | productId is required.                               |
      | Invalid Product provided, Not found.                 |
      | Invalid Product provided, Not found.                 |
      | Invalid Product provided, Not found.                 |
      | Invalid SellerId provided                            |
      | Invalid SellerId provided                            |
      | Invalid SellerId provided                            |
    Examples:
      | seller                    | id                        |
      |                           | 5e9eeec32efe400018047ac7  |
      | 5e29912fbfec74a0272e9a92  |                           |
      | 5e29912fbfec74a0272e9a92  | 12345678901234567890123   |
      | 5e29912fbfec74a0272e9a92  | 123456789012345678901234  |
      | 5e29912fbfec74a0272e9a92  | 1234567890123456789012345 |
      | 12345678901234567890123   | 5e9eeec32efe400018047ac7  |
      | 123456789012345678901234  | 5e9eeec32efe400018047ac7  |
      | 1234567890123456789012345 | 5e9eeec32efe400018047ac7  |





  Scenario Outline: User make a request to approve selected Changes of a product with valid field by passing Incorrect/blank token data
    And user enter the selected fields to approval
      | title               |
      | description         |
    And user enter product id and seller id for selected changes of a product
      | seller                    | id                        |
      | 5e29912fbfec74a0272e9a92  | 5e9eeec32efe400018047ac7  |
    When user make a request to approve selected Changes of a product with Incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then user should not be able to selected changes of a product and user should get validation error message
      | Invalid token provided          |
      | token is required.              |
    Examples:
      | token                           |
      |  sgshhshhshhshshhsh             |
      |                                 |