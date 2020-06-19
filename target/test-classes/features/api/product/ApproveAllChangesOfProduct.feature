Feature: API -  Product - Approve All Changes of a product.  put-  /product/approve-all

        As a seller user
        I want to approve all changes of a product.

        As a vendor user
        I want to approve all changes of a product.


  Scenario Outline:Login with valid registered user details as a seller and user want to approve all changes of a product
    When User is able to log into application
      | email                                 | password        |
      | vikrant.singh@successive.tech         | HaiVikki432     |
    Then User should be able to login to the system and store token
    And user enter product details for approval
      | seller   | isToPublish     | id     |
      | <seller> | <isToPublish>   | <id>   |
    When user make request to approve all changes of a product.
    Then user should be able to approve all changes of a product.
    Examples:
      | seller                    | isToPublish     | id                        |
      | 5e29912fbfec74a0272e9a92  | true            | 5e9eeec32efe400018047ac7  |




  Scenario Outline:Login with valid registered user details as a seller and user want to approve all changes of a product for  another seller product
    When User is able to log into application
      | email                                  | password         |
      | vikrant.singh+13@successive.tech       | 1234512345Q@     |
    Then User should be able to login to the system and store token
    And user enter product details for approval
      | seller   | isToPublish     | id     |
      | <seller> | <isToPublish>   | <id>   |
    When user make request to approve all changes of a product.
    Then user should not be able to approve all changes of a product and user should get validation error message
      | User is not authorized to perform this action.       |
    Examples:
      | seller                    | isToPublish    | id                        |
      | 5e29912fbfec74a0272e9a92  | true           | 5e9eeec32efe400018047ac7  |
#isToPublish= false value accepted for another seller and also modify on ui and database .but isToPublish =true accepted but not impact on ui and a database




  Scenario Outline:Login with valid registered user details as a vendor and user want to approve all changes of a product
    When User is able to log into application
      | email                                 | password         |
      | vikrant.singh@successive.tech         | HaiVikki4321     |
    Then User should be able to login to the system and store token
    And user enter product details for approval
      | seller   | isToPublish     | id     |
      | <seller> | <isToPublish>   | <id>   |
    When user make request to approve all changes of a product.
    Then user should not be able to approve all changes of a product and user should get validation error message
      | User is not authorized to perform this action.       |
    Examples:
      | seller                    | isToPublish | id                        |
      | 5e29912fbfec74a0272e9a92  | true        | 5e9eeec32efe400018047ac7  |




  Scenario Outline:Login with valid registered user details as a seller and user want to accept all changes of a product but not publish
    When User is able to log into application
      | email                                 | password        |
      | vikrant.singh@successive.tech         | HaiVikki432     |
    Then User should be able to login to the system and store token
    And user enter product details for approval
      | seller   | isToPublish     | id     |
      | <seller> | <isToPublish>   | <id>   |
    When user make request to approve all changes of a product.
    Then user should be able to approve all changes of a product.
    Examples:
      | seller                    | isToPublish | id                        |
      | 5e29912fbfec74a0272e9a92  | false       | 5e9eeec32efe400018047ac7  |


  Scenario Outline:Login with valid registered user details as a vendor and user want to accept all changes of a product but not publish
    When User is able to log into application
      | email                                 | password         |
      | vikrant.singh@successive.tech         | HaiVikki4321     |
    Then User should be able to login to the system and store token
    And user enter product details for approval
      | seller   | isToPublish     | id     |
      | <seller> | <isToPublish>   | <id>   |
    When user make request to approve all changes of a product.
    Then user should not be able to approve all changes of a product and user should get validation error message
      | User is not authorized to perform this action.       |
    Examples:
      | seller                    | isToPublish  | id                        |
      | 5e29912fbfec74a0272e9a92  | false        | 5e9eeec32efe400018047ac7  |



  Scenario Outline:Login with valid registered user details as a seller and user want to accept all changes of a product but not publish for another seller product
    When User is able to log into application
      | email                                  | password         |
      | vikrant.singh+13@successive.tech       | 1234512345Q@     |
    Then User should be able to login to the system and store token
    And user enter product details for approval
      | seller   | isToPublish     | id     |
      | <seller> | <isToPublish>   | <id>   |
    When user make request to approve all changes of a product.
    Then user should not be able to approve all changes of a product and user should get validation error message
      | User is not authorized to perform this action.       |
    Examples:
      | seller                    | isToPublish | id                        |
      | 5e29912fbfec74a0272e9a92  | false       | 5e9eeec32efe400018047ac7  |



  Scenario Outline:Login with valid registered user details as a seller and user want to reject the changes of a product
    When User is able to log into application
      | email                                 | password        |
      | vikrant.singh@successive.tech         | HaiVikki432     |
    Then User should be able to login to the system and store token
    And user enter product details for approval
      | seller   | id     |
      | <seller> | <id>   |
    When user make request to approve all changes of a product.
    Then user should be able to approve all changes of a product.
    Examples:
      | seller                   | id                        |
      | 5e29912fbfec74a0272e9a92 | 5e9eeec32efe400018047ac7  |




  Scenario Outline:Login with valid registered user details as a seller and user want to reject changes of a product for  another seller product
    When User is able to log into application
      | email                                  | password         |
      | vikrant.singh+13@successive.tech       | 1234512345Q@     |
    Then User should be able to login to the system and store token
    And user enter product details for approval
      | seller   | id     |
      | <seller> | <id>   |
    When user make request to approve all changes of a product.
    Then user should not be able to approve all changes of a product and user should get validation error message
      | User is not authorized to perform this action.       |
    Examples:
      | seller                    | id                        |
      | 5e29912fbfec74a0272e9a92  | 5e9eeec32efe400018047ac7  |
