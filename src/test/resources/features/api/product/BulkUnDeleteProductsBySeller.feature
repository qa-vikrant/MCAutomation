Feature: API -  Product - Bulk Un-Delete Products-  PUT---  /product/bulk

       As a seller user
       I want to Un-Delete products in bulk

Deleted action by seller and vendor both
for deleted product by seller we perform action ,as  seller perform undelete and vendor perform resubmit
for rejected product by seller we perform action ,as  seller perform unrejected and vendor perform resubmit .

  Scenario Outline:Login with valid registered user details as a seller and user wants to Un-Delete products in bulk
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+60@successive.tech      | 123456789      |
    Then user should be able to login to the system and store token
    And user enters productIds to Un-Delete products
      | 5eb90bc6d8e20e00170a95e1    |
      | 5eb90abdd8e20e00170a95de    |
    And user enter actions details to Un-Delete products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Un-Delete products in bulk
    Then user should be able to Un-Delete products in bulk
    Examples:
      | key       | deleteFromShopify | all     | reason            |
      | undelete  | false             | false   | undelete  it      |




  Scenario Outline:Login with valid registered user details as a vendor and user wants to Un-Delete products in bulk
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+61@successive.tech      | 1234567890      |
    Then user should be able to login to the system and store token
    And user enters productIds to Un-Delete products
      | 5eb90bc6d8e20e00170a95e1    |
      | 5eb90abdd8e20e00170a95de    |
    And user enter actions details to Un-Delete products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Un-Delete products in bulk
    Then user should not be able to Un-Delete products in bulk and user should get validation error message
      | User is not authorized to perform this action |
    Examples:
      | key       | deleteFromShopify | all     | reason           |
      | undelete  | false             | false   | undelete it      |



#  Scenario Outline:Login with valid registered user details as a System Admin and user wants to Un-Delete products in bulk
#    When User is able to log into application
#      | email                                 | password       |
#      | systemadmin@marketcube.io             | 12345678n@N    |
#    Then user should be able to login to the system and store token
#    And user enters productIds to Un-Delete products
#      | 5e9421c24c4af60018b45bd5    |
#      | 5e9421c24c4af60018b45bd5    |
#      | 5e9421c24c4af60018b45bd5    |
#    And user enter actions details to Un-Delete products
#      | key     | deleteFromShopify     | all     |  reason     |
#      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
#    When user make request to Un-Delete products in bulk
#    Then user should not be able to Un-Delete products in bulk and user should get validation error message
#      | User is not authorized to perform this action |
#    Examples:
#      | key       | deleteFromShopify | all     | reason         |
#      | undelete  | false             | false   | undelete it      |




  Scenario Outline:Login with valid registered user details as a seller and without productid field user wants to Un-Delete products in bulk
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki432    |
    Then user should be able to login to the system and store token
    And user enters productIds to Un-Delete products
      |     |
    And user enter actions details to Un-Delete products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Un-Delete products in bulk
    Then user should not be able to Un-Delete products in bulk and user should get validation error message
      | productIds is required. |
    Examples:
      | key       | deleteFromShopify | all     | reason           |
      | undelete  | false             | false   | undelete it      |






  Scenario Outline:Login with valid registered user details as a seller and with invalid productid field user wants to Un-Delete products in bulk
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki432    |
    Then user should be able to login to the system and store token
    And user enters productIds to Un-Delete products
      |  121212121221   |
    And user enter actions details to Un-Delete products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Un-Delete products in bulk
    Then user should not be able to Un-Delete products in bulk and user should get validation error message
      | Invalid Product provided, Not found. |
    Examples:
      | key       | deleteFromShopify | all     | reason           |
      | undelete  | false             | false   | undelete it      |





  Scenario Outline:Login with valid registered user details as a seller and without follow field validation user wants to Un-Delete products in bulk
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki432    |
    Then user should be able to login to the system and store token
    And user enters productIds to Un-Delete products
      | 5e9421c24c4af60018b45bd5    |
      | 5e9421c24c4af60018b45bd5    |
      | 5e9421c24c4af60018b45bd5    |
    And user enter actions details to Un-Delete products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Un-Delete products in bulk
    Then user should not be able to Un-Delete products in bulk and user should get validation error message
      | key is required.                             |
      | Invalid key provided.                        |
      | deleteFromShopify is required.               |
      | Invalid deleteFromShopify provided.          |
      | all is required.                             |
      | Invalid all provided.                        |
    Examples:
      | key       | deleteFromShopify | all     | reason         |
      |           | false             | false   | delete it      |
      | 111111    | false             | false   | delete it      |
      | undelete  |                   | false   | delete it      |
      | undelete  | 11111             | false   | delete it      |
      | undelete  | false             |         | delete it      |
      | undelete  | false             | 11111   | delete it      |




  Scenario Outline: User make request to Un-Delete products in bulk with valid field by passing Incorrect/blank token data
    And user enters productIds to Un-Delete products
      | 5e9421c24c4af60018b45bd5    |
      | 5e9421c24c4af60018b45bd5    |
      | 5e9421c24c4af60018b45bd5    |
    And user enter actions details to Un-Delete products
      | key     | deleteFromShopify | all     | reason           |
      |         | false             | false   | undelete it      |
    When user make request to Un-Delete products in bulk with Incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then user should not be able to Un-Delete products in bulk and user should get validation error message
      | Invalid token provided          |
      | token is required.              |
    Examples:
      | token                           |
      |  sgshhshhshhshshhsh             |
      |                                 |


  Scenario Outline:Login with valid registered user details as a seller and user wants to Un-delete another seller's product in the bulk
    When User is able to log into application
      | email                              | password       |
      | vikrant.singh@successive.tech      | HaiVikki432    |
    Then user should be able to login to the system and store token
    And user enters productIds to Un-Delete products
      | 5eb90abdd8e20e00170a95de    |
    And user enter actions details to Un-Delete products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Un-Delete products in bulk
    Then user should not be able to Un-Delete products in bulk and user should get validation error message
      | Invalid productIds provided. |
    Examples:
      | key       | deleteFromShopify | all     | reason            |
      | undelete  | false             | false   | undelete  it      |



  Scenario Outline:Login with valid registered user details as a vendor and user wants to Un-delete another vendor's product in the bulk
    When User is able to log into application
      | email                              | password       |
      | vikrant.singh@successive.tech      | HaiVikki4321   |
    Then user should be able to login to the system and store token
    And user enters productIds to Un-Delete products
      | 5eb90bc6d8e20e00170a95e1    |
      | 5eb90abdd8e20e00170a95de    |
    And user enter actions details to Un-Delete products
      | key     | deleteFromShopify     | all     |  reason     |
      | <key>   | <deleteFromShopify>   | <all>   |  <reason>   |
    When user make request to Un-Delete products in bulk
    Then user should not be able to Un-Delete products in bulk and user should get validation error message
      | User is not authorized to perform this action |
    Examples:
      | key       | deleteFromShopify | all     | reason            |
      | undelete  | false             | false   | undelete  it      |