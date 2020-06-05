Feature:  Auth - Create shipping rule for seller -  post -  /user/shipping-rule


         As a registered user
         I want to create the shipping rule for seller

  Scenario Outline: Login with valid registered user details as a seller and user wants to create shipping rules based on the destination
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then user should be able to login to the system and store token
    And User enters destination details
      |   UK             |
    And User enters product details
      |  12DFF344DFFFF   |
    And User enters the shippingBandID details,Price details,shipping rule condition and description of shipping rule
      | condition   | description   |shippingBandId    | isShippingDisabled   |   priceType      | price    |
      | <condition> | <description> |<shippingBandId>  | <isShippingDisabled> |   <priceType>    | <price>  |
    And User make a request to create new shipping rules based on the destination
    Then User should be able to create shipping rule
    Examples:
       | shippingBandId              | price  | description                     | condition      | priceType   | isShippingDisabled |
       |  5e688f88e2891c001afed6f9   | 0      | Hit by rest assured3 by seller  | destination    | free        | false              |
       |  5e688f88e2891c001afed6f9   | 23     | Hit by rest assured3 by seller  | destination    | fixed       | false              |
       |  5e688f88e2891c001afed6f9   | 0      | Hit by rest assured3 by seller  | destination    | free        | true               |
       |  5e688f88e2891c001afed6f9   | 23     | Hit by rest assured3 by seller  | destination    | fixed       | true               |


  Scenario Outline: Login with valid registered user details as a seller and user wants to create shipping rules based on the products
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then user should be able to login to the system and store token
    And User enters destination details
      |   UK             |
    And User enters product details
      |  12DFF344DFFFF1   |
    And User enters the shippingBandID details,Price details,shipping rule condition and description of shipping rule
      | condition   | description   |shippingBandId    | isShippingDisabled   |   priceType      | price    |
      | <condition> | <description> |<shippingBandId>  | <isShippingDisabled> |   <priceType>    | <price>  |
    And User make a request to create new shipping rules based on the products
    Then User should be able to create shipping rule
    Examples:
      | shippingBandId              | price  | description                    | condition       | priceType   | isShippingDisabled |
      |  5e688f88e2891c001afed6f9   | 0      | Hit by rest assured by seller  | product         | free        | false              |
      |  5e688f88e2891c001afed6f9   | 23     | Hit by rest assured by seller  | product         | fixed       | false              |
      |  5e688f88e2891c001afed6f9   | 0      | Hit by rest assured by seller  | product         | free        | true               |
      |  5e688f88e2891c001afed6f9   | 23     | Hit by rest assured by seller  | product         | fixed       | true               |


  Scenario Outline: Login with valid registered user details as a seller and without follow field validation user wants to create shipping rules based on the destination
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then user should be able to login to the system and store token
    And User enters destination details
      |   UK             |
    And User enters product details
      |  12DFF344DFFFF   |
    And User enters the shippingBandID details,Price details,shipping rule condition and description of shipping rule
      | condition   | description   |shippingBandId    | isShippingDisabled   |   priceType      | price    |
      | <condition> | <description> |<shippingBandId>  | <isShippingDisabled> |   <priceType>    | <price>  |
    And User make a request to create new shipping rules based on the destination
    Then User should not be able to create new shipping rule and user should gets validation error message
      | ShippingBandId is required.       |
      | Description is required.          |
      | Condition is required.            |
      | PriceType is required.            |
      | Invalid priceType provided.       |
      | Please provide price for shipping band or select Free as shipping |
      | Invalid Condition provided.       |
    Examples:
      | shippingBandId              | price  | description                     | condition      | priceType   | isShippingDisabled |
      |                             | 0      | Hit by rest assured3            | destination    | free        | false              |
      |  5e688f88e2891c001afed6f9   | 23     |                                 | destination    | fixed       | false              |
      |  5e688f88e2891c001afed6f9   | 0      | Hit by rest assured3            |                | free        | true               |
      |  5e688f88e2891c001afed6f9   | 23     | Hit by rest assured3            | destination    |             | true               |
      |  5e688f88e2891c001afed6f9   | 0      | Hit by rest assured3 by seller  | destination    | feeeeereere | false              |
      |  5e688f88e2891c001afed6f9   |        | Hit by rest assured3 by seller  | destination    | fixed       | false              |
      |  5e688f88e2891c001afed6f9   | 0      | Hit by rest assured3 by seller  | abcdefghijklmn | free        | false              |