#isToPublish= false value accepted for another seller and also modify on ui and database .but isToPublish =true accepted but not impact on ui and a database


  Scenario Outline:Login with valid registered user details as a vendor and user want to reject changes of a product
    When User is able to log into application
      | email                                 | password         |
      | vikrant.singh@successive.tech         | HaiVikki4321     |
    Then User should be able to login to the system and store token
    And user enter product details for approval
      | seller   | id     |
      | <seller> | <id>   |
    When user make request to approve all changes of a product.
    Then user should not be able to approve all changes of a product and user should get validation error message
      | User is not authorized to perform this action.       |
    Examples:
      | seller                    | id                        |
      | 5e29912fbfec74a0272e9a92  | 5e9eeec32efe400018047ac7  |




  Scenario Outline:Login with valid registered user details as a seller and without follow field validation user want to approve all changes of a product
    When User is able to log into application
      | email                                 | password        |
      | vikrant.singh@successive.tech         | HaiVikki432     |
    Then User should be able to login to the system and store token
    And user enter product details for approval
      | seller   | isToPublish     | id     |
      | <seller> | <isToPublish>   | <id>   |
    When user make request to approve all changes of a product.
    Then user should not be able to approve all changes of a product and user should get validation error message
      | SellerId is required.                                |
      | productId is required.                               |
      | Invalid Product provided, Not found.                 |
      | Invalid Product provided, Not found.                 |
      | Invalid Product provided, Not found.                 |
      | Invalid SellerId provided                            |
      | Invalid SellerId provided                            |
      | Invalid SellerId provided                            |
    Examples:
      | seller                    | isToPublish     | id                        |
      |                           | true            | 5e9eeec32efe400018047ac7  |
      | 5e29912fbfec74a0272e9a92  | true            |                           |
      | 5e29912fbfec74a0272e9a92  | true            | 12345678901234567890123   |
      | 5e29912fbfec74a0272e9a92  | true            | 123456789012345678901234  |
      | 5e29912fbfec74a0272e9a92  | true            | 1234567890123456789012345 |
      | 12345678901234567890123   | true            | 5e9eeec32efe400018047ac7  |
      | 123456789012345678901234  | true            | 5e9eeec32efe400018047ac7  |
      | 1234567890123456789012345 | true            | 5e9eeec32efe400018047ac7  |



  Scenario Outline: User make a request to approve all changes of a product with valid field by passing Incorrect/blank token data
    When user enter product details for approval
      | seller                    | isToPublish     | id                        |
      | 5e29912fbfec74a0272e9a92  | true            | 5e9eeec32efe400018047ac7  |
    When User make a request to approve all changes of a product with Incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then user should not be able to approve all changes of a product and user should get validation error message
      | Invalid token provided          |
      | token is required.              |
    Examples:
      | token                           |
      |  sgshhshhshhshshhsh             |
      |                                 |