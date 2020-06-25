Feature:  Auth - Create shipping rule for seller -  post -  /user/shipping-rule

         As a registered user
         I want to create the shipping rule for seller

  Scenario Outline: Login with valid registered user details as a seller and user wants to create shipping rules based on the destination
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+250@successive.tech     | 123!45@Vik     |
    Then User should be able to login to the system and store token
    And User enters the shippingBandID details,Price details,shipping rule condition and description of shipping rule
      | condition   | description   |shippingBandId    | isShippingDisabled   |   priceType      | price    |
      | <condition> | <description> |<shippingBandId>  | <isShippingDisabled> |   <priceType>    | <price>  |
    And User enters destination details
      | ES        |
    And User make a request to create new shipping rules based on the destination
    Then User should be able to create shipping rule
    Examples:
       | shippingBandId              | description                     | condition      | priceType   | price  | isShippingDisabled |
       |  5ef47e02faff150012c189ea   | Hit and delete this             | destination    | free        | 0      | false              |
       |  5ef4b181b92c0b001258b138   | Hit and delete this             | destination    | fixed       | 23     | false              |
       |  5ef369b7faff150012c18499   | Hit and delete this             | destination    | fixed       | 23     | true               |

  Scenario Outline: Login with valid registered user details as a seller and user wants to create shipping rules based on the products
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+250@successive.tech     | 123!45@Vik     |
    Then User should be able to login to the system and store token
    And User enters the shippingBandID details,Price details,shipping rule condition and description of shipping rule
      | condition   | description   |shippingBandId    | isShippingDisabled   |   priceType      | price    |
      | <condition> | <description> |<shippingBandId>  | <isShippingDisabled> |   <priceType>    | <price>  |
    And User enters product details
      |  5ef2d8ea1ff87400116ebda7   |
    And User make a request to create new shipping rules based on the products
    Then User should be able to create shipping rule
    Examples:
      | shippingBandId              | price  | description                    | condition       | priceType   | isShippingDisabled |
      |  5ef47e02faff150012c189ea   | 0      | Hit and delete this            | product         | free        | false              |
      |  5ef4b181b92c0b001258b138   | 23     | Hit and delete this            | product         | fixed       | false              |
      |  5ef369b7faff150012c18499   | 23     | Hit and delete this            | product         | fixed       | true               |

  Scenario Outline: Login with valid registered user details as a seller and without follow field validation user wants to create shipping rules based on the destination
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+250@successive.tech     | 123!45@Vik     |
    Then User should be able to login to the system and store token
    And User enters the shippingBandID details,Price details,shipping rule condition and description of shipping rule
      | condition   | description   |shippingBandId    | isShippingDisabled   |   priceType      | price    |
      | <condition> | <description> |<shippingBandId>  | <isShippingDisabled> |   <priceType>    | <price>  |
    And User enters destination details
      | ES        |
    And User make a request to create new shipping rules based on the destination
    Then User should not be able to create new shipping rule and user should gets validation error message
      | ShippingBandId is required.       |
      | Description is required.          |
      | Condition is required.            |
      | PriceType is required.            |
      | Invalid priceType provided.       |
      | Invalid priceType provided.       |
      | Invalid Condition provided.       |
      | Invalid Condition provided.       |
      | Please provide price for shipping band or select Free as shipping |
      | Please provide price for shipping band or select Free as shipping |
      | Please enter 0 for Free priceType, should not be more than 0      |
      | Invalid shippingBandId provided.       |
      | Invalid shippingBandId provided.       |
      | Invalid shippingBandId provided.       |
      | Invalid shippingBandId provided.       |
    Examples:
      | shippingBandId              | price  | description                    | condition      | priceType   | isShippingDisabled |
      |                             | 0      | Hit and delete this            | destination    | free        | false              |
      |  5e688f88e2891c001afed6f9   | 23     |                                | destination    | fixed       | false              |
      |  5e688f88e2891c001afed6f9   | 0      | Hit and delete this            |                | free        | true               |
      |  5e688f88e2891c001afed6f9   | 23     | Hit and delete this            | destination    |             | true               |
      |  5e688f88e2891c001afed6f9   | 0      | Hit and delete this by seller  | destination    | feeeeereere | false              |
      |  5e688f88e2891c001afed6f9   | 0      | Hit and delete this by seller  | destination    | 11111111111 | false              |
      |  5e688f88e2891c001afed6f9   | 0      | Hit and delete this by seller  | abcdefghijklmn | free        | false              |
      |  5e688f88e2891c001afed6f9   | 0      | Hit and delete this by seller  | 11111111111111 | free        | false              |
      |  5ef369b7faff150012c18499   |        | Hit and delete this by seller  | destination    | fixed       | false              |
      |  5ef4b181b92c0b001258b138   | 0      | Hit and delete this by seller  | destination    | fixed       | false              |
      |  5ef47e02faff150012c189ea   | 12     | Hit and delete this by seller  | destination    | free        | false              |
      |  12345678901234567890123    | 0      | Hit and delete this by seller  | destination    | free        | false              |
      |  123456789012345678901234   | 0      | Hit and delete this by seller  | destination    | free        | false              |
      |  1234567890123456789012345  | 0      | Hit and delete this by seller  | destination    | free        | false              |
      |  aaaaaaaaaaaaaaaaaaaaaaaa   | 0      | Hit and delete this by seller  | destination    | free        | false              |
