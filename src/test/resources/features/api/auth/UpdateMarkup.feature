Feature: API -  Auth - Update markup of products----- put ---/user/markup

        As a registered user
        I want to update markup of producgt

        for seller only----------------------------------------------
           {"price":"Price/percentage-value of markup","type":"(flat/percentage)","userId":"Object id of user who is sending the request.", "advancedValues" :[collection of values.],"ruleBy":"vendor/productType"}
        whereby "advancedValues":---------------------------------
          [{"price"   :"Price/percentage-value of advance markup","type":"vendor/category","category":"Unique id of vendor/category,"value":"flat/percentage"}]


  Scenario Outline: Login with valid registered user details as a Vendor and user wants to update markup settings of own product
    When User is able to log into application
      | email                             | password    |
      | vikrant.singh+115@successive.tech | 12345@Vik   |
    Then User should be able to login to the system and store token
    And User enters Normal markup details
      |  price       | type         | sellerId     | advancedValues     | ruleBy   |
      |  <price>     | <type>       | <sellerId>   | <advancedValues>   | <ruleBy> |
    And User make a request to Update markup settings for user
    Then User should not be able to update markup settings for user and user should get validation error message
      |  User is not authorized to perform this action.   |
      |  User is not authorized to perform this action.   |
    Examples:
      |  price       | type               | sellerId                       | advancedValues   |  ruleBy |
      |  19          | flat               | 5ee75d441ecb6000194e3db5       |                  |       1 |
      |  3           | percentage         | 5ee75d441ecb6000194e3db5       |                  |       1 |
#Bug



  Scenario Outline: Login with valid registered user details as a Seller and user wants to update markup setting of own product
    When User is able to log into application
      | email                             | password    |
      | vikrant.singh+60@successive.tech  | 1234@Vik    |
    Then User should be able to login to the system and store token
    And User enters Normal markup details
      |  price       | type         | sellerId     | advancedValues     | ruleBy   |
      |  <price>     | <type>       | <sellerId>   | <advancedValues>   | <ruleBy> |
    And User make a request to Update markup settings for user
    Then User should be able to update markup settings for user
    Examples:
      |  price       | type               | sellerId                     | advancedValues   |  ruleBy  |
      |  19          | flat               | 5ec606dbde6a7c0019f397cb     |                  |        1 |
      |  1           | percentage         | 5ec606dbde6a7c0019f397cb     |                  |       1  |



  Scenario Outline: Login with valid registered user details as a Seller and without follow field validation user wants to update markup settings of own product
    When User is able to log into application
      | email                             | password    |
      | vikrant.singh+60@successive.tech  | 1234@Vik    |
    Then User should be able to login to the system and store token
    And User enters Normal markup details
      |  price       | type         | sellerId     | advancedValues     | ruleBy   |
      |  <price>     | <type>       | <sellerId>   | <advancedValues>   | <ruleBy> |
    And User make a request to Update markup settings for user
    Then User should not be able to update markup settings for user and user should get validation error message
      |  Price is required.                |
      |  Type is required.                 |
      |  SellerId is required.             |
      |  Invalid type provided.            |
      |  Invalid sellerId provided.        |
      |  Invalid sellerId provided.        |
      |  Invalid sellerId provided.        |
    Examples:
      |  price       | type               | sellerId                     | advancedValues   |  ruleBy  |
      |              | flat               | 5ec606dbde6a7c0019f397cb     |                  |         1|
      |  3           |                    | 5ec606dbde6a7c0019f397cb     |                  |         1|
      |  3           | percentage         |                              |                  |         1|
      |  3           | 122122222s         | 5ec606dbde6a7c0019f397cb     |                  |         1|
      |  19          | flat               | 12345678901234567890123      |                  |         1|
      |  19          | flat               | 123456789012345678901234     |                  |         1|
      |  19          | flat               | 1234567890123456789012345    |                  |         1|




  Scenario Outline: Login with valid registered user details as a Seller and user wants to update product markup setting for other seller
    When User is able to log into application
      | email                             | password    |
      | vikrant.singh@successive.tech     | 1234@Vik    |
    Then User should be able to login to the system and store token
    And User enters Normal markup details
      |  price       | type         | sellerId     | advancedValues     | ruleBy   |
      |  <price>     | <type>       | <sellerId>   | <advancedValues>   | <ruleBy> |
    And User make a request to Update markup settings for user
    Then User should not be able to update markup settings for user and user should get validation error message
      |  Invalid sellerId provided.        |
      |  Invalid sellerId provided.        |
    Examples:
      |  price       | type               | sellerId                     | advancedValues   |  ruleBy  |
      |  19          | flat               | 5ec606dbde6a7c0019f397cb     |                  |        1 |
      |  1           | percentage         | 5ec606dbde6a7c0019f397cb     |                  |       1  |





  Scenario Outline: Login with valid registered user details as a Seller and user wants to update markup settings of own product
    When User is able to log into application
      | email                             | password    |
      | vikrant.singh+60@successive.tech  | 1234@Vik    |
    Then User should be able to login to the system and store token
    And User enters Normal markup details
      |  price       | type          | sellerId                       |
      |  19          | flat          | 5ec606dbde6a7c0019f397cb       |
    And User click Advanced markup settings details option
      | ruleBy    |
      | <ruleBy>  |
    And User enters Advanced markup details
      |  type       | category         | value     | price    |
      |  <type>     | <category>       | <value>   | <price>  |
    And User make a request to Update markup settings for user
    Then User should be able to update markup settings for user
    Examples:
      | ruleBy    |  type       | category                  | value       | price    |
      | vendor    |  vendor     | 5ec61d5dc54ca1001a9f0ac0  | percentage  | 13       |
      | vendor    |  vendor     | 5ec8104747f40f0019926f40  | flat        | 13       |



  Scenario Outline: Login with valid registered user details as a Seller and user wants to update product markup settings of another seller
    When User is able to log into application
      | email                             | password    |
      | vikrant.singh@successive.tech     | 1234@Vik    |
    Then User should be able to login to the system and store token
    And User enters Normal markup details
      |  price       | type          | sellerId                     |
      |  19          | flat          | 5ee75d441ecb6000194e3db5     |
    And User click Advanced markup settings details option
      | ruleBy    |
      | <ruleBy>  |
    And User enters Advanced markup details
      |  type       | category         | value     | price    |
      |  <type>     | <category>       | <value>   | <price>  |
    And User make a request to Update markup settings for user
    Then User should not be able to update markup settings for user and user should get validation error message
      |  Invalid userId provided.                 |
      |  Invalid userId provided.                 |
    Examples:
      | ruleBy    |  type       | category                  | value       | price    |
      |           |             |                           |             |          |
      | vendor    |  vendor     | 5ec61d5dc54ca1001a9f0ac0  | percentage  | 13       |
#Bug---------------------------------



  Scenario Outline: User make a request to Update markup settings with valid field details by passing Incorrect/blank token data
    And User enters Normal markup details
      |  price       | type          | sellerId                     | advancedValues     | ruleBy   |
      |  19          | flat          | 5ec606dbde6a7c0019f397cb     |                    |          |
    And User make a request to Update markup settings with incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then User should not be able to update markup settings for user and user should get validation error message
      | Invalid token provided          |
      | Token is required.              |
    Examples:
      | token                                                |
      |  sgshhshhshhshshhshsssssssssssssssssssss             |
      |                                                      |




  Scenario Outline: Login with valid registered user details as a Seller and user wants to update own markup settings of product for 3 array data
    When User is able to log into application
      | email                             | password    |
      | vikrant.singh+60@successive.tech  | 1234@Vik    |
    Then User should be able to login to the system and store token
    And User enters Normal markup details
      |  price       | type          | sellerId                     |
      |  19          | flat          | 5ec606dbde6a7c0019f397cb     |
    And User click Advanced markup settings details option
      | ruleBy    |
      | <ruleBy>  |
    And User enters Advanced markup type
      | vendor   |
      | vendor   |
      | category |
    And User enters Advanced markup category
      | 5ec61d5dc54ca1001a9f0ac0  |
      | 5ec8104747f40f0019926f40  |
      | 5ec606e449300c0e102500cd  |
    And User enters Advanced markup value
      | percentage  |
      | flat        |
      | flat        |
    And User enters Advanced markup price
      | 13.5       |
    And User make a request to Update markup settings for user
    Then User should be able to update markup settings for user
    Examples:
      | ruleBy         |
      |                |
      | vendor         |
      | productType    |