#bug when login as a seller and seller wants to create a shipping rule with invalid pricetype field then it should be expected error message as a "Invalid priceType provided." but in actual scenario it give actual error message as a "ShippingRule validation failed: priceType: Invalid value provided for priceType with value `feeeeereere`""
#bug when login as a seller and seller wants to create a shipping rule without price field then it should be expected error message as a "Please provide price for shipping band or select Free as shipping" but in actual scenario it accepted the requests and give status ok and data true
#bug when login as a seller and seller wants to create a shipping rule with invalid condition field then it should be expected error message as a "Invalid Condition provided."  but in actual scenario
#      it give actual error message as a
#      "ShippingRule validation failed: priceType: priceType is required, condition: condition is required, description: description is required, shippingBandId: shippingBandId is required, userId: userId is required, updatedBy: updatedBy is required, createdBy: createdBy is required"




  Scenario Outline: Login with valid registered user details as a seller and without follow field validation user wants to create shipping rules based on the products
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then user should be able to login to the system and store token
    And User enters destination details
      |   UK             |
    And User enters product details
      |  12DFF344DFFFF   |
    And User enters the shippingBandID details,Price details,shipping rule condition and description of shipping rule
      | condition   | description   |shippingBandId    | isShippingDisabled   |   priceType      | price    |
      | <condition> | <description> |<shippingBandId>  | <isShippingDisabled> |   <priceType>    | <price>  |
    And User make a request to create new shipping rules based on the products
    Then User should not be able to create new shipping rule and user should gets validation error message
      | ShippingBandId is required. |
      | Description is required.    |
      | Condition is required.      |
      | PriceType is required.      |
    Examples:
      | shippingBandId              | price  | description           | condition      | priceType   | isShippingDisabled |
      |                             | 0      | Hit by rest assured3  | destination    | free        | false              |
      |  5e688f88e2891c001afed6f9   | 23     |                       | destination    | fixed       | false              |
      |  5e688f88e2891c001afed6f9   | 0      | Hit by rest assured3  |                | free        | true               |
      |  5e688f88e2891c001afed6f9   | 23     | Hit by rest assured3  | destination    |             | true               |



  Scenario Outline: Login with valid registered user details as a System Admin and user wants to create shipping rules based on the destination
    When User is able to log into application
      | email                                 | password       |
      | systemadmin@marketcube.io             | 12345678n@N    |
    Then user should be able to login to the system and store token
    And User enters destination details
      |   UK             |
    And User enters product details
      |  12DFF344DFFFF   |
    And User enters the shippingBandID details,Price details,shipping rule condition and description of shipping rule
      | condition   | description   |shippingBandId    | isShippingDisabled   |   priceType      | price    |
      | <condition> | <description> |<shippingBandId>  | <isShippingDisabled> |   <priceType>    | <price>  |
    And User make a request to create new shipping rules based on the destination
    Then User should not be able to create new shipping rule and user should gets validation error message
      | User is not authorized to perform this action               |
      | User is not authorized to perform this action               |
      | User is not authorized to perform this action               |
      | User is not authorized to perform this action               |
    Examples:
      | shippingBandId              | price  | description           | condition      | priceType   | isShippingDisabled |
      |  5e688f88e2891c001afed6f9   | 0      | Hit by rest assured3  | destination    | free        | false              |
      |  5e688f88e2891c001afed6f9   | 23     | Hit by rest assured3  | destination    | fixed       | false              |
      |  5e688f88e2891c001afed6f9   | 0      | Hit by rest assured3  | destination    | free        | true               |
      |  5e688f88e2891c001afed6f9   | 23     | Hit by rest assured3  | destination    | fixed       | true               |


  Scenario Outline: Login with valid registered user details as a System Admin and user wants to create shipping rules based on the products
    When User is able to log into application
      | email                                 | password       |
      | systemadmin@marketcube.io             | 12345678n@N    |
    Then user should be able to login to the system and store token
    And User enters destination details
      |   UK             |
    And User enters product details
      |  12DFF344DFFFF1   |
    And User enters the shippingBandID details,Price details,shipping rule condition and description of shipping rule
      | condition   | description   |shippingBandId    | isShippingDisabled   |   priceType      | price    |
      | <condition> | <description> |<shippingBandId>  | <isShippingDisabled> |   <priceType>    | <price>  |
    And User make a request to create new shipping rules based on the products
    Then User should not be able to create new shipping rule and user should gets validation error message
      | User is not authorized to perform this action               |
      | User is not authorized to perform this action               |
      | User is not authorized to perform this action               |
      | User is not authorized to perform this action               |
    Examples:
      | shippingBandId              | price  | description           | condition       | priceType   | isShippingDisabled |
      |  5e688f88e2891c001afed6f9   | 0      | Hit by rest assured3  | product         | free        | false              |
      |  5e688f88e2891c001afed6f9   | 23     | Hit by rest assured3  | product         | fixed       | false              |
      |  5e688f88e2891c001afed6f9   | 0      | Hit by rest assured3  | product         | free        | true               |
      |  5e688f88e2891c001afed6f9   | 23     | Hit by rest assured3  | product         | fixed       | true               |




  Scenario Outline: Login with valid registered user details as a Vendor and user wants to create shipping rules based on the destination
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | 1234567890     |
    Then user should be able to login to the system and store token
    And User enters destination details
      |   UK             |
    And User enters product details
      |  12DFF344DFFFF   |
    And User enters the shippingBandID details,Price details,shipping rule condition and description of shipping rule
      | condition   | description   |shippingBandId    | isShippingDisabled   |   priceType      | price    |
      | <condition> | <description> |<shippingBandId>  | <isShippingDisabled> |   <priceType>    | <price>  |
    And User make a request to create new shipping rules based on the destination
    Then User should be able to create shipping rule
    Examples:
      | shippingBandId              | price  | description                    | condition      | priceType   | isShippingDisabled |
      |  5e688f88e2891c001afed6f9   | 0      | Hit by rest assured by vendor  | destination    | free        | false              |
      |  5e688f88e2891c001afed6f9   | 23     | Hit by rest assured by vendor  | destination    | fixed       | false              |
      |  5e688f88e2891c001afed6f9   | 0      | Hit by rest assured by vendor  | destination    | free        | true               |
      |  5e688f88e2891c001afed6f9   | 23     | Hit by rest assured by vendor  | destination    | fixed       | true               |


  Scenario Outline: Login with valid registered user details as a Vendor and user wants to create shipping rules based on the products
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | 1234567890     |
    Then user should be able to login to the system and store token
    And User enters destination details
      |   UK             |
    And User enters product details
      |  12DFF344DFFFF1   |
    And User enters the shippingBandID details,Price details,shipping rule condition and description of shipping rule
      | condition   | description   |shippingBandId    | isShippingDisabled   |   priceType      | price    |
      | <condition> | <description> |<shippingBandId>  | <isShippingDisabled> |   <priceType>    | <price>  |
    And User make a request to create new shipping rules based on the products
    Then User should be able to create shipping rule
    Examples:
      | shippingBandId              | price  | description                    | condition       | priceType   | isShippingDisabled |
      |  5e688f88e2891c001afed6f9   | 0      | Hit by rest assured by vendor  | product         | free        | false              |
      |  5e688f88e2891c001afed6f9   | 23     | Hit by rest assured by vendor  | product         | fixed       | false              |
      |  5e688f88e2891c001afed6f9   | 0      | Hit by rest assured by vendor  | product         | free        | true               |
      |  5e688f88e2891c001afed6f9   | 23     | Hit by rest assured by vendor  | product         | fixed       | true               |


  Scenario Outline: Login with valid registered user details as a seller and user use other seller shippingBandId to create shipping rules based on the destination
    When User is able to log into application
      | email                                    | password       |
      | vikrant.singh+60@successive.tech         | 123456789      |
    Then user should be able to login to the system and store token
    And User enters destination details
      |   UK             |
    And User enters product details
      |  12DFF344DFFFF   |
    And User enters the shippingBandID details,Price details,shipping rule condition and description of shipping rule
      | condition   | description   |shippingBandId    | isShippingDisabled   |   priceType      | price    |
      | <condition> | <description> |<shippingBandId>  | <isShippingDisabled> |   <priceType>    | <price>  |
    And User make a request to create new shipping rules based on the destination
    Then User should not be able to create new shipping rule and user should gets validation error message
      | Invalid shippingBandId provided.  |
      | Invalid shippingBandId provided.  |
      | Invalid shippingBandId provided.  |
      | Invalid shippingBandId provided.  |
    Examples:
      | shippingBandId              | price  | description                             | condition      | priceType   | isShippingDisabled |
      |  5e688f88e2891c001afed6f9   | 0      | Hit by rest assured3 by another seller  | destination    | free        | false              |
      |  5e688f88e2891c001afed6f9   | 23     | Hit by rest assured3 by another seller  | destination    | fixed       | false              |
      |  5e688f88e2891c001afed6f9   | 0      | Hit by rest assured3 by another seller  | destination    | free        | true               |
      |  5e688f88e2891c001afed6f9   | 23     | Hit by rest assured3 by another seller  | destination    | fixed       | true               |
#Bug  Login as seller and user wants to create shipping rule with the help of shippingBandId of another seller then it should be expected error message as a "Invalid shippingBandId provided." but in actual scenario it accepted the requests,create a new shipping rule, status ok and data true


  Scenario Outline: User make a request to create shipping band with valid shipping details field by passing Incorrect/blank token data
    And User enters destination details
      |   UK             |
    And User enters product details
      |  12DFF344DFFFF   |
    And User enters the shippingBandID details,Price details,shipping rule condition and description of shipping rule
      | condition   | description   |shippingBandId    | isShippingDisabled   |   priceType      | price    |
      |  5e688f88e2891c001afed6f9   | 0      | Hit by rest assured3 by seller  | destination    | free        | false              |
    And User make a request to create new shipping rules based on the destination with Incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then User should not be able to create new shipping rule and user should gets validation error message
      | Invalid token provided          |
      | Invalid token provided          |
    Examples:
      | token                           |
      |  sgshhshhshhshshhsh             |
      |                                 |