#bug when login as a seller and seller wants to create a shipping rule with invalid pricetype field then it should be expected error message as a "Invalid priceType provided." but in actual scenario it give actual error message as a "ShippingRule validation failed: priceType: Invalid value provided for priceType with value `feeeeereere`""
#bug when login as a seller and seller wants to create a shipping rule without price field then it should be expected error message as a "Please provide price for shipping band or select Free as shipping" but in actual scenario it accepted the requests and give status ok and data true
#bug when login as a seller and seller wants to create a shipping rule with invalid condition field then it should be expected error message as a "Invalid Condition provided."  but in actual scenario
#      it give actual error message as a
#      "ShippingRule validation failed: priceType: priceType is required, condition: condition is required, description: description is required, shippingBandId: shippingBandId is required, userId: userId is required, updatedBy: updatedBy is required, createdBy: createdBy is required"

  Scenario Outline: Login with valid registered user details as a System Admin and user wants to create shipping rules based on the destination
    When User is able to log into application
      | email                                 | password       |
      | systemadmin@marketcube.io             | 12345678n@N    |
    Then User should be able to login to the system and store token
    And User enters the shippingBandID details,Price details,shipping rule condition and description of shipping rule
      | condition   | description   |shippingBandId    | isShippingDisabled   |   priceType      | price    |
      | <condition> | <description> |<shippingBandId>  | <isShippingDisabled> |   <priceType>    | <price>  |
    And User enters destination details
      | ES        |
    And User make a request to create new shipping rules based on the destination
    Then User should not be able to create new shipping rule and user should gets validation error message
      | User is not authorized to perform this action               |
     Examples:
      | shippingBandId              | price  | description                    | condition      | priceType   | isShippingDisabled |
      |  5e688f88e2891c001afed6f9   | 0      | Hit and delete this by seller  | destination    | free        | false              |

  Scenario Outline: Login with valid registered user details as a System Admin and user wants to create shipping rules based on the products
    When User is able to log into application
      | email                                 | password       |
      | systemadmin@marketcube.io             | 12345678n@N    |
    Then User should be able to login to the system and store token
    And User enters the shippingBandID details,Price details,shipping rule condition and description of shipping rule
      | condition   | description   |shippingBandId    | isShippingDisabled   |   priceType      | price    |
      | <condition> | <description> |<shippingBandId>  | <isShippingDisabled> |   <priceType>    | <price>  |
    And User enters product details
      |  5ef2d8ea1ff87400116ebda7   |
    And User make a request to create new shipping rules based on the products
    Then User should not be able to create new shipping rule and user should gets validation error message
      | User is not authorized to perform this action               |
       Examples:
      | shippingBandId              | price  | description                    | condition       | priceType   | isShippingDisabled |
      |  5e688f88e2891c001afed6f9   | 0      | Hit and delete this by seller  | product         | free        | false              |

  Scenario Outline: Login with valid registered user details as a Vendor and user wants to create shipping rules based on the destination
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+251@successive.tech     | 1234@Vik       |
    Then User should be able to login to the system and store token
    And User enters the shippingBandID details,Price details,shipping rule condition and description of shipping rule
      | condition   | description   |shippingBandId    | isShippingDisabled   |   priceType      | price    |
      | <condition> | <description> |<shippingBandId>  | <isShippingDisabled> |   <priceType>    | <price>  |
    And User enters destination details
      | ES        |
    And User make a request to create new shipping rules based on the destination
    Then User should be able to create shipping rule
    Examples:
      | shippingBandId              | description                     | condition      | priceType   | price  | isShippingDisabled |
      |  5ef47e02faff150012c189ea   | Hit and delete this             | destination    | free        | 0      | false              |
      |  5ef4b181b92c0b001258b138   | Hit and delete this             | destination    | fixed       | 23     | false              |
      |  5ef369b7faff150012c18499   | Hit and delete this             | destination    | fixed       | 23     | true               |

  Scenario Outline: Login with valid registered user details as a Vendor and user wants to create shipping rules based on the products
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+251@successive.tech     | 1234@Vik       |
    Then User should be able to login to the system and store token
     And User enters the shippingBandID details,Price details,shipping rule condition and description of shipping rule
      | condition   | description   |shippingBandId    | isShippingDisabled   |   priceType      | price    |
      | <condition> | <description> |<shippingBandId>  | <isShippingDisabled> |   <priceType>    | <price>  |
    And User enters product details
      |  5ef2d8ea1ff87400116ebda7   |
    And User make a request to create new shipping rules based on the products
    Then User should be able to create shipping rule
    Examples:
      | shippingBandId              | price  | description          | condition       | priceType   | isShippingDisabled |
      |  5ef47e02faff150012c189ea   | 0      | Hit and delete this  | product         | free        | false              |
      |  5ef4b181b92c0b001258b138   | 23     | Hit and delete this  | product         | fixed       | false              |
      |  5ef369b7faff150012c18499   | 0      | Hit and delete this  | product         | free        | true               |

  Scenario Outline: Login with valid registered user details as a seller and user use other seller shippingBandId to create shipping rules based on the destination
    When User is able to log into application
      | email                                    | password       |
      | vikrant.singh+350@successive.tech        | 123!45@Vik     |
    Then User should be able to login to the system and store token
    And User enters the shippingBandID details,Price details,shipping rule condition and description of shipping rule
      | condition   | description   |shippingBandId    | isShippingDisabled   |   priceType      | price    |
      | <condition> | <description> |<shippingBandId>  | <isShippingDisabled> |   <priceType>    | <price>  |
    And User enters destination details
      | ES        |
    And User make a request to create new shipping rules based on the destination
    Then User should not be able to create new shipping rule and user should gets validation error message
      | Invalid shippingBandId provided.  |
      | Invalid shippingBandId provided.  |
      | Invalid shippingBandId provided.  |
    Examples:
      | shippingBandId              | price  | description                             | condition      | priceType   | isShippingDisabled |
      |  5ef47e02faff150012c189ea   | 0      | Hit by rest assured3 by another seller  | destination    | free        | false              |
      |  5ef4b181b92c0b001258b138   | 23     | Hit by rest assured3 by another seller  | destination    | fixed       | false              |
      |  5ef369b7faff150012c18499   | 0      | Hit by rest assured3 by another seller  | destination    | free        | true               |
