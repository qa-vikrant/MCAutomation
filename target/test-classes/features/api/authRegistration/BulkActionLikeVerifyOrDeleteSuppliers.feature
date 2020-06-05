Feature: API - Auth - Bulk Action like verify, delete suppliers.--  put---/user/bulk-action

       As a Seller User
       User wants to take Bulk Action like verify, delete suppliers.


  Scenario Outline: Login with valid registered user details as a Seller and user want to verify suppliers in Bulk
    When User is able to log into application
      | email                             | password     |
      | vikrant.singh+60@successive.tech  | 1234@Vik     |
    Then user should be able to login to the system and store token
    And user enters that vendor details he wants to verify
      | 5ec6b46099674c00197fe6bb |
    And user enters other details for verify suppliers in Bulk
      | sellerId                   | key        | reason           |  all   | deleteFromShopify  |
      | <sellerId>                 | <key>      | <reason>         |  <all> | <deleteFromShopify>|
    And user make requests to verify suppliers in Bulk
    Then user should be able to verify suppliers in Bulk
    Examples:
      | sellerId                   | key        | reason              |  all   | deleteFromShopify  |
      | 5ec606dbde6a7c0019f397cb   | verify     | testing for verify  | false  | false              |




  Scenario Outline: Login with valid registered user details as a Seller and user want to delete suppliers in Bulk
    When User is able to log into application
      | email                             | password     |
      | vikrant.singh+60@successive.tech  | 1234@Vik     |
    Then user should be able to login to the system and store token
    And user enters that vendor details he wants to delete
      | 5ec6b46099674c00197fe6bb |
    And user enters other details for delete suppliers in Bulk
      | sellerId                   | key        | reason           |  all   | deleteFromShopify  |
      | <sellerId>                 | <key>      | <reason>         |  <all> | <deleteFromShopify>|
    And user make requests to delete suppliers in Bulk
    Then user should be able to delete suppliers in Bulk
    Examples:
      | sellerId                   | key        | reason              |  all    | deleteFromShopify  |
      | 5ec606dbde6a7c0019f397cb   | delete     | testing for delete  | false   | false              |



#    another seller perform-------------------------

  Scenario Outline: Login with valid registered user details as a Seller and user want to verify suppliers in Bulk of another seller
    When User is able to log into application
      | email                             | password     |
      | vikrant.singh@successive.tech     | 1234@Vik     |
    Then user should be able to login to the system and store token
    And user enters that vendor details he wants to verify
      | 5ec6b221c76845001ab7478a |
      | 5ec76ca1238b4a00190685ae |
    And user enters other details for verify suppliers in Bulk
      | sellerId                   | key        | reason           |  all   | deleteFromShopify  |
      | <sellerId>                 | <key>      | <reason>         |  <all> | <deleteFromShopify>|
    And user make requests to verify suppliers in Bulk
    Then user should not be able to verify suppliers in Bulk and user should get validation error message
      |  Invalid sellerId provided    |
      |  Invalid supplier provided    |
    Examples:
      | sellerId                   | key        | reason              |  all   | deleteFromShopify  |
      | 5ec67a5a58f0140019833794   | verify     | testing for verify  | false  | false              |
      | 5ec606dbde6a7c0019f397cb   | verify     | testing for verify  | false  | false              |




  Scenario Outline: Login with valid registered user details as a Seller and user want to delete suppliers in Bulk of another seller
    When User is able to log into application
      | email                             | password     |
      | vikrant.singh@successive.tech     | 1234@Vik     |
    Then user should be able to login to the system and store token
    And user enters that vendor details he wants to delete
      | 5ec6b221c76845001ab7478a |
      | 5ec76ca1238b4a00190685ae |
    And user enters other details for delete suppliers in Bulk
      | sellerId                   | key        | reason           |  all   | deleteFromShopify  |
      | <sellerId>                 | <key>      | <reason>         |  <all> | <deleteFromShopify>|
    And user make requests to delete suppliers in Bulk
    Then user should not be able to delete suppliers in Bulk and user should get validation error message
      |  Invalid sellerId provided    |
      |  Invalid supplier provided    |
    Examples:
      | sellerId                   | key        | reason              |  all    | deleteFromShopify  |
      | 5ec67a5a58f0140019833794   | delete     | testing for delete  | false   | false              |
      | 5ec606dbde6a7c0019f397cb   | delete     | testing for delete  | false   | false              |


