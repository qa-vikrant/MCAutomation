Feature:  Auth - Update shipping band for seller -  put - /user/shipping-band

         As a registered user
         I want to update shipping band for seller

  Scenario Outline: Login with valid registered user details as a seller and user wants to update shipping band for seller
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then user should be able to login to the system and store token
    When User enters shipping band details to update
      | _id          | name            | description      | priceType   | price   | isUpdateAllowed    |
      | <_id>        | <name>          | <description>    | <priceType> | <price> | <isUpdateAllowed>  |
    Then User should be able to update shipping band
    Examples:
      | _id                       | name             | description                | priceType  | price  | isUpdateAllowed   |
      |  5e5f8264e344580012668ec8 | Shubh Mangal     | Testing                    | free       | 22     | true              |
      | 5e5f8264e344580012668ec8  | Vikrant1         | this is the desc for fixed | fixed      | 23     | true              |
      | 5e5f8264e344580012668ec8  | Vikrant2         | this is the desc for fixed | fixed      | 23     | false             |
      | 5e5f8264e344580012668ec8  | Vikrant3         | this is the desc for fixed | free       |        | true              |
      | 5e5f8264e344580012668ec8  | Vikrant4         | this is the desc for fixed | free       |        | false             |


  Scenario Outline: Login with valid registered user details as a seller and user wants to update shipping band of other seller with help of other seller shippingBandId
    When User is able to log into application
      | email                                    | password       |
      | vikrant.singh+60@successive.tech         | 123456789      |
    Then user should be able to login to the system and store token
    When User enters shipping band details to update
      | _id          | name            | description      | priceType   | price   | isUpdateAllowed    |
      | <_id>        | <name>          | <description>    | <priceType> | <price> | <isUpdateAllowed>  |
    Then User should not be able to update shipping band and user should get validate error message
      | Invalid _Id provided.     |
      | Invalid _Id provided.     |
      | Invalid _Id provided.     |
      | Invalid _Id provided.     |
      | Invalid _Id provided.     |
    Examples:
      | _id                       | name             | description                | priceType  | price  | isUpdateAllowed   |
      |  5e5f8264e344580012668ec8 | Shubh Mangal     | Testing                    | free       | 22     | true              |
      | 5e5f8264e344580012668ec8  | Vikrant1         | this is the desc for fixed | fixed      | 23     | true              |
      | 5e5f8264e344580012668ec8  | Vikrant2         | this is the desc for fixed | fixed      | 23     | false             |
      | 5e5f8264e344580012668ec8  | Vikrant3         | this is the desc for fixed | free       |        | true              |
      | 5e5f8264e344580012668ec8  | Vikrant4         | this is the desc for fixed | free       |        | false             |



  Scenario Outline: Login with valid registered user details as a System admin and user wants to update shipping band for seller
    When User is able to log into application
      | email                                 | password       |
      | systemadmin@marketcube.io             | 12345678n@N    |
    Then user should be able to login to the system and store token
    When User enters shipping band details to update
      | _id          | name            | description      | priceType   | price   | isUpdateAllowed    |
      | <_id>        | <name>          | <description>    | <priceType> | <price> | <isUpdateAllowed>  |
    Then User should not be able to update shipping band and user should get validate error message
      | User is not authorized to perform this action                 |
      | User is not authorized to perform this action                 |
      | User is not authorized to perform this action                 |
      | User is not authorized to perform this action                 |
      | User is not authorized to perform this action                 |
    Examples:
      | _id                       | name             | description                | priceType  | price  | isUpdateAllowed   |
      |  5e5f8264e344580012668ec8 | Shubh Mangal     | Testing                    | free       | 22     | true              |
      | 5e5f8264e344580012668ec8  | Vikrant1         | this is the desc for fixed | fixed      | 23     | true              |
      | 5e5f8264e344580012668ec8  | Vikrant2         | this is the desc for fixed | fixed      | 23     | false             |
      | 5e5f8264e344580012668ec8  | Vikrant3         | this is the desc for fixed | free       |        | true              |
      | 5e5f8264e344580012668ec8  | Vikrant4         | this is the desc for fixed | free       |        | false             |



  Scenario Outline: Login with valid registered user details as a Vendor and user wants to update the shipping band which he is allowed
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | 1234567890     |
    Then user should be able to login to the system and store token
    When User enters shipping band details to update for vendor
      | _id          | name            | description      | priceType   | price   | isUpdateAllowed    |
      | <_id>        | <name>          | <description>    | <priceType> | <price> | <isUpdateAllowed>  |
    Then User should be able to update shipping band
    Examples:
      | _id                       | name            | description                | priceType  | price  | isUpdateAllowed   |
      |  5e5f8264e344580012668ec8 | Shubh Mangal    | Testing                    | free       | 22     | true              |
      | 5e5f8264e344580012668ec8  | Vikrant         | this is the desc for fixed | fixed      | 23     | true              |
      | 5e5f8264e344580012668ec8  | Vikrant         | this is the desc for fixed | fixed      | 23     | false             |
      | 5e5f8264e344580012668ec8  | Vikrant         | this is the desc for fixed | free       |        | true              |
      | 5e5f8264e344580012668ec8  | Vikrant         | this is the desc for fixed | free       |        | false             |




  Scenario Outline: Login with valid registered user details as a Vendor and user wants to update the shipping band which he is not allowed
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | 1234567890     |
    Then user should be able to login to the system and store token
    When User enters shipping band details to update for vendor
      | _id          | name            | description      | priceType   | price   | isUpdateAllowed    |
      | <_id>        | <name>          | <description>    | <priceType> | <price> | <isUpdateAllowed>  |
    Then User should not be able to update shipping band and user should get validate error message
      | User is not authorized to perform this action                 |
      | User is not authorized to perform this action                 |
      | User is not authorized to perform this action                 |
      | User is not authorized to perform this action                 |
      | User is not authorized to perform this action                 |
    Examples:
      | _id                       | name            | description                | priceType  | price  | isUpdateAllowed   |
      | 5e5f8179e344580012668ec7  | Shubh Mangal    | Testing                    | free       | 22     | true              |
      | 5e5f8179e344580012668ec7  | Vikrant         | this is the desc for fixed | fixed      | 23     | true              |
      | 5e5f8179e344580012668ec7  | Vikrant         | this is the desc for fixed | fixed      | 23     | false             |
      | 5e5f8179e344580012668ec7  | Vikrant         | this is the desc for fixed | free       |        | true              |
      | 5e5f8179e344580012668ec7  | Vikrant         | this is the desc for fixed | free       |        | false             |
