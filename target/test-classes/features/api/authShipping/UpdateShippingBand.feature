Feature:  Auth - Update shipping band for seller -  put - /user/shipping-band

         As a registered user
         I want to update shipping band for seller

  Scenario Outline: Login with valid registered user details as a seller and user wants to update own shipping band
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+250@successive.tech     | 123!45@Vik     |
    Then User should be able to login to the system and store token
    And User enters shipping band details to update
      | _id          | name            | description      | priceType   | price   | isUpdateAllowed    |
      | <_id>        | <name>          | <description>    | <priceType> | <price> | <isUpdateAllowed>  |
    And User make a request to update shipping band
    Then User should be able to update shipping band
    Examples:
      | _id                       | name             | description                | priceType  | price  | isUpdateAllowed   |
      | 5ef36989b92c0b001258abda  | Vikrant1         | Testing                    | free       | 0      | true              |
      | 5ef36989b92c0b001258abda  | Vikrant1         | Testing                    | fixed      | 23     | true              |
      | 5ef36989b92c0b001258abda  | Vikrant1         | Testing                    | fixed      | 23     | false             |
      | 5ef36989b92c0b001258abda  | Vikrant1         | Testing                    | free       | 0      | true              |
      | 5ef36989b92c0b001258abda  | Vikrant1         | Testing                    | free       | 0      | false             |

  Scenario Outline: Login with valid registered user details as a seller and user wants to update shipping band of other seller with help of other seller shippingBandId
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+350@successive.tech     | 123!45@Vik     |
    Then User should be able to login to the system and store token
    When User enters shipping band details to update
      | _id          | name            | description      | priceType   | price   | isUpdateAllowed    |
      | <_id>        | <name>          | <description>    | <priceType> | <price> | <isUpdateAllowed>  |
    And User make a request to update shipping band
    Then User should not be able to update shipping band and user should get validation error message
      | Invalid shippingBandId provided.       |
      | Invalid shippingBandId provided.       |
      | Invalid shippingBandId provided.       |
      | Invalid shippingBandId provided.       |
      | Invalid shippingBandId provided.       |
    Examples:
      | _id                       | name             | description                | priceType  | price  | isUpdateAllowed   |
      | 5ef36989b92c0b001258abda  | Vikrant1         | Testing                    | free       | 0      | true              |
      | 5ef36989b92c0b001258abda  | Vikrant1         | Testing                    | fixed      | 23     | true              |
      | 5ef36989b92c0b001258abda  | Vikrant1         | Testing                    | fixed      | 23     | false             |
      | 5ef36989b92c0b001258abda  | Vikrant1         | Testing                    | free       |  0     | true              |
      | 5ef36989b92c0b001258abda  | Vikrant1         | Testing                    | free       |  0     | false             |

  Scenario Outline: Login with valid registered user details as a System admin and user wants to update shipping band for seller
    When User is able to log into application
      | email                                 | password       |
      | systemadmin@marketcube.io             | 12345678n@N    |
    Then User should be able to login to the system and store token
    When User enters shipping band details to update
      | _id          | name            | description      | priceType   | price   | isUpdateAllowed    |
      | <_id>        | <name>          | <description>    | <priceType> | <price> | <isUpdateAllowed>  |
    And User make a request to update shipping band
    Then User should not be able to update shipping band and user should get validation error message
      | User is not authorized to perform this action                 |
      | User is not authorized to perform this action                 |
      | User is not authorized to perform this action                 |
      | User is not authorized to perform this action                 |
      | User is not authorized to perform this action                 |
    Examples:
      | _id                       | name             | description                | priceType  | price   | isUpdateAllowed   |
      |  5e5f8264e344580012668ec8 | Vikrant1         | Testing                    | free       | 0       | true              |
      | 5e5f8264e344580012668ec8  | Vikrant1         | Testing                    | fixed      | 23      | true              |
      | 5e5f8264e344580012668ec8  | Vikrant1         | Testing                    | fixed      | 23      | false             |
      | 5e5f8264e344580012668ec8  | Vikrant1         | Testing                    | free       | 0       | true              |
      | 5e5f8264e344580012668ec8  | Vikrant1         | Testing                    | free       | 0       | false             |

  Scenario Outline: Login with valid registered user details as a Vendor and user wants to update the shipping band which he is allowed
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+251@successive.tech     | 1234@Vik       |
    Then User should be able to login to the system and store token
    When User enters shipping band details to update
      | _id          | name            | description      | priceType   | price   | isUpdateAllowed    | parentId   |
      | <_id>        | <name>          | <description>    | <priceType> | <price> | <isUpdateAllowed>  | <parentId> |
    And User make a request to update shipping band
    Then User should be able to update shipping band
    Examples:
      | _id                       | name               | description     | priceType  | price   | isUpdateAllowed   | parentId                 |
      |  5ef47e02faff150012c189ea | Updates for Vendor | hhhhhh          | free       | 0       | true              | 5ef47e02faff150012c189ea |
      |  5ef47e02faff150012c189ea | Updates for Vendor | hhhhhh          | fixed      | 12      | true              | 5ef47e02faff150012c189ea |

  Scenario Outline: Login with valid registered user details as a Vendor and user wants to update the shipping band which he is not allowed
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+251@successive.tech     | 1234@Vik       |
    Then User should be able to login to the system and store token
    When User enters shipping band details to update
      | _id          | name            | description      | priceType   | price   | isUpdateAllowed    | parentId   |
      | <_id>        | <name>          | <description>    | <priceType> | <price> | <isUpdateAllowed>  | <parentId> |
    And User make a request to update shipping band
    Then User should not be able to update shipping band and user should get validation error message
      | User is not authorized to perform this action                 |
      | User is not authorized to perform this action                 |
    Examples:
      | _id                       | name               | description     | priceType  | price   | isUpdateAllowed   | parentId                 |
      |  5ef369b7faff150012c18499 | Updates for Vendor | hhhhhh          | free       | 0       | true              | 5ef369b7faff150012c18499 |
      |  5ef369b7faff150012c18499 | Updates for Vendor | hhhhhh          | fixed      | 12      | true              | 5ef369b7faff150012c18499 |