#    another vendor perform-------------------------

  Scenario Outline: Login with valid registered user details as a Vendor and user want to verify suppliers in Bulk with valid field details
    When User is able to log into application
      | email                             | password       |
      | vikrant.singh+64@successive.tech  | 1234567890     |
    Then user should be able to login to the system and store token
    And user enters that vendor details he wants to verify
      | 5ec6b221c76845001ab7478a |
      | 5ec76ca1238b4a00190685ae |
    And user enters other details for verify suppliers in Bulk
      | sellerId                   | key        | reason           |  all   | deleteFromShopify  |
      | <sellerId>                 | <key>      | <reason>         |  <all> | <deleteFromShopify>|
    And user make requests to verify suppliers in Bulk
    Then user should not be able to verify suppliers in Bulk and user should get validation error message
      |  User is not authorized to perform this action.    |
      |  User is not authorized to perform this action.    |
    Examples:
      | sellerId                   | key        | reason              |  all   | deleteFromShopify  |
      | 5ec61d5dc54ca1001a9f0ac0   | verify     | testing for verify  | false  | false              |
      | 5ec606dbde6a7c0019f397cb   | verify     | testing for verify  | false  | false              |
#1 vendor use their own id
#2 vendor use repected selleridseller id


  Scenario Outline: Login with valid registered user details as a Vendor and user want to delete suppliers in Bulk with valid field details
    When User is able to log into application
      | email                             | password       |
      | vikrant.singh+64@successive.tech  | 1234567890     |
    Then user should be able to login to the system and store token
    And user enters that vendor details he wants to delete
      | 5ec6b221c76845001ab7478a |
      | 5ec76ca1238b4a00190685ae |
    And user enters other details for delete suppliers in Bulk
      | sellerId                   | key        | reason           |  all   | deleteFromShopify  |
      | <sellerId>                 | <key>      | <reason>         |  <all> | <deleteFromShopify>|
    And user make requests to delete suppliers in Bulk
    Then user should not be able to delete suppliers in Bulk and user should get validation error message
      |  User is not authorized to perform this action.    |
      |  User is not authorized to perform this action.    |
    Examples:
      | sellerId                   | key        | reason              |  all    | deleteFromShopify  |
      | 5ec61d5dc54ca1001a9f0ac0   | delete     | testing for delete  | false   | false              |
      | 5ec606dbde6a7c0019f397cb   | delete     | testing for delete  | false   | false              |
#1 vendor use their own id
#2 vendor use repected selleridseller id



#     System-Admin perform-------------------------


  Scenario Outline: Login with valid registered user details as a System-Admin and user want to verify suppliers in Bulk
    When User is able to log into application
      | email                             | password     |
      | systemadmin@marketcube.io         | 12345678n@N  |
    Then user should be able to login to the system and store token
    And user enters that vendor details he wants to verify
      | 5ec6b46099674c00197fe6bb |
    And user enters other details for verify suppliers in Bulk
      | isSystemAdmin                   | key        | reason           |  all   | deleteFromShopify  |
      | <isSystemAdmin>                 | <key>      | <reason>         |  <all> | <deleteFromShopify>|
    And user make requests to verify suppliers in Bulk
    Then user should be able to verify suppliers in Bulk
    Examples:
      | isSystemAdmin                   | key        | reason              |  all   | deleteFromShopify  |
      | true                            | verify     | testing for delete  | false  | false              |




  Scenario Outline: Login with valid registered user details as a System-Admin and user want to delete suppliers in Bulk
    When User is able to log into application
      | email                             | password     |
      | systemadmin@marketcube.io         | 12345678n@N  |
    Then user should be able to login to the system and store token
    And user enters that vendor details he wants to delete
      | 5ec6b46099674c00197fe6bb |
    And user enters other details for delete suppliers in Bulk
      | isSystemAdmin                   | key        | reason           |  all   | deleteFromShopify  |
      | <isSystemAdmin>                 | <key>      | <reason>         |  <all> | <deleteFromShopify>|
    And user make requests to delete suppliers in Bulk
    Then user should be able to delete suppliers in Bulk
    Examples:
      | isSystemAdmin                   | key        | reason              |  all   | deleteFromShopify  |
      | true                            | delete     | testing for delete  | false  | false              |




  Scenario Outline: Login with valid registered user details as a System-Admin and without isSystemAdmin field user want to verify suppliers in Bulk
    When User is able to log into application
      | email                             | password     |
      | systemadmin@marketcube.io         | 12345678n@N  |
    Then user should be able to login to the system and store token
    And user enters that vendor details he wants to verify
      | 5ecbf6e54101bb00199c3551 |
    And user enters other details for verify suppliers in Bulk
      | sellerId                   | key        | reason           |  all   | deleteFromShopify  |
      | <sellerId>                 | <key>      | <reason>         |  <all> | <deleteFromShopify>|
    And user make requests to verify suppliers in Bulk
    Then user should not be able to verify suppliers in Bulk and user should get validation error message
      | isSystemAdmin is required.    |
    Examples:
      | sellerId                   | key        | reason              |  all   | deleteFromShopify  |
      | 5ec606dbde6a7c0019f397cb   | verify     | testing for verify  | false  | false              |




  Scenario Outline: Login with valid registered user details as a System-Admin and without isSystemAdmin field user want to delete suppliers in Bulk
    When User is able to log into application
      | email                             | password     |
      | systemadmin@marketcube.io         | 12345678n@N  |
    Then user should be able to login to the system and store token
    And user enters that vendor details he wants to delete
      | 5ecbf6e54101bb00199c3551 |
    And user enters other details for delete suppliers in Bulk
      | sellerId                   | key        | reason           |  all   | deleteFromShopify  |
      | <sellerId>                 | <key>      | <reason>         |  <all> | <deleteFromShopify>|
    And user make requests to delete suppliers in Bulk
    Then user should not be able to delete suppliers in Bulk and user should get validation error message
      | isSystemAdmin is required.      |
    Examples:
      | sellerId                   | key        | reason              |  all    | deleteFromShopify  |
      | 5ec606dbde6a7c0019f397cb   | delete     | testing for delete  | false   | false              |