#Bug Login as a vendor and  user wants to update the shipping band which he is not allowed then it should be expected error messages as a "User is not authorized to perform this action " but but in actual scenario it accepted the requests and give status ok and data true






  Scenario Outline: Login with valid registered user details as a seller and without follow field validation user wants to update shipping band for seller
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then user should be able to login to the system and store token
    When User enters shipping band details to update
      | _id   | name   | description   | priceType   | price   | isUpdateAllowed          |
      | <_id> | <name> | <description> | <priceType> | <price> | <isUpdateAllowed>        |
    Then User should not be able to update shipping band and user should get validate error message
      | _id is required.                  |
      | Name is required.                 |
      | Description is required.          |
      | PriceType is required.            |
      | IsUpdateAllowed is required.      |
      | Invalid priceType provided.       |
      | Please provide price for shipping band or select Free as shipping |
    Examples:
      | _id                       | name             | description | priceType | price | isUpdateAllowed |
      |                           | sdf              | dsc         | free      | 22    | true            |
      |  5ddf8f3070ae98001bda132e |                  | dsc         | free      | 22    | true            |
      |  5ddf8f3070ae98001bda132e | sdf              |             | free      | 22    | true            |
      |  5ddf8f3070ae98001bda132e | sdf              | dsc         |           | 22    | true            |
      |  5ddf8f3070ae98001bda132e | sdf              | dsc         | free      | 22    |                 |
      |  5ddf8f3070ae98001bda132e | sdf              | dsc         | fixed111  | 0     | false           |
      |  5ddf8f3070ae98001bda132e | sdf              | dsc         | fixed     |       | false           |


  Scenario: Login with valid registered user details as a seller and user wants to update shipping band for seller with with already existed shipping band name
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then user should be able to login to the system and store token
    When User enters shipping band details to update
      | _id                       | name             | description                | priceType   | price   | isUpdateAllowed    |
      |  5e5f81341c0d8c0012afb462 | Ecom pvt         | Testing purpose only       | free        | 22      | true               |
    Then User should not be able to update shipping band and user should get validate error message
      | A shipping band already exists with given name            |
#Bug- Login as a seller and when user update the shipping band with already existed shipping band name then it should be expected error message as a "A shipping band already exists with given name" but in actual scenario it accepted the requests and give status ok and data true


  Scenario Outline: User make a request to update shipping band with valid shipping details field by passing Incorrect/blank token data
    When User enter details for update shipping band for seller with Incorrect/blank token field
      | _id                       | name    | description                | priceType   | price   | isUpdateAllowed   |
      |  5e5f81341c0d8c0012afb462 | Vikrant | this is the desc for fixed | fixed       | 23      | true              |
    When user make a request to request to update shipping band with Incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then User should not be able to update shipping band and user should get validate error message
      | Invalid token provided          |
      | Invalid token provided          |
    Examples:
      | token                           |
      |  sgshhshhshhshshhsh             |
      |                                 |