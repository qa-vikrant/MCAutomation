Feature: Auth - Update shipping rule for seller and vendor -  put - /user/shipping-rule

        As a registered user
        I want to update shipping rule for seller/Vendor

  Scenario: Login with valid registered user details as a seller and user wants to update shipping rule for seller based on the destination
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then user should be able to login to the system and store token
    And User enters destination details for updation
      |   UVITTVB             |
    And User enters product details for updation
      |  12DFF344DFFFF   |
    And User enters the shippingBandID details,Price details,shipping rule condition and description of shipping rule for updation
     | _id                               | shippingBandId              | price  | description                              | condition      | priceType   | isShippingDisabled |
     | 5e841fbb49190400133a842a          | 5e688f88e2891c001afed6f9    | 0      | Hit by seller for update shipping rule   | destination    | free        | false              |
    And User make a request to update shipping rules based on the destination
    Then User should be able to update shipping rule



  Scenario: Login with valid registered user details as a seller and user wants to update shipping rule for seller based on the products
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then user should be able to login to the system and store token
    And User enters destination details for updation
      |   UVITTVB                   |
    And User enters product details for updation
      |  HR3e9xUMu112DFF344DFFFF1   |
    And User enters the shippingBandID details,Price details,shipping rule condition and description of shipping rule for updation
      | _id                               | shippingBandId              | price   | description                              | condition      | priceType    | isShippingDisabled |
      | 5e69eed023128800199bb6af          | 5e688f88e2891c001afed6f9    | 55      | Hit by seller for update shipping rule   | product        | fixed        | true               |
    And User make a request to update new shipping rules based on the products
    Then User should be able to update shipping rule


  Scenario Outline: Login with valid registered user details as a seller and without follow fileld validation user wants to update shipping rule for seller based on the products
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then user should be able to login to the system and store token
    And User enters destination details for updation
      |   UVITTVB                   |
    And User enters product details for updation
      |  HR3e9xUMu112DFF344DFFFF1   |
    And User enters the shippingBandID details,Price details,shipping rule condition and description of shipping rule for updation
      | _id                            | shippingBandId              | price   | description                              | condition        | priceType      | isShippingDisabled   |
      | <_id>                          | <shippingBandId>            | <price> | <description>                            | <condition>      | <priceType>    | <isShippingDisabled> |
    And User make a request to update new shipping rules based on the products
    Then User should not be able to update shipping rule and user should get validation message
      | _id is required.                  |
      | ShippingBandId is required.       |
      | PriceType is required.            |
      | Condition is required.            |
      | Description is required.          |
      | Invalid priceType provided.       |
      | Please provide price for shipping band or select Free as shipping |
      | Invalid Condition provided.       |
    Examples:
      | _id                               | shippingBandId              | price   | description                              | condition      | priceType    | isShippingDisabled |
      |                                   | 5e688f88e2891c001afed6f9    | 55      | Hit by seller for update shipping rule   | destination    | fixed        | false              |
      | 5e69eed023128800199bb6af          |                             | 55      | Hit by seller for update shipping rule   | destination    | fixed        | false              |
      | 5e69eed023128800199bb6af          | 5e688f88e2891c001afed6f9    | 55      | Hit by seller for update shipping rule   | destination    |              | false              |
      | 5e69eed023128800199bb6af          | 5e688f88e2891c001afed6f9    | 55      | Hit by seller for update shipping rule   |                | fixed        | false              |
      | 5e69eed023128800199bb6af          | 5e688f88e2891c001afed6f9    | 55      |                                          | destination    | fixed        | false              |
      | 5e69eed023128800199bb6af          | 5e688f88e2891c001afed6f9    | 55      | Hit by seller for update shipping rule   | destination    | fixederrrr   | false              |
      | 5e69eed023128800199bb6af          | 5e688f88e2891c001afed6f9    |         | Hit by seller for update shipping rule   | destination    | fixed        | false              |
      | 5e69eed023128800199bb6af          | 5e688f88e2891c001afed6f9    |         | Hit by seller for update shipping rule   | pxdffffkkkfkk  | fixed        | false              |