#without follow field validation  for seller

  Scenario Outline: Login with valid registered user details as a Seller and without follow field validation user want to verify suppliers in Bulk
    When User is able to log into application
      | email                             | password     |
      | vikrant.singh+60@successive.tech  | 1234@Vik     |
    Then user should be able to login to the system and store token
    And user enters that vendor details he wants to verify
      | 5ec6b221c76845001ab7478a |
      | 5ec76ca1238b4a00190685ae |
    And user enters other details for verify suppliers in Bulk
      | sellerId                   | key        | reason           |  all   | deleteFromShopify  |
      | <sellerId>                 | <key>      | <reason>         |  <all> | <deleteFromShopify>|
    And user make requests to verify suppliers in Bulk
    Then user should not be able to verify suppliers in Bulk and user should get validation error message
      | sellerId is required.                            |
      | Invalid sellerId provided                        |
      | Invalid sellerId provided                        |
      | Invalid sellerId provided                        |
      | Invalid sellerId provided                        |
      | Key is required.                                 |
      | Invalid Key provided                             |
      | Invalid Key provided                             |
    Examples:
      | sellerId                   | key        | reason              |  all   | deleteFromShopify  |
      |                            | verify     | testing for verify  | false  | false              |
      | 12345678901234567890123    | verify     | testing for verify  | false  | false              |
      | 123456789012345678901234   | verify     | testing for verify  | false  | false              |
      | 1234567890123456789012345  | verify     | testing for verify  | false  | false              |
      | aaaaaaaaaaaaaaaaaaaaaaaa   | verify     | testing for verify  | false  | false              |
      | 5ec606dbde6a7c0019f397cb   |            | testing for verify  | false  | false              |
      | 5ec606dbde6a7c0019f397cb   | aaaaaa     | testing for verify  | false  | false              |
      | 5ec606dbde6a7c0019f397cb   | 111111     | testing for verify  | false  | false              |




  Scenario Outline: Login with valid registered user details as a Seller and without follow field validation user want to delete suppliers in Bulk
    When User is able to log into application
      | email                             | password     |
      | vikrant.singh+60@successive.tech  | 1234@Vik     |
    Then user should be able to login to the system and store token
    And user enters that vendor details he wants to delete
      | 5ec6b221c76845001ab7478a |
      | 5ec76ca1238b4a00190685ae |
    And user enters other details for delete suppliers in Bulk
      | sellerId                   | key        | reason           |  all   | deleteFromShopify  |
      | <sellerId>                 | <key>      | <reason>         |  <all> | <deleteFromShopify>|
    And user make requests to delete suppliers in Bulk
    Then user should not be able to delete suppliers in Bulk and user should get validation error message
      | sellerId is required.                            |
      | Invalid sellerId provided                        |
      | Invalid sellerId provided                        |
      | Invalid sellerId provided                        |
      | Invalid sellerId provided                        |
      | Key is required.                                 |
      | Invalid Key provided                             |
      | Invalid Key provided                             |
    Examples:
      | sellerId                   | key        | reason              |  all   | deleteFromShopify  |
      |                            | delete     | testing for verify  | false  | false              |
      | 12345678901234567890123    | delete     | testing for verify  | false  | false              |
      | 123456789012345678901234   | delete     | testing for verify  | false  | false              |
      | 1234567890123456789012345  | delete     | testing for verify  | false  | false              |
      | aaaaaaaaaaaaaaaaaaaaaaaa   | delete     | testing for verify  | false  | false              |
      | 5ec606dbde6a7c0019f397cb   |            | testing for verify  | false  | false              |
      | 5ec606dbde6a7c0019f397cb   | aaaaaa     | testing for verify  | false  | false              |
      | 5ec606dbde6a7c0019f397cb   | 111111     | testing for verify  | false  | false              |


