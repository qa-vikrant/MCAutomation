Feature: API -  Product - Bulk Un-Reject Products  put  /product/bulk-unreject

       As a seller user
       I want to Un-Reject products in bulk

       As a vendor user
       I want to Un-Reject products in bulk


  Scenario Outline:Login with valid registered user details as a seller and user wants to Un-Reject products in bulk
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+60@successive.tech      | 123456789      |
    Then user should be able to login to the system and store token
    And user enters productIds to Un-Reject products
      | 5ebcf6bf972523001b770ab3    |
      | 5ebd7be3e1f3e80018cf5516    |
    And user enter actions details to Un-Reject products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Un-Reject products in bulk
    Then user should be able to Un-Reject products in bulk
    Examples:
      | key       | deleteFromShopify | all     | reason         |
      | unreject  | false             | false   | unreject it    |




  Scenario Outline:Login with valid registered user details as a vendor and user wants to Un-Reject products in bulk
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+62@successive.tech      | 1234567890      |
    Then user should be able to login to the system and store token
    And user enters productIds to Un-Reject products
      | 5ebcf6bf972523001b770ab3    |
      | 5ebd7be3e1f3e80018cf5516    |
    And user enter actions details to Un-Reject products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Un-Reject products in bulk
    Then user should not be able to Un-Reject products in bulk and user should get validation error message
      | User is not authorized to perform this action |
    Examples:
      | key       | deleteFromShopify | all     | reason         |
      | unreject  | false             | false   | unreject it    |



#  Scenario Outline:Login with valid registered user details as a System Admin and user wants to Un-Reject products in bulk
#    When User is able to log into application
#      | email                                 | password       |
#      | systemadmin@marketcube.io             | 12345678n@N    |
#    Then user should be able to login to the system and store token
#    And user enters productIds to Un-Reject products
#      | 5ebcf6bf972523001b770ab3    |
#      | 5ebd7be3e1f3e80018cf5516    |
#    And user enter actions details to Un-Reject products
#      | key     | deleteFromShopify     | all     |  reason     |
#      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
#    When user make request to Un-Reject products in bulk
#    Then user should not be able to Un-Reject products in bulk and user should get validation error message
#      | User is not authorized to perform this action |
#    Examples:
#      | key       | deleteFromShopify | all     | reason         |
#      | unreject  | false             | false   | unreject it    |




  Scenario Outline:Login with valid registered user details as a seller and without productid field user wants to Un-Reject products in bulk
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then user should be able to login to the system and store token
    And user enters productIds to Un-Reject products
      |     |
    And user enter actions details to Un-Reject products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Un-Reject products in bulk
    Then user should not be able to Un-Reject products in bulk and user should get validation error message
      | productIds is required. |
    Examples:
      | key       | deleteFromShopify | all     | reason         |
      | unreject  | false             | false   | reject it      |


  Scenario Outline:Login with valid registered user details as a seller and with invalid productid field user wants to Un-Reject products in bulk
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then user should be able to login to the system and store token
    And user enters productIds to Un-Reject products
      |  121212121221   |
    And user enter actions details to Un-Reject products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Un-Reject products in bulk
    Then user should not be able to Un-Reject products in bulk and user should get validation error message
      | Invalid product Ids provided. |
    Examples:
      | key       | deleteFromShopify | all     | reason         |
      | unreject  | false             | false   | reject it      |


  Scenario Outline:Login with valid registered user details as a seller and without follow field validation user wants to Un-Reject products in bulk
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then user should be able to login to the system and store token
    And user enters productIds to Un-Reject products
      | 5e94640ccedd040017b9515c    |
      | 5e94640ecedd040017b9515f    |
      | 5e953f019bed2a00186c59e2    |
    And user enter actions details to Un-Reject products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Un-Reject products in bulk
    Then user should not be able to Un-Reject products in bulk and user should get validation error message
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



  Scenario Outline: User make request to Un-Reject products in bulk with valid field by passing Incorrect/blank token data
    And user enters productIds to Un-Reject products
      | 5e9421c24c4af60018b45bd5    |
      | 5e9421c24c4af60018b45bd5    |
      | 5e9421c24c4af60018b45bd5    |
    And user enter actions details to Un-Reject products
      | key     | deleteFromShopify | all     | reason         |
      |         | false             | false   | reject it      |
    When user make request to Un-Reject products in bulk with Incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then user should not be able to Un-Reject products in bulk and user should get validation error message
      | Invalid token provided          |
      | token is required.              |
    Examples:
      | token                           |
      |  sgshhshhshhshshhsh             |
      |                                 |

#  API hit by seller
#{"key":"unreject",
#  "ids":["5ebc1085e81c740017cd8061","5ebb861dbcec510017cd1348"],
#  "all":false,
#  "deleteFromShopify":false,
#  "reason":"unreject is working same as undelete by seller when more bul option is selected"}