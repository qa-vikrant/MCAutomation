Feature: API -  Product - Bulk Approve Products.- put-  /product/bulk-approve

       As a seller user
       I want to Approve products in bulk

       As a vendor user
       I want to Approve products in bulk


  Scenario Outline:Login with valid registered user details as a seller and user wants to Approve products in bulk
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then User should be able to login to the system and store token
    And user enters productIds to Approve products
      | 5e9ed2c4d1d53c00180cd857    |
      | 5e9ed2c66d2dd5001778fad0    |
    And user enter actions details to Approve products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Approve products in bulk
    Then user should be able to Approve products in bulk
    Examples:
      | key     | deleteFromShopify  | all     | reason         |
      | approve  | false             | false   | reject it      |




  Scenario Outline:Login with valid registered user details as a vendor and user wants to Approve products in bulk
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | 1234567890     |
    Then User should be able to login to the system and store token
    And user enters productIds to Approve products
      | 5e9421c24c4af60018b45bd5    |
      | 5e9421c24c4af60018b45bd5    |
      | 5e9421c24c4af60018b45bd5    |
    And user enter actions details to Approve products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Approve products in bulk
    Then user should not be able to Approve products in bulk and user should get validation error message
      | User is not authorized to perform this action |
    Examples:
      | key     | deleteFromShopify | all     | reason         |
      | approve  | false             | false   | reject it      |



  Scenario Outline:Login with valid registered user details as a System Admin and user wants to Approve products in bulk
    When User is able to log into application
      | email                                 | password       |
      | systemadmin@marketcube.io             | 12345678n@N    |
    Then User should be able to login to the system and store token
    And user enters productIds to Approve products
      | 5e9421c24c4af60018b45bd5    |
      | 5e9421c24c4af60018b45bd5    |
      | 5e9421c24c4af60018b45bd5    |
    And user enter actions details to Approve products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Approve products in bulk
    Then user should not be able to Approve products in bulk and user should get validation error message
      | User is not authorized to perform this action |
    Examples:
      | key     | deleteFromShopify | all     | reason         |
      | approve  | false             | false   | reject it      |




  Scenario Outline:Login with valid registered user details as a seller and without productid field user wants to Approve products in bulk
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then User should be able to login to the system and store token
    And user enters productIds to Approve products
      |     |
    And user enter actions details to Approve products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Approve products in bulk
    Then user should not be able to Approve products in bulk and user should get validation error message
      | productIds is required. |
    Examples:
      | key     | deleteFromShopify | all     | reason         |
      | approve  | false             | false   | reject it      |


  Scenario Outline:Login with valid registered user details as a seller and with invalid productid field user wants to Approve products in bulk
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then User should be able to login to the system and store token
    And user enters productIds to Approve products
      |  121212121221   |
    And user enter actions details to Approve products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Approve products in bulk
    Then user should not be able to Approve products in bulk and user should get validation error message
      | Invalid product Ids provided. |
    Examples:
      | key     | deleteFromShopify | all     | reason         |
      | approve  | false             | false   | reject it      |


  Scenario Outline:Login with valid registered user details as a seller and without follow field validation user wants to Approve products in bulk
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then User should be able to login to the system and store token
    And user enters productIds to Approve products
      | 5e9421c24c4af60018b45bd5    |
      | 5e9421c24c4af60018b45bd5    |
      | 5e9421c24c4af60018b45bd5    |
    And user enter actions details to Approve products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Approve products in bulk
    Then user should not be able to Approve products in bulk and user should get validation error message
      | key is required.                             |
      | Invalid key provided.                        |
      | Invalid deleteFromShopify provided.          |
      | Invalid all provided.                        |
    Examples:
      | key     | deleteFromShopify | all     | reason         |
      |         | false             | false   | reject it      |
      | 111111  | false             | false   | reject it      |
      | approve  | 11111             | false   | reject it      |
      | approve  | false             | 11111   | reject it      |



  Scenario Outline: User make request to Approve products in bulk with valid field by passing Incorrect/blank token data
    And user enters productIds to Approve products
      | 5e9421c24c4af60018b45bd5    |
      | 5e9421c24c4af60018b45bd5    |
      | 5e9421c24c4af60018b45bd5    |
    And user enter actions details to Approve products
      | key     | deleteFromShopify | all     | reason           |
      |         | false             | false   | unreject it      |
    When user make request to Approve products in bulk with Incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then user should not be able to Approve products in bulk and user should get validation error message
      | Invalid token provided          |
      | token is required.              |
    Examples:
      | token                           |
      |  sgshhshhshhshshhsh             |
      |                                 |