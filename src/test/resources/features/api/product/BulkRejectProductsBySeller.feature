Feature: API -  Product - Bulk Reject Products.-  put -  /product/bulk-reject

          As a seller user
          I want to Reject products in bulk

          As a vendor user
          I want to Reject products in bulk


  Scenario Outline:Login with valid registered user details as a seller and user wants to Reject products in bulk
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+60@successive.tech      | 123456789      |
    Then User should be able to login to the system and store token
    And user enters productIds to Reject products
      | 5ebcf6bf972523001b770ab3    |
      | 5ebd7be3e1f3e80018cf5516    |
    And user enter actions details to Reject products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Reject products in bulk
    Then user should be able to Reject products in bulk
    Examples:
      | key     | deleteFromShopify | all     | reason         |
      | reject  | false             | false   | reject it      |




  Scenario Outline:Login with valid registered user details as a vendor and user wants to Reject products in bulk
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+62@successive.tech      | 1234567890     |
    Then User should be able to login to the system and store token
    And user enters productIds to Reject products
      | 5ebcf6bf972523001b770ab3    |
      | 5ebd7be3e1f3e80018cf5516    |
    And user enter actions details to Reject products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Reject products in bulk
    Then user should not be able to Reject products in bulk and user should get validation error message
      | User is not authorized to perform this action |
    Examples:
      | key     | deleteFromShopify | all     | reason         |
      | reject  | false             | false   | reject it      |



#  Scenario Outline:Login with valid registered user details as a System Admin and user wants to Reject products in bulk
#    When User is able to log into application
#      | email                                 | password       |
#      | systemadmin@marketcube.io             | 12345678n@N    |
#    Then user should be able to login to the system and store token
#    And user enters productIds to Reject products
#      | 5e9421c24c4af60018b45bd5    |
#      | 5e9421c24c4af60018b45bd5    |
#      | 5e9421c24c4af60018b45bd5    |
#    And user enter actions details to Reject products
#      | key     | deleteFromShopify     | all     |  reason     |
#      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
#    When user make request to Reject products in bulk
#    Then user should not be able to Reject products in bulk and user should get validation error message
#      | User is not authorized to perform this action |
#    Examples:
#      | key     | deleteFromShopify | all     | reason         |
#      | reject  | false             | false   | reject it      |




  Scenario Outline:Login with valid registered user details as a seller and without productid field user wants to Reject products in bulk
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then User should be able to login to the system and store token
    And user enters productIds to Reject products
      |     |
    And user enter actions details to Reject products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Reject products in bulk
    Then user should not be able to Reject products in bulk and user should get validation error message
      | productIds is required. |
    Examples:
      | key     | deleteFromShopify | all     | reason         |
      | reject  | false             | false   | reject it      |


  Scenario Outline:Login with valid registered user details as a seller and with invalid productid field user wants to Reject products in bulk
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then User should be able to login to the system and store token
    And user enters productIds to Reject products
      |  121212121221   |
    And user enter actions details to Reject products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Reject products in bulk
    Then user should not be able to Reject products in bulk and user should get validation error message
      | Invalid product Ids provided. |
    Examples:
      | key     | deleteFromShopify | all     | reason         |
      | reject  | false             | false   | reject it      |


  Scenario Outline:Login with valid registered user details as a seller and without follow field validation user wants to Reject products in bulk
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then User should be able to login to the system and store token
    And user enters productIds to Reject products
      | 5e9421c24c4af60018b45bd5    |
      | 5e9421c24c4af60018b45bd5    |
      | 5e9421c24c4af60018b45bd5    |
    And user enter actions details to Reject products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Reject products in bulk
    Then user should not be able to Reject products in bulk and user should get validation error message
      | key is required.                             |
      | Invalid key provided.                        |
      | Invalid deleteFromShopify provided.          |
      | Invalid all provided.                        |
    Examples:
      | key     | deleteFromShopify | all     | reason         |
      |         | false             | false   | reject it      |
      | 111111  | false             | false   | reject it      |
      | reject  | 11111             | false   | reject it      |
      | reject  | false             | 11111   | reject it      |



  Scenario Outline: User make request to Reject products in bulk with valid field by passing Incorrect/blank token data
    And user enters productIds to Reject products
      | 5e9421c24c4af60018b45bd5    |
      | 5e9421c24c4af60018b45bd5    |
      | 5e9421c24c4af60018b45bd5    |
    And user enter actions details to Reject products
      | key     | deleteFromShopify | all     | reason           |
      |         | false             | false   | unreject it      |
    When user make request to Reject products in bulk with Incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then user should not be able to Reject products in bulk and user should get validation error message
      | Invalid token provided          |
      | token is required.              |
    Examples:
      | token                           |
      |  sgshhshhshhshshhsh             |
      |                                 |





  Scenario Outline:Login with valid registered user details as a seller and user wants to Reject another seller's product in the bulk
    When User is able to log into application
      | email                              | password       |
      | vikrant.singh@successive.tech      | HaiVikki432    |
    Then User should be able to login to the system and store token
    And user enters productIds to Reject products
      | 5ebcf6bf972523001b770ab3    |
      | 5ebd7be3e1f3e80018cf5516    |
    And user enter actions details to Reject products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Reject products in bulk
    Then user should not be able to Reject products in bulk and user should get validation error message
      | Invalid product Ids provided. |
    Examples:
      | key     | deleteFromShopify | all     | reason         |
      | reject  | false             | false   | reject it      |




  Scenario Outline:Login with valid registered user details as a vendor and user wants to Reject another vendor's product in the bulk
    When User is able to log into application
      | email                              | password       |
      | vikrant.singh@successive.tech      | HaiVikki4321   |
    Then User should be able to login to the system and store token
    And user enters productIds to Reject products
      | 5ebcf6bf972523001b770ab3    |
      | 5ebd7be3e1f3e80018cf5516    |
    And user enter actions details to Reject products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Reject products in bulk
    Then user should not be able to Reject products in bulk and user should get validation error message
      | User is not authorized to perform this action |
    Examples:
      | key     | deleteFromShopify | all     | reason         |
      | reject  | false             | false   | reject it      |

#API hit by seller on UI
#  {"key":"reject",
#  "ids":["5ebcf6bf972523001b770ab3"],
#  "all":false,
#  "deleteFromShopify":false,
#  "reason":"rejected by seller"}

#API hit by seller on UI
#  {"key":"unreject",
#  "ids":["5ebcf6bf972523001b770ab3"],
#  "all":false,
#  "deleteFromShopify":false,
#  "reason":"unrejected by seller"}