#Bug Login as a vendor and  user wants to update the shipping band which he is not allowed then it should be expected error messages as a "User is not authorized to perform this action " but but in actual scenario it accepted the requests and give status ok and data true

  Scenario Outline: Login with valid registered user details as a seller and without follow field validation user wants to update shipping band for seller
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+250@successive.tech     | 123!45@Vik     |
    Then User should be able to login to the system and store token
    When User enters shipping band details to update
      | _id   | name   | description   | priceType   | price   | isUpdateAllowed          |
      | <_id> | <name> | <description> | <priceType> | <price> | <isUpdateAllowed>        |
    And User make a request to update shipping band
    Then User should not be able to update shipping band and user should get validation error message
      | _id is required.                  |
      | Name is required.                 |
      | Description is required.          |
      | PriceType is required.            |
      | Invalid priceType provided.       |
      | Invalid priceType provided.       |
      | Please provide price for shipping band or select Free as shipping |
      | Please provide price for shipping band or select Free as shipping |
      | Please enter 0 for Free priceType, should not be more than 0      |
      | Invalid shippingBandId provided.       |
      | Invalid shippingBandId provided.       |
      | Invalid shippingBandId provided.       |
      | Invalid shippingBandId provided.       |
    Examples:
      | _id                       | name             | description | priceType | price | isUpdateAllowed |
      |                           | Vikrant1         | dsc         | fixed     | 22    | true            |
      |  5ddf8f3070ae98001bda132e |                  | dsc         | fixed     | 22    | true            |
      |  5ddf8f3070ae98001bda132e | Vikrant1         |             | fixed     | 22    | true            |
      |  5ddf8f3070ae98001bda132e | Vikrant1         | dsc         |           | 22    | true            |
      |  5ddf8f3070ae98001bda132e | Vikrant1         | dsc         | ssssswwww | 0     | false           |
      |  5ddf8f3070ae98001bda132e | Vikrant1         | dsc         | 11111111  | 0     | false           |
      |  5ddf8f3070ae98001bda132e | Vikrant1         | dsc         | fixed     | 0     | false           |
      |  5ddf8f3070ae98001bda132e | Vikrant1         | dsc         | fixed     |       | false           |
      |  5ddf8f3070ae98001bda132e | Vikrant1         | dsc         | free      | 10    | false           |
      | 12345678901234567890123   | Vikrant1         | Testing     | free      | 0     | false           |
      | 123456789012345678901234  | Vikrant1         | Testing     | free      | 0     | false           |
      | 1234567890123456789012345 | Vikrant1         | Testing     | free      | 0     | false           |
      | aaaaaaaaaaaaaaaaaaaaaaaa  | Vikrant1         | Testing     | free      | 0     | false           |

  Scenario: Login with valid registered user details as a seller and user wants to update shipping band for seller with with already existed shipping band name
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+250@successive.tech     | 123!45@Vik     |
    Then User should be able to login to the system and store token
    When User enters shipping band details to update
      | _id                       | name                  | description                | priceType   | price   | isUpdateAllowed    |
      |  5ef47e02faff150012c189ea | Shipping Band Exists  | Testing purpose only       | free        | 22      | true               |
    And User make a request to update shipping band
    Then User should not be able to update shipping band and user should get validation error message
      | A shipping band already exists with given name.            |