#bug when login as a seller and seller wants to update a shipping rule with invalid pricetype field then it should be expected error message as a "Invalid priceType provided." but in actual scenario it accepted the requests and give status ok and data true
#bug when login as a seller and seller wants to update a shipping rule without price field then it should be expected error message as a "Please provide price for shipping band or select Free as shipping" but in actual scenario it accepted the requests and give status ok and data true
#bug when login as a seller and seller wants to update a shipping rule with invalid condition field then it should be expected error message as a "Invalid Condition provided." but in actual scenario it accepted the requests and give status ok and data true


  Scenario: Login with valid registered user details as a vendor and user wants to update shipping rule of seller based on the destination
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | 1234567890     |
    Then user should be able to login to the system and store token
    And User enters destination details for updation
      |   UVITTVB             |
    And User enters product details for updation
      |  12DFF344DFFFF   |
    And User enters the shippingBandID details,Price details,shipping rule condition and description of shipping rule for updation
      | _id                               | shippingBandId              | price  | description                              | condition      | priceType   | isShippingDisabled |
      | 5e68e51622f13c0019225c0f          | 5e688f88e2891c001afed6f9    | 0      | Hit by vendor for update shipping rule   | destination    | free        | false              |
    And User make a request to update shipping rules based on the destination
    Then User should be able to update shipping rule



  Scenario: Login with valid registered user details as a vendor and user wants to update shipping rule of seller based on the products
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | 1234567890     |
    Then user should be able to login to the system and store token
    And User enters destination details for updation
      |   UVITTVB                   |
    And User enters product details for updation
      |  HR3e9xUMu112DFF344DFFFF1   |
    And User enters the shippingBandID details,Price details,shipping rule condition and description of shipping rule for updation
      | _id                               | shippingBandId              | price   | description                              | condition      | priceType    | isShippingDisabled |
      | 5e69eed023128800199bb6af          | 5e688f88e2891c001afed6f9    | 55      | Hit by vendor for update shipping rule   | product        | fixed        | true               |
    And User make a request to update new shipping rules based on the products
    Then User should be able to update shipping rule


  Scenario: Login with valid registered user details as a vendor and user wants to update own shipping rule based on the destination
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | 1234567890     |
    Then user should be able to login to the system and store token
    And User enters destination details for updation
      |   AO             |
    And User enters product details for updation
      |  12DFF344DFFFF   |
    And User enters the shippingBandID details,Price details,shipping rule condition and description of shipping rule for updation
      | _id                               | shippingBandId              | price  | description                              | condition      | priceType   | isShippingDisabled |
      | 5e6b17e64ae55f00190f62da          | 5e65ea2a31ffab0019e44291    | 66     | Hit by vendor for update shipping rule   | destination    | fixed       | false              |
    And User make a request to update shipping rules based on the destination
    Then User should be able to update shipping rule
#Bug


  Scenario: Login with valid registered user details as a vendor and user wants to update own shipping rule based on the products
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | 1234567890     |
    Then user should be able to login to the system and store token
    And User enters destination details for updation
      |   UVITTVB                   |
    And User enters product details for updation
      |  HR3e9xUMu112DFF344DFFFF1   |
    And User enters the shippingBandID details,Price details,shipping rule condition and description of shipping rule for updation
      | _id                               | shippingBandId              | price   | description                              | condition      | priceType    | isShippingDisabled |
      | 5e69eed023128800199bb6af          | 5e688f88e2891c001afed6f9    | 55      | Hit by vendor for update shipping rule   | product        | fixed        | true               |
    And User make a request to update new shipping rules based on the products
    Then User should be able to update shipping rule