#without follow field validation  for system Admin


  Scenario Outline: Login with valid registered user details as a System-Admin and without follow field validation user want to verify suppliers in Bulk
    When User is able to log into application
      | email                             | password     |
      | systemadmin@marketcube.io         | 12345678n@N  |
    Then user should be able to login to the system and store token
    And user enters that vendor details he wants to verify
      | 5ecbf6e54101bb00199c3551 |
    And user enters other details for verify suppliers in Bulk
      | isSystemAdmin                   | key        | reason           |  all   | deleteFromShopify  |
      | <isSystemAdmin>                 | <key>      | <reason>         |  <all> | <deleteFromShopify>|
    And user make requests to verify suppliers in Bulk
    Then user should not be able to verify suppliers in Bulk and user should get validation error message
      | Key is required.                                 |
      | Invalid Key provided                             |
      | Invalid Key provided                             |
    Examples:
      | isSystemAdmin                   | key        | reason              |  all   | deleteFromShopify  |
      | true                            |            | testing for verify  | false  | false              |
      | true                            | aaaaaa     | testing for verify  | false  | false              |
      | true                            | 111111     | testing for verify  | false  | false              |






  Scenario Outline: Login with valid registered user details as a System-Admin and without follow field validation user want to delete suppliers in Bulk
    When User is able to log into application
      | email                             | password     |
      | systemadmin@marketcube.io         | 12345678n@N  |
    Then user should be able to login to the system and store token
    And user enters that vendor details he wants to delete
      | 5ecbf6e54101bb00199c3551 |
    And user enters other details for delete suppliers in Bulk
      | isSystemAdmin                   | key        | reason           |  all   | deleteFromShopify  |
      | <isSystemAdmin>                 | <key>      | <reason>         |  <all> | <deleteFromShopify>|
    And user make requests to delete suppliers in Bulk
    Then user should not be able to delete suppliers in Bulk and user should get validation error message
      | Key is required.                                 |
      | Invalid Key provided                             |
      | Invalid Key provided                             |
    Examples:
      | isSystemAdmin                   | key        | reason              |  all   | deleteFromShopify  |
      | true                            |            | testing for verify  | false  | false              |
      | true                            | aaaaaa     | testing for verify  | false  | false              |
      | true                            | 111111     | testing for verify  | false  | false              |


#without suppliers id -------------------for seller

  Scenario: Login with valid registered user details as a Seller and user want to verify suppliers in Bulk without supplier
    When User is able to log into application
      | email                             | password     |
      | vikrant.singh+60@successive.tech  | 1234@Vik     |
    Then user should be able to login to the system and store token
    And user enters that vendor details he wants to verify
      |                              |
    And user enters other details for verify suppliers in Bulk
      | sellerId                   | key        | reason              |  all   | deleteFromShopify  |
      | 5ec606dbde6a7c0019f397cb   | verify     | testing for verify  | false  | false              |
    And user make requests to verify suppliers in Bulk
    Then user should not be able to verify suppliers in Bulk and user should get validation error message
      | Supplier is required          |



  Scenario: Login with valid registered user details as a Seller and without selecting supplier user want to delete suppliers in Bulk
    When User is able to log into application
      | email                             | password     |
      | vikrant.singh+60@successive.tech  | 1234@Vik     |
    Then user should be able to login to the system and store token
    And user enters that vendor details he wants to delete
      |                                 |
    And user enters other details for delete suppliers in Bulk
      | sellerId                   | key        | reason              |  all   | deleteFromShopify  |
      | 5ec606dbde6a7c0019f397cb   | delete     | testing for delete  | false  | false              |
    And user make requests to delete suppliers in Bulk
    Then user should not be able to delete suppliers in Bulk and user should get validation error message
      | Supplier is required          |