#Bug- Login as a seller and when user update the shipping band with already existed shipping band name then it should be expected error message as a "A shipping band already exists with given name" but in actual scenario it accepted the requests and give status ok and data true

  Scenario Outline: User make a request to update shipping band with valid shipping details field by passing Incorrect/blank token data
    When User enter details for update shipping band for seller with Incorrect/blank token field
      | _id                       | name     | description                | priceType   | price   | isUpdateAllowed   |
      |  5e5f81341c0d8c0012afb462 | Vikrant1 | this is the desc for fixed | fixed       | 23      | true              |
    When User make a request to request to update shipping band with Incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then User should not be able to update shipping band and user should get validation error message
      | Invalid token provided          |
      | Token is required.              |
    Examples:
      | token                           |
      |  sgshhshhshhshshhsh             |
      |                                 |

  Scenario: Login with valid registered user details as a seller and without isUpdateAllowed field user wants to update shipping band for seller
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+250@successive.tech     | 123!45@Vik     |
    Then User should be able to login to the system and store token
    When User enters shipping band details to update
      | _id                       | name             | description                | priceType   | price   | isUpdateAllowed  |
      | 5ef36989b92c0b001258abda  | Shubh Mangal     | Testing                    | free        | 0       |                  |
    And Without isUpdateAllowed field user make a request to update shipping band
    Then User should not be able to update shipping band and user should get validation error message
      | IsUpdateAllowed is required.   |

  Scenario Outline: Login with valid registered user details as a Vendor and without follow field validation user wants to update the shipping band which he is allowed
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+251@successive.tech     | 1234@Vik       |
    Then User should be able to login to the system and store token
    When User enters shipping band details to update
      | _id          | name            | description      | priceType   | price   | isUpdateAllowed    | parentId   |
      | <_id>        | <name>          | <description>    | <priceType> | <price> | <isUpdateAllowed>  | <parentId> |
    And User make a request to update shipping band
    Then User should not be able to update shipping band and user should get validation error message
      | _id is required.                       |
      | ParentId is required.                  |
      | Invalid shippingBandId provided.       |
      | Invalid shippingBandId provided.       |
      | Invalid shippingBandId provided.       |
      | Invalid shippingBandId provided.       |
      | Invalid parentId provided.             |
      | Invalid parentId provided.             |
      | Invalid parentId provided.             |
      | Invalid parentId provided.             |
    Examples:
      | _id                       | name               | description     | priceType  | price   | isUpdateAllowed   | parentId                 |
      |                           | Updates for Vendor | hhhhhh          | free       | 0       | true              | 5ef47e02faff150012c189ea |
      |  5ef47e02faff150012c189ea | Updates for Vendor | hhhhhh          | fixed      | 12      | true              |                          |
      |  12345678901234567890123  | Updates for Vendor | hhhhhh          | fixed      | 12      | true              | 5ef47e02faff150012c189ea |
      |  123456789012345678901234 | Updates for Vendor | hhhhhh          | fixed      | 12      | true              | 5ef47e02faff150012c189ea |
      |  1234567890123456789012345| Updates for Vendor | hhhhhh          | fixed      | 12      | true              | 5ef47e02faff150012c189ea |
      |  aaaaaaaaaaaaaaaaaaaaaaaa | Updates for Vendor | hhhhhh          | fixed      | 12      | true              | 5ef47e02faff150012c189ea |
      |  5ef47e02faff150012c189ea | Updates for Vendor | hhhhhh          | fixed      | 12      | true              | 12345678901234567890123  |
      |  5ef47e02faff150012c189ea | Updates for Vendor | hhhhhh          | fixed      | 12      | true              | 12345678901234567890123  |
      |  5ef47e02faff150012c189ea | Updates for Vendor | hhhhhh          | fixed      | 12      | true              | 12345678901234567890123  |
      |  5ef47e02faff150012c189ea | Updates for Vendor | hhhhhh          | fixed      | 12      | true              | aaaaaaaaaaaaaaaaaaaaaaaa |


#  #---------------------------API HIT on UI--------------------------------------------------
#{"_id":"5ef3054bb92c0b001258aaf1" ,  "name":"Tony Stark",  "price":1,      "description":"Update stark2",   "priceType":"fixed",   "isUpdateAllowed":false}
#{"_id":"5ef3685bfaff150012c18496",    "name":"stark2",      "price":0,         "description":"update 6766",     "priceType":"free",      "isUpdateAllowed":true}
#{"_id":"5ef3685bfaff150012c18496","name":"stark2","price":2,"description":"update 6766","priceType":"fixed","isUpdateAllowed":true,"parentId":"5ef3685bfaff150012c18496"}
#{"_id":"5ef47a07e8ae207603ae3c6a","name":"Only for Vendor","price":0,"description":"Testing1234","priceType":"free","isUpdateAllowed":true,"parentId":"5ef473aab92c0b001258b014"}
#{"_id":"5ef47e02faff150012c189ea","name":"Updates for Vendor","price":0.05,"description":"hhhhhh","priceType":"fixed","isUpdateAllowed":true,"parentId":"5ef47e02faff150012c189ea"}