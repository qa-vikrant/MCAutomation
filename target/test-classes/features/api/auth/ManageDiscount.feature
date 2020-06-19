Feature: API - Auth - Manage discount functionality for user---  post-- /user/discount

          As a registered user(seller/Vendor)
          User want to manage discount for user

          for vendor --------------------------------------------
             {"price":"Price/percentage-value of discount","type":"(flat/percentage)","userId":"Object id of user who is sending the request.", "advancedValues" :[collection of values.],"ruleBy":"vendor/productType"}
          for seller----------------------------------------------
             {"price":"Price/percentage-value of discount","type":"(flat/percentage)","userId":"Object id of user who is sending the request.", "advancedValues" :[collection of values.],"ruleBy":"vendor/productType"}
          whereby "advancedValues":---------------------------------
             [{"price"   :"Price/percentage-value of advance discount","type":"vendor/category","category":"Unique id of vendor/category,"value":"flat/percentage"}]


  Scenario Outline: Login with valid registered user details as a Vendor and user wants to update own discount settings
    When User is able to log into application
      | email                             | password    |
      | vikrant.singh+115@successive.tech | 12345@Vik   |
    Then User should be able to login to the system and store token
    And User enters Normal discount details
      |  price       | type         | userId     | advancedValues     | ruleBy   |
      |  <price>     | <type>       | <userId>   | <advancedValues>   | <ruleBy> |
    And User make a request to Update discount settings for user
    Then User should be able to update discount settings for user
    Examples:
      |  price       | type               | userId                       | advancedValues   |  ruleBy |
      |  19          | flat               | 5ee75d441ecb6000194e3db5     |                  |         |
      |  3           | percentage         | 5ee75d441ecb6000194e3db5     |                  |         |



  Scenario Outline: Login with valid registered user details as a Vendor and without follow field validation user wants to update own discount settings
    When User is able to log into application
      | email                             | password    |
      | vikrant.singh+115@successive.tech | 12345@Vik   |
    Then User should be able to login to the system and store token
    And User enters Normal discount details
      |  price       | type         | userId     | advancedValues     | ruleBy   |
      |  <price>     | <type>       | <userId>   | <advancedValues>   | <ruleBy> |
    And User make a request to Update discount settings for user
    Then User should not be able to update discount settings for user and user should get validation error message
      |  Price is required.                |
      |  Type is required.                 |
      |  UserId is required.               |
      |  Invalid type provided.            |
      |  Invalid userId provided.          |
      |  Invalid userId provided.          |
      |  Invalid userId provided.          |
    Examples:
      |  price       | type               | userId                       | advancedValues   |  ruleBy |
      |              | flat               | 5ee75d441ecb6000194e3db5     |                  |         |
      |  3           |                    | 5ee75d441ecb6000194e3db5     |                  |         |
      |  3           | percentage         |                              |                  |         |
      |  3           | 122122222s         | 5ee75d441ecb6000194e3db5     |                  |         |
      |  19          | flat               | 12345678901234567890123      |                  |         |
      |  19          | flat               | 123456789012345678901234     |                  |         |
      |  19          | flat               | 1234567890123456789012345    |                  |         |





  Scenario Outline: Login with valid registered user details as a Vendor and user wants to update discount settings of another vendor
    When User is able to log into application
      | email                             | password    |
      | vikrant.singh+61@successive.tech  | 1234567890  |
    Then User should be able to login to the system and store token
    And User enters Normal discount details
      |  price       | type         | userId     | advancedValues     | ruleBy   |
      |  <price>     | <type>       | <userId>   | <advancedValues>   | <ruleBy> |
    And User make a request to Update discount settings for user
    Then User should not be able to update discount settings for user and user should get validation error message
      |  Invalid userId provided.                |
      |  Invalid userId provided.                |
    Examples:
      |  price       | type               | userId                       | advancedValues   |  ruleBy |
      |  19          | flat               | 5ee75d441ecb6000194e3db5     |                  |         |
      |  6           | percentage         | 5ee75d441ecb6000194e3db5     |                  |         |



  Scenario Outline: Login with valid registered user details as a Seller and user wants to update own discount settings
    When User is able to log into application
      | email                             | password    |
      | vikrant.singh+60@successive.tech  | 1234@Vik    |
    Then User should be able to login to the system and store token
    And User enters Normal discount details
      |  price       | type         | userId     | advancedValues     | ruleBy   |
      |  <price>     | <type>       | <userId>   | <advancedValues>   | <ruleBy> |
    And User make a request to Update discount settings for user
    Then User should be able to update discount settings for user
    Examples:
      |  price       | type               | userId                       | advancedValues   |  ruleBy  |
      |  19          | flat               | 5ec606dbde6a7c0019f397cb     |                  |        1 |
      |  3           | percentage         | 5ec606dbde6a7c0019f397cb     |                  |       1  |






  Scenario Outline: Login with valid registered user details as a Seller and without follow field validation user wants to update own discount settings
    When User is able to log into application
      | email                             | password    |
      | vikrant.singh+60@successive.tech  | 1234@Vik    |
    Then User should be able to login to the system and store token
    And User enters Normal discount details
      |  price       | type         | userId     | advancedValues     | ruleBy   |
      |  <price>     | <type>       | <userId>   | <advancedValues>   | <ruleBy> |
    And User make a request to Update discount settings for user
    Then User should not be able to update discount settings for user and user should get validation error message
      |  Price is required.                |
      |  Type is required.                 |
      |  UserId is required.               |
      |  Invalid type provided.            |
      |  Invalid userId provided.          |
      |  Invalid userId provided.          |
      |  Invalid userId provided.          |
    Examples:
      |  price       | type               | userId                       | advancedValues   |  ruleBy  |
      |              | flat               | 5ec606dbde6a7c0019f397cb     |                  |         1|
      |  3           |                    | 5ec606dbde6a7c0019f397cb     |                  |         1|
      |  3           | percentage         |                              |                  |         1|
      |  3           | 122122222s         | 5ec606dbde6a7c0019f397cb     |                  |         1|
      |  19          | flat               | 12345678901234567890123      |                  |         1|
      |  19          | flat               | 123456789012345678901234     |                  |         1|
      |  19          | flat               | 1234567890123456789012345    |                  |         1|




  Scenario Outline: Login with valid registered user details as a Seller and user wants to update discount settings of other seller
    When User is able to log into application
      | email                             | password    |
      | vikrant.singh@successive.tech     | 1234@Vik    |
    Then User should be able to login to the system and store token
    And User enters Normal discount details
      |  price       | type         | userId     | advancedValues     | ruleBy   |
      |  <price>     | <type>       | <userId>   | <advancedValues>   | <ruleBy> |
    And User make a request to Update discount settings for user
    Then User should not be able to update discount settings for user and user should get validation error message
      |  Invalid userId provided.                |
      |  Invalid userId provided.                |
    Examples:
      |  price       | type               | userId                       | advancedValues   |  ruleBy  |
      |  19          | flat               | 5ec606dbde6a7c0019f397cb     |                  |        1 |
      |  3           | percentage         | 5ec606dbde6a7c0019f397cb     |                  |       1  |





  Scenario Outline: Login with valid registered user details as a Seller and user wants to update own advanced discount settings
    When User is able to log into application
      | email                             | password    |
      | vikrant.singh+60@successive.tech  | 1234@Vik    |
    Then User should be able to login to the system and store token
    And User enters Normal discount details
      |  price       | type          | userId                       |
      |  19          | flat          | 5ec606dbde6a7c0019f397cb     |
    And User click Advanced discount settings details option
      | ruleBy    |
      | <ruleBy>  |
    And User enters Advanced discount details
      |  type       | category         | value     | price    |
      |  <type>     | <category>       | <value>   | <price>  |
    And User make a request to Update discount settings for user
    Then User should be able to update discount settings for user
    Examples:
      | ruleBy    |  type       | category                  | value       | price    |
      | vendor    |  vendor     | 5ec61d5dc54ca1001a9f0ac0  | percentage  | 13       |
      | vendor    |  vendor     | 5ec8104747f40f0019926f40  | flat        | 13       |
      | vendor    |  category   | 5ec606e449300c0e102500cd  | flat        | 12       |



  Scenario Outline: Login with valid registered user details as a Seller and user wants to update advanced discount settings of another seller
    When User is able to log into application
      | email                              | password    |
      | vikrant.singh@successive.tech      | 1234@Vik    |
    Then User should be able to login to the system and store token
    And User enters Normal discount details
      |  price       | type          | userId                       |
      |  19          | flat          | 5ec606dbde6a7c0019f397cb     |
    And User click Advanced discount settings details option
      | ruleBy    |
      | <ruleBy>  |
    And User enters Advanced discount details
      |  type       | category         | value     | price    |
      |  <type>     | <category>       | <value>   | <price>  |
    And User make a request to Update discount settings for user
    Then User should not be able to update discount settings for user and user should get validation error message
      |  Invalid userId provided.                 |
      |  Invalid userId provided.                 |
    Examples:
      | ruleBy    |  type       | category                  | value       | price    |
      |           |             |                           |             |          |
      | vendor    |  vendor     | 5ec61d5dc54ca1001a9f0ac0  | percentage  | 13       |
#Bug---------------------------------


  Scenario Outline: User make a request to Update discount settings with valid field details  by passing Incorrect/blank token data
    And User enters Normal discount details
      |  price       | type          | userId                       |
      |  19          | flat          | 5ec606dbde6a7c0019f397cb     |
    And User make a request to Update discount settings with incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then User should not be able to update discount settings for user and user should get validation error message
      | Invalid token provided          |
      | Token is required.              |
    Examples:
      | token                                                |
      |  sgshhshhshhshshhshsssssssssssssssssssss             |
      |                                                      |




  Scenario Outline: Login with valid registered user details as a Seller and user wants to update own advanced discount setting for 3 array data
    When User is able to log into application
      | email                             | password    |
      | vikrant.singh+60@successive.tech  | 1234@Vik    |
    Then User should be able to login to the system and store token
    And User enters Normal discount details
      |  price       | type          | userId                       |
      |  19          | flat          | 5ec606dbde6a7c0019f397cb     |
    And User click Advanced discount settings details option
      | ruleBy    |
      | <ruleBy>  |
    And User enters Advanced discount type
      | vendor   |
      | vendor   |
      | category |
    And User enters Advanced discount category
      | 5ec61d5dc54ca1001a9f0ac0  |
      | 5ec8104747f40f0019926f40  |
      | 5ec606e449300c0e102500cd  |
    And User enters Advanced discount value
      | percentage  |
      | flat        |
      | flat        |
    And User enters Advanced discount price
      | 13.5       |
    And User make a request to Update discount settings for user
    Then User should be able to update discount settings for user
    Examples:
      | ruleBy         |
      |                |
      | vendor         |
      | productType    |





#  API hit on UI-------------by seller
#    {
#"advancedValues":[{"type":"category",
#                                  "category":"5ec606e449300c0e102500cd",
#                                  "value":"flat",
#                                     "price":10
#                                  }],
#"ruleBy":"productType",
#"price":1,
#"type":"flat"
#}
#{"advancedValues":[{"type":"vendor","category":"5ec61d5dc54ca1001a9f0ac0","value":"percentage","price":13},
#                                    {"type":"vendor","category":"5ec8104747f40f0019926f40","value":"flat","price":15},
#                                   {"type":"category","category":"5ec606e449300c0e102500cd","value":"percentage","price":2}],
# "ruleBy":"vendor","price":18,"type":"flat"}