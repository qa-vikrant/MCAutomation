Feature:  Auth - Delete shipping rule for seller -  delete - /user/shipping-rule

        As a registered seller
        I want to delete shipping rule for seller

        As a registered vendor
        I want to delete shipping rule for vendor

 Scenario Outline: Login with valid registered user details as a seller and user wants to delete their own shipping rule
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then user should be able to login to the system and store token
    When User enters shippingRuleId
      |   shippingRuleId              |
      |  <shippingRuleId>             |
    And user make a request to delete shipping rule
    Then User should be able to delete shipping rule
   Examples:
        | shippingRuleId             |
        | 5e8ac6210167b2001a5a50fb   |
        | 5e8ac6210167b2001a5a50fc   |
        | 5e841fc01d429c0012f83abe   |
        | 5e841fc31d429c0012f83ac1   |
        | 5e848f38768bd6001301781f   |
        | 5e8ad6e8c41be8001aef32cc   |
        | 5e8ad6e8c41be8001aef32cd   |
        | 5e8ad738c41be8001aef32d4   |





  Scenario: Login with valid registered user details as a vendor and user wants to delete their own shipping rule
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | 1234567890     |
    Then user should be able to login to the system and store token
    When User enters shippingRuleId
      | shippingRuleId             |
      | 5e69ef6c558f0c001af94fdc   |
    And user make a request to delete shipping rule
    Then User should be able to delete shipping rule



  Scenario: Login with valid registered user details as a system admin and user wants to delete shipping rule of seller
    When User is able to log into application
      | email                                 | password       |
      | systemadmin@marketcube.io             | 12345678n@N    |
    Then user should be able to login to the system and store token
    When User enters shippingRuleId
      | shippingRuleId             |
      | 5e69ef6c558f0c001af94fdc   |
    And user make a request to delete shipping rule
    Then User should not be able to delete shipping rule and user should get validation error message
      |  User is not authorized to perform this action |


  Scenario Outline: Login with valid registered user details as a seller and without follow field validation user wants to delete shipping Rule for seller
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then user should be able to login to the system and store token
    When User enters shippingRuleId
      | shippingRuleId          |
      |  <shippingRuleId>       |
    And user make a request to delete shipping rule
    Then User should not be able to delete shipping rule and user should get validation error message
      |  ShippingRuleId is required.  |
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
    When user make a request to request to delete shipping rule with Incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then User should not be able to delete shipping rule and user should get validation error message
      | Invalid token provided          |
      | Invalid token provided          |
    Examples:
      | token                           |
      |  sgshhshhshhshshhsh             |
      |                                 |