#Bug

  Scenario: Login with valid registered user details as a system admin and user wants to update shipping rule for seller based on the destination
    When User is able to log into application
      | email                                 | password       |
      | systemadmin@marketcube.io             | 12345678n@N    |
    Then user should be able to login to the system and store token
    And User enters destination details for updation
      |   UVITTVB             |
    And User enters product details for updation
      |  12DFF344DFFFF   |
    And User enters the shippingBandID details,Price details,shipping rule condition and description of shipping rule for updation
      | _id                               | shippingBandId              | price  | description                              | condition      | priceType   | isShippingDisabled |
      | 5e68e51622f13c0019225c0f          | 5e688f88e2891c001afed6f9    | 0      | Hit by seller for update shipping rule   | destination    | free        | false              |
    And User make a request to update shipping rules based on the destination
    Then User should not be able to update shipping rule and user should get validation message
      | User is not authorized to perform this action               |



  Scenario: Login with valid registered user details as a system admin and user wants to update shipping rule for seller based on the products
    When User is able to log into application
      | email                                 | password       |
      | systemadmin@marketcube.io             | 12345678n@N    |
    Then user should be able to login to the system and store token
    And User enters destination details for updation
      |   UVITTVB                   |
    And User enters product details for updation
      |  HR3e9xUMu112DFF344DFFFF1   |
    And User enters the shippingBandID details,Price details,shipping rule condition and description of shipping rule for updation
      | _id                               | shippingBandId              | price   | description                              | condition      | priceType    | isShippingDisabled |
      | 5e69eed023128800199bb6af          | 5e688f88e2891c001afed6f9    | 55      | Hit by seller for update shipping rule   | product        | fixed        | true               |
    And User make a request to update new shipping rules based on the products
    Then User should not be able to update shipping rule and user should get validation message
      | User is not authorized to perform this action               |




  Scenario: Login with valid registered user details as a seller and with blank destinationCodes user wants to update shipping rule for seller based on the destination
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then user should be able to login to the system and store token
    And User enters destination details for updation
      |                |
    And User enters product details for updation
      |  12DFF344DFFFF   |
    And User enters the shippingBandID details,Price details,shipping rule condition and description of shipping rule for updation
      | _id                               | shippingBandId              | price  | description                              | condition      | priceType   | isShippingDisabled |
      | 5e68e51622f13c0019225c0f          | 5e688f88e2891c001afed6f9    | 0      | Hit by seller for update shipping rule   | destination    | free        | false              |
    And User make a request to update shipping rules based on the destination
    Then User should not be able to update shipping rule and user should get validation message
      |  destinationCodes is required.        |
#bug when login as a seller and seller wants to update a shipping rule without destinationCodes field then it should be expected error message as a "destinationCodes is required." but in actual scenario it accepted the requests and give status ok and data true


  Scenario: Login with valid registered user details as a seller and with blank productIds user wants to update shipping rule for seller based on the products
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then user should be able to login to the system and store token
    And User enters destination details for updation
      |   UVITTVB                   |
    And User enters product details for updation
      |                             |
    And User enters the shippingBandID details,Price details,shipping rule condition and description of shipping rule for updation
      | _id                               | shippingBandId              | price   | description                              | condition      | priceType    | isShippingDisabled |
      | 5e69eed023128800199bb6af          | 5e688f88e2891c001afed6f9    | 55      | Hit by seller for update shipping rule   | product        | fixed        | true               |
    And User make a request to update new shipping rules based on the products
    Then User should not be able to update shipping rule and user should get validation message
      |  productIds is required.        |
#bug when login as a seller and seller wants to update a shipping rule without destinationCodes field then it should be expected error message as a "productIds is required." but in actual scenario it accepted the requests and give status ok and data true





  Scenario Outline: user wants to update shipping rule based on the destination by passing Incorrect/blank token data
    And User enters destination details for updation
      |   UVITTVB             |
    And User enters product details for updation
      |  12DFF344DFFFF   |
    And User enters the shippingBandID details,Price details,shipping rule condition and description of shipping rule for updation
      | _id                               | shippingBandId              | price  | description                              | condition      | priceType   | isShippingDisabled |
      | 5e68e51622f13c0019225c0f          | 5e688f88e2891c001afed6f9    | 0      | Hit by seller for update shipping rule   | destination    | free        | false              |
    When User make a request to update new shipping rules based on the destination with Incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then User should not be able to update shipping rule and user should get validation message
      | Invalid token provided          |
      | Invalid token provided          |
    Examples:
      | token                           |
      |  sgshhshhshhshshhsh             |
      |                                 |