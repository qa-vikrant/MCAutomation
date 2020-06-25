Feature: Auth - Create shipping band for seller -  post -  /user/shipping-band

         As a registered user
         I want to create the shipping band for seller

  Scenario Outline: Login with valid registered user details as a seller and user wants to create own shipping band
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+250@successive.tech     | 123!45@Vik     |
    Then User should be able to login to the system and store token
    And User enters shipping band details
      | name   | description   | priceType   | price   | isUpdateAllowed   |
      | <name> | <description> | <priceType> | <price> | <isUpdateAllowed> |
    And User make a request to create shipping band
    Then User should be able to create shipping band successfully
    Examples:
      | name    | description                | priceType  | price  | isUpdateAllowed   |
      | Harward | this is the desc for fixed | fixed      | 23     | true              |
      | Harward | this is the desc for fixed | fixed      | 23     | false             |
      | Harward | this is the desc for fixed | free       |        | true              |
      | Harward | this is the desc for fixed | free       |        | false             |

  Scenario Outline: Login with valid registered user details as a seller and user wants to create a shipping band for seller with already existed shipping band name
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+250@successive.tech     | 123!45@Vik     |
    Then User should be able to login to the system and store token
    And User enters shipping band details
      | name   | description   | priceType   | price   | isUpdateAllowed   |
      | <name> | <description> | <priceType> | <price> | <isUpdateAllowed> |
    And User make a request to create shipping band
    Then User should not be able to create shipping band and user should get validation error message
      | A shipping band already exists with given name.               |
      | A shipping band already exists with given name.               |
      | A shipping band already exists with given name.               |
      | A shipping band already exists with given name.               |
    Examples:
      | name             | description                | priceType  | price  | isUpdateAllowed   |
      | Tony Stark       | this is the desc for fixed | fixed      | 23     | true              |
      | Tony Stark       | this is the desc for fixed | fixed      | 23     | false             |
      | Tony Stark       | this is the desc for fixed | free       |        | true              |
      | Tony Stark       | this is the desc for fixed | free       |        | false             |

  Scenario Outline: Login with valid registered user details as a seller and without follow field validation user wants to create shipping band for seller
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+250@successive.tech     | 123!45@Vik     |
    Then User should be able to login to the system and store token
    And User enters shipping band details
      | name    | description    | priceType   | price   | isUpdateAllowed   |
      | <name>  | <description>  | <priceType> | <price> | <isUpdateAllowed> |
    And User make a request to create shipping band
    Then User should not be able to create shipping band and user should get validation error message
      | Name is required.                                                 |
      | Description is required.                                          |
      | PriceType is required.                                            |
      | Invalid priceType provided.                                       |
      | Invalid priceType provided.                                       |
      | Please provide price for shipping band or select Free as shipping |
      | Please provide price for shipping band or select Free as shipping |
      | Please enter 0 for Free priceType, should not be more than 0      |
    Examples:
      | name         |  description                 | priceType        | price      | isUpdateAllowed   |
      |              | this is the desc for fixed   | fixed            | 23         | true              |
      | Harward      |                              | fixed            | 23         | true              |
      | Harward      | this is the desc for fixed   |                  | 23         | true              |
      | Harward      | this is the desc for fixed   | Nnnnnnnnnnnnn    | 23         | true              |
      | Harward      | this is the desc for fixed   | 1111122222222    | 23         | true              |
      | Harward      | this is the desc for fixed   | fixed            |            | false             |
      | Harward      | this is the desc for fixed   | fixed            | 0          | false             |
      | Harward      | this is the desc for fixed   | free             | 23         | false             |
#bug when login as a seller and seller wants to create a shipping band without "isUpdateAllowed" field then it should be expected error message as a "IsUpdateAllowed is required." but in actual scenario it accepted the requests without IsUpdateAllowed field and give status ok and data true
#bug also for invalid priceType field
#bug also for blank price field

  Scenario Outline: Login with valid registered user details as a Vendor and user use their token to create shipping band
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+251@successive.tech     | 1234@Vik       |
    Then User should be able to login to the system and store token
    And User enters shipping band details
      | name   | description   | priceType   | price   | isUpdateAllowed   |
      | <name> | <description> | <priceType> | <price> | <isUpdateAllowed> |
    And User make a request to create shipping band
    Then User should not be able to create shipping band and user should get validation error message
      | User is not authorized to perform this action               |
    Examples:
      | name    | description                | priceType  | price  | isUpdateAllowed   |
      | Vikrant | this is the desc for fixed | fixed      | 23     | true              |

  Scenario Outline: Login with valid registered user details as a System Admin and user use their token to create shipping band for seller
    When User is able to log into application
      | email                                 | password       |
      | systemadmin@marketcube.io             | 12345678n@N    |
    Then User should be able to login to the system and store token
    And User enters shipping band details
      | name   | description   | priceType   | price   | isUpdateAllowed   |
      | <name> | <description> | <priceType> | <price> | <isUpdateAllowed> |
    And User make a request to create shipping band
    Then User should not be able to create shipping band and user should get validation error message
      | User is not authorized to perform this action               |
    Examples:
      | name    | description                | priceType  | price  | isUpdateAllowed   |
      | Vikrant | this is the desc for fixed | fixed      | 23     | true              |

  Scenario Outline: User make a request to create shipping band with valid shipping details field by passing Incorrect/blank token data
    And User enters shipping band details
      | name    | description                | priceType   | price   | isUpdateAllowed   |
      | Vikrant | this is the desc for fixed | fixed       | 23      | true              |
    And User make a request to request to create shipping band with Incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then User should not be able to create shipping band and user should get validation error message
      | Invalid token provided          |
      | Token is required.              |
    Examples:
      | token                           |
      |  sgshhshhshhshshhsh             |
      |                                 |

  Scenario:Login with valid registered user details as a seller and without isUpdateAllowed field user wants to create shipping band for seller
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+250@successive.tech     | 123!45@Vik     |
    Then User should be able to login to the system and store token
    And User enters shipping band details
      | name    | description                    | priceType   | price   | isUpdateAllowed   |
      | Harward | without isUpdateAllowed field  | fixed       | 23      |                   |
    And Without isUpdateAllowed field user make a request to create shipping band
    Then User should not be able to create shipping band and user should get validation error message
      | IsUpdateAllowed is required.   |

#---------------------------API HIT on UI--------------------------------------------------
#    {"name":"stark2","price":0,"description":"6766","priceType":"free"}
#{"name":"Steve Rogers","price":12,"description":"Captain","priceType":"fixed","isUpdateAllowed":true}
#{"name":"testinh2","price":1,"description":"sss","priceType":"fixed"}