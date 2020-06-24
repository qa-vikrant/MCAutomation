Feature: API --  Auth - Bulk Action like delete sellers.--  put  --  /user/bulk-action-seller

        Log in as a System-Admin user,
        User wants to take Bulk Action like delete sellers.

  Scenario Outline: Login with valid registered user details as a System-Admin and user want to delete sellers in Bulk
    When User is able to log into application
      | email                             | password     |
      | systemadmin@marketcube.io         | 12345678n@N  |
    Then User should be able to login to the system and store token
    And user enters that seller details he wants to delete in Bulk
      | 5ed3cd9ab41fbb001bff707b |
      | 5ed3cda54c24150019c4fb3c |
    And user enters other details to delete sellers in Bulk
      | isSystemAdmin                   | key        | reason           |  all   | deleteFromShopify  |
      | <isSystemAdmin>                 | <key>      | <reason>         |  <all> | <deleteFromShopify>|
    And user make requests to delete sellers in Bulk
    Then user should be able to delete sellers in Bulk
    Examples:
      | isSystemAdmin                   | key        | reason              |  all   | deleteFromShopify  |
      | true                            | delete     | testing for delete  | false  | false              |



  Scenario Outline: Login with valid registered user details as a Seller and user want to delete sellers in Bulk
    When User is able to log into application
      | email                             | password     |
      | vikrant.singh+60@successive.tech  | 1234@Vik     |
    Then User should be able to login to the system and store token
    And user enters that seller details he wants to delete in Bulk
      | 5ed3ce7e804f9b001ecbebb6 |
      | 5ed3ce8b4c24150019c4fb3e |
    And user enters other details to delete sellers in Bulk
      | isSystemAdmin                   | key        | reason           |  all   | deleteFromShopify  |
      | <isSystemAdmin>                 | <key>      | <reason>         |  <all> | <deleteFromShopify>|
    And user make requests to delete sellers in Bulk
    Then user should not be able to delete sellers in Bulk and user should get validation error message
      | User is not authorized to perform this action. |
      | User is not authorized to perform this action. |
    Examples:
      | isSystemAdmin                   | key        | reason              |  all   | deleteFromShopify  |
      | false                           | delete     | testing for delete  | false  | false              |
      | true                            | delete     | testing for delete  | false  | false              |




  Scenario Outline: Login with valid registered user details as a Vendor and user want to delete sellers in Bulk
    When User is able to log into application
      | email                             | password     |
      | vikrant.singh+64@successive.tech  | 1234567890   |
    Then User should be able to login to the system and store token
    And user enters that seller details he wants to delete in Bulk
      | 5ed3d8ffb41fbb001bff707f |
      | 5ed11bd3946cf200132c0feb |
    And user enters other details to delete sellers in Bulk
      | isSystemAdmin                   | key        | reason           |  all   | deleteFromShopify  |
      | <isSystemAdmin>                 | <key>      | <reason>         |  <all> | <deleteFromShopify>|
    And user make requests to delete sellers in Bulk
    Then user should not be able to delete sellers in Bulk and user should get validation error message
      | User is not authorized to perform this action. |
      | User is not authorized to perform this action. |
    Examples:
      | isSystemAdmin                   | key        | reason              |  all   | deleteFromShopify  |
      | false                           | delete     | testing for delete  | false  | false              |
      | true                            | delete     | testing for delete  | false  | false              |




  Scenario Outline: Login with valid registered user details as a System-Admin and without selecting the seller user want to delete seller in bulk
    When User is able to log into application
      | email                             | password     |
      | systemadmin@marketcube.io         | 12345678n@N  |
    Then User should be able to login to the system and store token
    And user enters that seller details he wants to delete in Bulk
      |                                 |
    And user enters other details to delete sellers in Bulk
      | isSystemAdmin                   | key        | reason           |  all   | deleteFromShopify  |
      | <isSystemAdmin>                 | <key>      | <reason>         |  <all> | <deleteFromShopify>|
    And user make requests to delete sellers in Bulk
    Then user should not be able to delete sellers in Bulk and user should get validation error message
      | SellerId is required.             |
    Examples:
      | isSystemAdmin                   | key        | reason              |  all   | deleteFromShopify  |
      | true                            | delete     | testing for delete  | false  | false              |




  Scenario Outline: Login with valid registered user details as a System-Admin and with invalid sellerId user want to delete sellers in Bulk
    When User is able to log into application
      | email                             | password     |
      | systemadmin@marketcube.io         | 12345678n@N  |
    Then User should be able to login to the system and store token
    And user enters that seller details he wants to delete in Bulk
      |  123456789012345678901234       |
    And user enters other details to delete sellers in Bulk
      | isSystemAdmin                   | key        | reason           |  all   | deleteFromShopify  |
      | <isSystemAdmin>                 | <key>      | <reason>         |  <all> | <deleteFromShopify>|
    And user make requests to delete sellers in Bulk
    Then user should not be able to delete sellers in Bulk and user should get validation error message
      | Invalid SellerId provided       |
    Examples:
      | isSystemAdmin                   | key        | reason              |  all   | deleteFromShopify  |
      | true                            | delete     | testing for delete  | false  | false              |




  Scenario Outline: Login with valid registered user details as a System-Admin and with follow field validation user want to delete sellers in Bulk
    When User is able to log into application
      | email                             | password     |
      | systemadmin@marketcube.io         | 12345678n@N  |
    Then User should be able to login to the system and store token
    And user enters that seller details he wants to delete in Bulk
      | 5ed3e923b41fbb001bff7085 |
      | 5ed3e91db41fbb001bff7083 |
    And user enters other details to delete sellers in Bulk
      | isSystemAdmin                   | key        | reason           |  all   | deleteFromShopify  |
      | <isSystemAdmin>                 | <key>      | <reason>         |  <all> | <deleteFromShopify>|
    And user make requests to delete sellers in Bulk
    Then user should not be able to delete sellers in Bulk and user should get validation error message
      | Key is required.                                 |
      | Invalid Key provided                             |
      | Invalid Key provided                             |
    Examples:
      | isSystemAdmin                   | key        | reason              |  all   | deleteFromShopify  |
      | true                            |            | testing for delete  | false  | false              |
      | true                            | verify     | testing for delete  | false  | false              |
      | true                            | 111111     | testing for delete  | false  | false              |





  Scenario Outline: Login with valid registered user details as a System-Admin and without isSystemAdmin field user want to delete suppliers in Bulk
    When User is able to log into application
      | email                             | password     |
      | systemadmin@marketcube.io         | 12345678n@N  |
    Then User should be able to login to the system and store token
    And user enters that seller details he wants to delete in Bulk
      | 5ecbf6e54101bb00199c3551 |
    And user enters other details to delete sellers in Bulk
      | key        | reason           |  all   | deleteFromShopify  |
      | <key>      | <reason>         |  <all> | <deleteFromShopify>|
    And user make requests to delete sellers in Bulk
    Then user should not be able to delete sellers in Bulk and user should get validation error message
      | isSystemAdmin is required.      |
    Examples:
      | key        | reason              |  all    | deleteFromShopify  |
      | delete     | testing for delete  | false   | false              |




  Scenario Outline: User make a request to delete sellers in Bulk with valid field by passing Incorrect/blank token data
    And user enters that seller details he wants to delete in Bulk
      | 5ed3cd9ab41fbb001bff707b |
      | 5ed3cda54c24150019c4fb3c |
    And user enters other details to delete sellers in Bulk
      | isSystemAdmin                   | key        | reason              |  all   | deleteFromShopify  |
      | true                            | delete     | testing for delete  | false  | false              |
    When user make request to delete sellers in Bulk with Incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then user should not be able to delete sellers in Bulk and user should get validation error message
      | Invalid token provided          |
      | token is required.              |
    Examples:
      | token                           |
      | sgshhshhshhshshhsh              |
      |                                 |