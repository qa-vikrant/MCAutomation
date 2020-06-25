Feature:  Auth - Delete shipping rule for seller -  delete - /user/shipping-rule

        As a registered User(Seller/Vendor)
        User want to delete shipping rule for seller

  Scenario Outline: Login with valid registered user details as a seller and user wants to delete their own shipping rule
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+250@successive.tech     | 123!45@Vik     |
    Then User should be able to login to the system and store token
    When User enters shippingRuleId
      |   shippingRuleId              |
      |  <shippingRuleId>             |
    And User make a request to delete shipping rule
    Then User should be able to delete shipping rule
   Examples:
        | shippingRuleId             |
        | 5ef4f158da7f41001295c729   |

  Scenario: Login with valid registered user details as a vendor and user wants to delete their own shipping rule
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+251@successive.tech     | 1234@Vik       |
    Then User should be able to login to the system and store token
    When User enters shippingRuleId
      | shippingRuleId             |
      | 5ef4f1396d64340013794865   |
    And User make a request to delete shipping rule
    Then User should be able to delete shipping rule

  Scenario: Login with valid registered user details as a system admin and user wants to delete shipping rule of seller
    When User is able to log into application
      | email                                 | password       |
      | systemadmin@marketcube.io             | 12345678n@N    |
    Then User should be able to login to the system and store token
    When User enters shippingRuleId
      | shippingRuleId             |
      | 5e69ef6c558f0c001af94fdc   |
    And User make a request to delete shipping rule
    Then User should not be able to delete shipping rule and user should get validation error message
      |  User is not authorized to perform this action |

  Scenario Outline: Login with valid registered user details as a seller and without follow field validation user wants to delete shipping Rule for seller
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+250@successive.tech     | 123!45@Vik     |
    Then User should be able to login to the system and store token
    When User enters shippingRuleId
      | shippingRuleId          |
      |  <shippingRuleId>       |
    And User make a request to delete shipping rule
    Then User should not be able to delete shipping rule and user should get validation error message
      |  ShippingRuleId is required.               |
      | Invalid ShippingRuleId provided.           |
      | Invalid ShippingRuleId provided.           |
      | Invalid ShippingRuleId  provided.          |
    Examples:
      | shippingRuleId             |
      |                            |
      |  12345678912345678912345   |
      |  123456789123456789123456  |
      |  1234567891234567891234567 |
#bug

  Scenario Outline: User make a request to delete shipping Rule with valid shippingRuleId field by passing Incorrect/blank token data
    When User enters shippingRuleId
      | shippingRuleId             |
      | 5e69ef6c558f0c001af94fdc   |
    When User make a request to request to delete shipping rule with Incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then User should not be able to delete shipping rule and user should get validation error message
      | Invalid token provided          |
      | Token is required.              |
    Examples:
      | token                           |
      |  sgshhshhshhshshhsh             |
      |                                 |

  Scenario Outline: Login with valid registered user details as a seller and user wants to delete shipping rule of another seller
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+350@successive.tech     | 123!45@Vik     |
    Then User should be able to login to the system and store token
    When User enters shippingRuleId
      |   shippingRuleId              |
      |  <shippingRuleId>             |
    And User make a request to delete shipping rule
    Then User should not be able to delete shipping rule and user should get validation error message
      | Invalid ShippingRuleId provided.           |
    Examples:
      | shippingRuleId             |
      | 5ef4f15dda7f41001295c72d   |

  Scenario: Login with valid registered user details as a vendor and user wants to delete shipping rule of another vendor
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+351@successive.tech     | 1234@Vik       |
    Then User should be able to login to the system and store token
    When User enters shippingRuleId
      | shippingRuleId             |
      | 5ef4f13b6d64340013794866   |
    And User make a request to delete shipping rule
    Then User should not be able to delete shipping rule and user should get validation error message
      | Invalid ShippingRuleId provided.           |


  Scenario: Login with valid registered user details as a vendor and user wants to delete shipping rule of their associated seller
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+351@successive.tech     | 1234@Vik       |
    Then User should be able to login to the system and store token
    When User enters shippingRuleId
      | shippingRuleId             |
      | 5ef4f15bda7f41001295c72c   |
    And User make a request to delete shipping rule
    Then User should not be able to delete shipping rule and user should get validation error message
      | Invalid ShippingRuleId provided.           |
