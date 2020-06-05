Feature: API -  Product - Bulk Delete Products.-  delete---  /product/bulk

        As a seller user
        I want to Delete products in bulk

        As a vendor user
        I want to Delete products in bulk

#  by bulk delete API -it changes only "status" : "Deleted".

  Scenario Outline:Login with valid registered user details as a seller and user wants to Delete products in bulk
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+60@successive.tech      | 123456789      |
    Then user should be able to login to the system and store token
    And user enters productIds to Delete products
      | 5eb90bc6d8e20e00170a95e1    |
      | 5eb90abdd8e20e00170a95de    |
    And user enter actions details to Delete products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Delete products in bulk
    Then user should be able to Delete products in bulk
    Examples:
      | key     | deleteFromShopify | all     | reason         |
      | delete  | false             | false   | delete it      |




  Scenario Outline:Login with valid registered user details as a vendor and user wants to Delete products in bulk
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+61@successive.tech      | 1234567890      |
    Then user should be able to login to the system and store token
    And user enters productIds to Delete products
      | 5e9ee13b2efe400018047ab5    |
      | 5e9ee0c76d2dd5001778fae9    |
    And user enter actions details to Delete products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Delete products in bulk
    Then user should be able to Delete products in bulk
    Examples:
      | key     | deleteFromShopify | all     | reason         |
      | delete  | true              | false   | delete it      |



#  Scenario Outline:Login with valid registered user details as a System Admin and user wants to Delete products in bulk
#    When User is able to log into application
#      | email                                 | password            |
#      | systemadmin@marketcube.io             | ;94jW-XY[uv*};W     |
#    Then user should be able to login to the system and store token
#    And user enters productIds to Delete products
#      | 5e9460a2cedd040017b95153    |
#    And user enter actions details to Delete products
#      | key     | deleteFromShopify     | all     |  reason     |
#      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
#    When user make request to Delete products in bulk
#    Then user should be able to Delete products in bulk
#    Examples:
#      | key     | deleteFromShopify | all     | reason         |
#      | delete  | true              | false   | delete it      |
#By Testing and by default , System admin works as a vendor



  Scenario Outline:Login with valid registered user details as a seller and without productid field user wants to Delete products in bulk
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then user should be able to login to the system and store token
    And user enters productIds to Delete products
      |     |
    And user enter actions details to Delete products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Delete products in bulk
    Then user should not be able to Delete products in bulk and user should get validation error message
      | Products is required.        |
    Examples:
      | key     | deleteFromShopify | all     | reason         |
      | delete  | false             | false   | delete it      |






  Scenario Outline:Login with valid registered user details as a seller and with invalid productid field (24digit ) user wants to Delete products in bulk
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki432    |
    Then user should be able to login to the system and store token
    And user enters productIds to Delete products
      |  123456789012345678901234   |
    And user enter actions details to Delete products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Delete products in bulk
    Then user should not be able to Delete products in bulk and user should get validation error message
      | Invalid Product provided, Not found.    |
    Examples:
      | key     | deleteFromShopify | all     | reason         |
      | delete  | false             | false   | delete it      |


  Scenario Outline:Login with valid registered user details as a seller and with invalid productid field (21digit ) user wants to Delete products in bulk
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki432    |
    Then user should be able to login to the system and store token
    And user enters productIds to Delete products
      |  1234567890123456789012   |
    And user enter actions details to Delete products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Delete products in bulk
    Then user should not be able to Delete products in bulk and user should get validation error message
      | Invalid Product provided, Not found.    |
    Examples:
      | key     | deleteFromShopify | all     | reason         |
      | delete  | false             | false   | delete it      |





  Scenario Outline:Login with valid registered user details as a seller and without follow field validation user wants to Delete products in bulk
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki432    |
    Then user should be able to login to the system and store token
    And user enters productIds to Delete products
      | 5e9421c24c4af60018b45bd5    |
      | 5e9421c24c4af60018b45bd5    |
      | 5e9421c24c4af60018b45bd5    |
     And user enter actions details to Delete products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Delete products in bulk
    Then user should not be able to Delete products in bulk and user should get validation error message
      | key is required.                             |
      | Invalid key provided.                        |
      | deleteFromShopify is required.               |
      | Invalid deleteFromShopify provided.          |
      | all is required.                             |
      | Invalid all provided.                        |
    Examples:
      | key     | deleteFromShopify | all     | reason         |
      |         | false             | false   | delete it      |
      | 111111  | false             | false   | delete it      |
      | delete  |                   | false   | delete it      |
      | delete  | 11111             | false   | delete it      |
      | delete  | false             |         | delete it      |
      | delete  | false             | 11111   | delete it      |



  Scenario Outline: User make request to Delete products in bulk with valid field by passing Incorrect/blank token data
    And user enters productIds to Delete products
      | 5e9421c24c4af60018b45bd5    |
      | 5e9421c24c4af60018b45bd5    |
      | 5e9421c24c4af60018b45bd5    |
    And user enter actions details to Delete products
      | key     | deleteFromShopify | all     | reason           |
      |         | false             | false   | delete it        |
    When user make request to Delete products in bulk with Incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then user should not be able to Delete products in bulk and user should get validation error message
      | Invalid token provided          |
      | token is required.              |
    Examples:
      | token                           |
      |  sgshhshhshhshshhsh             |
      |                                 |


  Scenario Outline:Login with valid registered user details as a seller and user wants to delete another seller's product in the bulk
    When User is able to log into application
      | email                              | password       |
      | vikrant.singh@successive.tech      | HaiVikki432    |
    Then user should be able to login to the system and store token
    And user enters productIds to Delete products
      | 5eb90c143ba7dd0018621542    |
    And user enter actions details to Delete products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Delete products in bulk
    Then user should not be able to Delete products in bulk and user should get validation error message
      | User is not authorized to perform this action. |
    Examples:
      | key     | deleteFromShopify | all     | reason         |
      | delete  | false             | false   | delete it      |



  Scenario Outline:Login with valid registered user details as a vendor and user wants to delete another vendor's product in the bulk
    When User is able to log into application
      | email                              | password       |
      | vikrant.singh@successive.tech      | HaiVikki4321   |
    Then user should be able to login to the system and store token
    And user enters productIds to Delete products
      | 5eb90c143ba7dd0018621542    |
    And user enter actions details to Delete products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Delete products in bulk
    Then user should not be able to Delete products in bulk and user should get validation error message
      | User is not authorized to perform this action. |
    Examples:
      | key     | deleteFromShopify | all     | reason         |
      | delete  | false             | false   | delete it      |


#API hit on UI
#  {"key":"delete",
#  "ids":["5eb8ed21131f9c0017ab4fd9"],
#  "all":false,
#  "deleteFromShopify":false,
#  "reason":null}
#
#  {"key":"unreject",
#  "ids":["5eb8ed1e131f9c0017ab4fd6"],
#  "all":false,
#  "deleteFromShopify":false,
#  "reason":"delete is unreject by seller"}
#
#
#
#  {"key":"delete",
#  "ids":["5eb8ed1e131f9c0017ab4fd6"],
#  "all":false,
#  "deleteFromShopify":true,
#  "reason":null}
#
#  {"key":"undelete",
#  "ids":["5eb8ed1e131f9c0017ab4fd6"],
#  "all":false,
#  "deleteFromShopify":false,
#  "reason":null}