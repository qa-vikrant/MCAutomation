Feature: API -  Product - Bulk Re-submit Products.-  put -  /product/bulk-resubmit


        As a vendor user
        I want to Re-submit products in bulk

        only seller perform undelete and vendor perform resubmit actions.


  Scenario Outline:Login with valid registered user details as a seller and user wants to Re-submit products in bulk
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki432    |
    Then User should be able to login to the system and store token
    And user enters productIds to Re-submit products
      | 5e94640acedd040017b95159    |
      | 5e946409cedd040017b95156    |
      | 5e94640ccedd040017b9515c    |
    And user enter actions details to Re-submit products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Re-submit products in bulk
    Then user should not be able to Re-submit products in bulk and user should get validation error message
      | User is not authorized to perform this action |
    Examples:
      | key       | deleteFromShopify | all     | reason         |
      | resubmit  | false             | false   | reject it      |




  Scenario Outline:Login with valid registered user details as a vendor and user wants to Re-submit products in bulk
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+61@successive.tech      | 1234567890     |
    Then User should be able to login to the system and store token
    And user enters productIds to Re-submit products
      | 5ebc1085e81c740017cd8061    |
    And user enter actions details to Re-submit products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Re-submit products in bulk
    Then user should be able to Re-submit products in bulk
    Examples:
      | key         |  deleteFromShopify   | all     | reason         |
      | resubmit    | false                | false   | resubmit it    |



#  Scenario Outline:Login with valid registered user details as a System Admin and user wants to Re-submit products in bulk
#    When User is able to log into application
#      | email                                 | password       |
#      | systemadmin@marketcube.io             | 12345678n@N    |
#    Then User should be able to login to the system and store token
#    And user enters productIds to Re-submit products
#      | 5e94640acedd040017b95159    |
#      | 5e946409cedd040017b95156    |
#      | 5e94640ccedd040017b9515c    |
#    And user enter actions details to Re-submit products
#      | key     | deleteFromShopify     | all     |  reason     |
#      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
#    When user make request to Re-submit products in bulk
#    Then user should be able to Re-submit products in bulk
#    Examples:
#      | key       | deleteFromShopify | all     | reason         |
#      | resubmit  | false             | false   | reject it      |




  Scenario Outline:Login with valid registered user details as a vendor and without productid field user wants to Re-submit products in bulk
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | 1234567890     |
    Then User should be able to login to the system and store token
    And user enters productIds to Re-submit products
      |     |
    And user enter actions details to Re-submit products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Re-submit products in bulk
    Then user should not be able to Re-submit products in bulk and user should get validation error message
      | productIds is required. |
    Examples:
      | key       | deleteFromShopify | all     | reason         |
      | resubmit  | false             | false   | reject it      |


  Scenario Outline:Login with valid registered user details as a vendor and with invalid productid field user wants to Re-submit products in bulk
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | 1234567890     |
    Then User should be able to login to the system and store token
    And user enters productIds to Re-submit products
      |  121212121221   |
    And user enter actions details to Re-submit products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Re-submit products in bulk
    Then user should not be able to Re-submit products in bulk and user should get validation error message
      | Invalid productIds provided. |
    Examples:
      | key     | deleteFromShopify | all     | reason         |
      | reject  | false             | false   | reject it      |


  Scenario Outline:Login with valid registered user details as a vendor and without follow field validation user wants to Reject products in bulk
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | 1234567890     |
    Then User should be able to login to the system and store token
    And user enters productIds to Re-submit products
      | 5e9421c24c4af60018b45bd5    |
      | 5e9421c24c4af60018b45bd5    |
      | 5e9421c24c4af60018b45bd5    |
    And user enter actions details to Re-submit products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Re-submit products in bulk
    Then user should not be able to Re-submit products in bulk and user should get validation error message
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



  Scenario Outline: User make request to Re-submit products in bulk with valid field by passing Incorrect/blank token data
    And user enters productIds to Re-submit products
      | 5e9421c24c4af60018b45bd5    |
      | 5e9421c24c4af60018b45bd5    |
      | 5e9421c24c4af60018b45bd5    |
    And user enter actions details to Re-submit products
      | key     | deleteFromShopify | all     | reason           |
      |         | false             | false   | unreject it      |
    When user make request to Re-submit products in bulk with Incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then user should not be able to Re-submit products in bulk and user should get validation error message
      | Invalid token provided          |
      | token is required.              |
    Examples:
      | token                           |
      |  sgshhshhshhshshhsh             |
      |                                 |




  Scenario Outline:Login with valid registered user details as a vendor and user wants to Re-submit another vendor's product in the bulk
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+62@successive.tech      | 1234567890     |
    Then User should be able to login to the system and store token
    And user enters productIds to Re-submit products
      | 5ebc1085e81c740017cd8061    |
    And user enter actions details to Re-submit products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Re-submit products in bulk
    Then user should not be able to Re-submit products in bulk and user should get validation error message
      | Invalid productIds provided. |
    Examples:
      | key         |  deleteFromShopify   | all     | reason         |
      | resubmit    | false                | false   | resubmit it    |



  Scenario Outline:Login with valid registered user details as a Seller and user wants to Re-submit another vendor's product in the bulk
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki432    |
    Then User should be able to login to the system and store token
    And user enters productIds to Re-submit products
      | 5ebc1085e81c740017cd8061    |
    And user enter actions details to Re-submit products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Re-submit products in bulk
    Then user should not be able to Re-submit products in bulk and user should get validation error message
      | User is not authorized to perform this action |
    Examples:
      | key         |  deleteFromShopify   | all     | reason         |
      | resubmit    | false                | false   | resubmit it    |



#API hit by vendor on UI
#{"key":"resubmit",
# "ids":["5ebc1085e81c740017cd8061"],
# "all":false,
# "deleteFromShopify":false,
# "reason":"resubmitted by vendor .................."}