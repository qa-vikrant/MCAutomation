Feature: Auth - Create shipping band for seller -  post -  /user/shipping-band

         As a registered user
         I want to create the shipping band for seller

  Scenario Outline: Login with valid registered user details as a seller and user wants to create shipping band for seller
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then User should be able to login to the system and store token
    When User enter details for create shipping band for seller
      | name   | description   | priceType   | price   | isUpdateAllowed   |
      | <name> | <description> | <priceType> | <price> | <isUpdateAllowed> |
    Then User should be able to create shipping band successfully for seller
    Examples:
      | name    | description                | priceType  | price  | isUpdateAllowed   |
      | Vikrant | this is the desc for fixed | fixed      | 23     | true              |
      | Vikrant | this is the desc for fixed | fixed      | 23     | false             |
      | Vikrant | this is the desc for fixed | free       |        | true              |
      | Vikrant | this is the desc for fixed | free       |        | false             |


  Scenario Outline: Login with valid registered user details as a seller and user wants to create a shipping band for seller with already existed shipping band name
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then User should be able to login to the system and store token
    When User enter details for create shipping band for seller with already existed shipping band name
      | name   | description   | priceType   | price   | isUpdateAllowed   |
      | <name> | <description> | <priceType> | <price> | <isUpdateAllowed> |
    Then User should not be able to create shipping band for seller and user should get validation message
      | A shipping band already exists with given name                |
      | A shipping band already exists with given name                |
      | A shipping band already exists with given name                |
      | A shipping band already exists with given name                |
    Examples:
      | name    | description                | priceType  | price  | isUpdateAllowed   |
      | Express  pvt ltd | this is the desc for fixed | fixed      | 23     | true              |
      | Express  pvt ltd | this is the desc for fixed | fixed      | 23     | false             |
      | Express  pvt ltd | this is the desc for fixed | free       |        | true              |
      | Express  pvt ltd | this is the desc for fixed | free       |        | false             |



  Scenario Outline: Login with valid registered user details as a seller and without follow field validation user wants to create shipping band for seller
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then User should be able to login to the system and store token
    When User enter details for create shipping band for seller
      | name    | description    | priceType   | price   | isUpdateAllowed   |
      | <name>  | <description>  | <priceType> | <price> | <isUpdateAllowed> |
    Then User should not be able to create shipping band for seller and user should get validation message
      | Name is required.                |
      | Description is required.         |
      | PriceType is required.           |
      | Invalid priceType provided.      |
      | Please provide price for shipping band or select Free as shipping |
      | IsUpdateAllowed is required.     |
    Examples:
      | name         |  description                 | priceType        | price      | isUpdateAllowed   |
      |              | this is the desc for fixed   | fixed            | 23         | true              |
      | Albert       |                              | free             | 23         | true              |
      | Albert       | sfdsdf                       |                  | 23         | true              |
      | Albert       | sfdsdf                       | NotFixedCheck    | 23         | true              |
      | Vikrant      | this is the desc for fixed   | fixed            |            |                   |
      | Vikrant      | this is the desc for fixed   | free             | 23         |                   |
#bug when login as a seller and seller wants to create a shipping band without "isUpdateAllowed" field then it should be expected error message as a "IsUpdateAllowed is required." but in actual scenario it accepted the requests without IsUpdateAllowed field and give status ok and data true
#bug also for invalid priceType field
#bug also for blank price field



  Scenario Outline: Login with valid registered user details as a Vendor and user use their token to create shipping band for seller
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | 1234567890     |
    Then User should be able to login to the system and store token
    When User enter details for create shipping band for seller
      | name   | description   | priceType   | price   | isUpdateAllowed   |
      | <name> | <description> | <priceType> | <price> | <isUpdateAllowed> |
    Then User should not be able to create shipping band for seller and user should get validation message
      | User is not authorized to perform this action               |
    Examples:
      | name    | description                | priceType  | price  | isUpdateAllowed   |
      | Vikrant | this is the desc for fixed | fixed      | 23     | true              |



#  Scenario Outline: Login with valid registered user details as a System Admin and user use their token to create shipping band for seller
#    When User is able to log into application
#      | email                                 | password       |
#      | systemadmin@marketcube.io             | 12345678n@N    |
#    Then User should be able to login to the system and store token
#    When User enter details for create shipping band for seller
#      | name   | description   | priceType   | price   | isUpdateAllowed   |
#      | <name> | <description> | <priceType> | <price> | <isUpdateAllowed> |
#    Then User should not be able to create shipping band for seller and user should get validation message
#      | User is not authorized to perform this action               |
#    Examples:
#      | name    | description                | priceType  | price  | isUpdateAllowed   |
#      | Vikrant | this is the desc for fixed | fixed      | 23     | true              |



  Scenario Outline: User make a request to create shipping band with valid shipping details field by passing Incorrect/blank token data
    When User enter details for create shipping band for seller with Incorrect/blank token field
      | name    | description                | priceType   | price   | isUpdateAllowed   |
      | Vikrant | this is the desc for fixed | fixed       | 23      | true              |
    When user make a request to request to create shipping band with Incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then User should not be able to create shipping band for seller and user should get validation message
      | Invalid token provided          |
      | Invalid token provided          |
    Examples:
      | token                           |
      |  sgshhshhshhshshhsh             |
      |                                 |