#with invalid suppliers id -------------------for seller

  Scenario: Login with valid registered user details as a Seller and user want to verify suppliers in Bulk with invalid supplierId Field
    When User is able to log into application
      | email                             | password     |
      | vikrant.singh+60@successive.tech  | 1234@Vik     |
    Then user should be able to login to the system and store token
    And user enters that vendor details he wants to verify
      | 123456789012345678901234   |
    And user enters other details for verify suppliers in Bulk
      | sellerId                   | key        | reason              |  all   | deleteFromShopify  |
      | 5ec606dbde6a7c0019f397cb   | verify     | testing for verify  | false  | false              |
    And user make requests to verify suppliers in Bulk
    Then user should not be able to verify suppliers in Bulk and user should get validation error message
      | Invalid supplier provided                           |

  Scenario: Login with valid registered user details as a Seller and user want to delete suppliers in Bulk with invalid supplierId Field
    When User is able to log into application
      | email                             | password     |
      | vikrant.singh+60@successive.tech  | 1234@Vik     |
    Then user should be able to login to the system and store token
    And user enters that vendor details he wants to delete
      | 123456789012345678901234   |
    And user enters other details for delete suppliers in Bulk
      | sellerId                   | key        | reason              |  all   | deleteFromShopify  |
      | 5ec606dbde6a7c0019f397cb   | delete     | testing for delete  | false  | false              |
    And user make requests to delete suppliers in Bulk
    Then user should not be able to delete suppliers in Bulk and user should get validation error message
      | Invalid supplier provided                           |



  Scenario Outline: User make a request to verify suppliers in Bulk with valid field by passing Incorrect/blank token data
    And user enters that vendor details he wants to verify
      | 5ec6b221c76845001ab7478a |
      | 5ec76ca1238b4a00190685ae |
    And user enters other details for verify suppliers in Bulk
      | sellerId                   | key        | reason              |  all   | deleteFromShopify  |
      | 5ec606dbde6a7c0019f397cb   | verify     | testing for verify  | false  | false              |
    When user make request to verify suppliers in Bulk with Incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then user should not be able to verify suppliers in Bulk and user should get validation error message
      | Invalid token provided          |
      | token is required.              |
    Examples:
      | token                           |
      | sgshhshhshhshshhsh              |
      |                                 |



  Scenario Outline: User make a request to delete suppliers in Bulk with valid field by passing Incorrect/blank token data
    And user enters that vendor details he wants to delete
      | 5ec6b221c76845001ab7478a |
      | 5ec76ca1238b4a00190685ae |
    And user enters other details for delete suppliers in Bulk
      | sellerId                   | key        | reason              |  all   | deleteFromShopify  |
      | 5ec606dbde6a7c0019f397cb   | verify     | testing for verify  | false  | false              |
    When user make request to delete suppliers in Bulk with Incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then user should not be able to delete suppliers in Bulk and user should get validation error message
      | Invalid token provided          |
      | token is required.              |
    Examples:
      | token                           |
      | sgshhshhshhshshhsh              |
      |                                 |




#  --Api hi by seller to delete supplier in bulk
#  {"all":false,
#  "reason":"",
#  "deleteFromShopify":true,
#  "ids":["5ec76ca1238b4a00190685ae","5ec6b221c76845001ab7478a"],
#  "key":"delete"}
#  When seller delete supplier in bulk  we
#  1) we add sellerid related to supplier  ,its mandatory
#  2) if seller deleted supplier means it deleted from UI (or it remove association between seller and vendor ) but supplier existed in database and  (by create association we add again to seller but not full work )
#
#
#  --Api hi by system admin to delete supplier in bulk
#  {"all":false,
#  "reason":"",
#  "deleteFromShopify":false,
#  "ids":["5ec6b221c76845001ab7478a"],
#  "key":"delete"
#  }
#  When system admin deleted supplier/seller--
#  1) We add "isSystemAdmin":true mandatory
#  2)  it completely deleted supplier/seller from UI and database
#