#Bug  Login as seller and user wants to create shipping rule with the help of shippingBandId of another seller then it should be expected error message as a "Invalid shippingBandId provided." but in actual scenario it accepted the requests,create a new shipping rule, status ok and data true

  Scenario Outline: Login with valid registered user details as a Vendor and user use other seller shippingBandId to create shipping rules based on the products
    When User is able to log into application
      | email                                    | password       |
      | vikrant.singh+351@successive.tech        | 1234@Vik       |
    Then User should be able to login to the system and store token
    And User enters the shippingBandID details,Price details,shipping rule condition and description of shipping rule
      | condition   | description   |shippingBandId    | isShippingDisabled   |   priceType      | price    |
      | <condition> | <description> |<shippingBandId>  | <isShippingDisabled> |   <priceType>    | <price>  |
    And User enters product details
      |  5ef2d8ea1ff87400116ebda7   |
    And User make a request to create new shipping rules based on the products
    Then User should not be able to create new shipping rule and user should gets validation error message
      | Invalid shippingBandId provided.  |
      | Invalid shippingBandId provided.  |
      | Invalid shippingBandId provided.  |
    Examples:
      | shippingBandId              | price  | description                             | condition      | priceType   | isShippingDisabled |
      |  5ef47e02faff150012c189ea   | 0      | Hit by rest assured3 by another seller  | destination    | free        | false              |
      |  5ef4b181b92c0b001258b138   | 23     | Hit by rest assured3 by another seller  | destination    | fixed       | false              |
      |  5ef369b7faff150012c18499   | 0      | Hit by rest assured3 by another seller  | destination    | free        | true               |

  Scenario Outline: User make a request to create shipping band with valid shipping details field by passing Incorrect/blank token data
    And User enters the shippingBandID details,Price details,shipping rule condition and description of shipping rule
      |shippingBandId               | condition      | description           | isShippingDisabled   |   priceType      | price         |
      |  5ef47e02faff150012c189ea   | destination    | Hit and delete this   | false                | free             |  09           |
    And User enters destination details
      | ES        |
    And User make a request to create new shipping rules based on the destination with Incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then User should not be able to create new shipping rule and user should gets validation error message
      | Invalid token provided          |
      | Token is required.              |
    Examples:
      | token                           |
      |  sgshhshhshhshshhsh             |
      |                                 |