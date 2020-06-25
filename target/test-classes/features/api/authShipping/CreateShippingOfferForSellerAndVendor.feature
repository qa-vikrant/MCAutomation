Feature: API  Auth - Create shipping offer for seller/vendor - post-  /user/shipping-offer

     As a registered user
     I want to create the shipping offer for seller

    Scenario Outline: Login with valid registered user details as  a seller and user wants to create shipping offer for seller based on products
      When User is able to log into application
        | email                                 | password       |
        | vikrant.singh@successive.tech         | HaiVikki12     |
      Then User should be able to login to the system and store token
      And User enters destination details for shipping offer
        |   UK             |
      And User enters product details for shipping offer
        |  5e58bd1672d6c500170cd903 |
      And User enters the shippingBandID details,Price details,shipping offer condition and description of shipping offer
        | description   |shippingBandId    | isCumulative   |   priceType      | price    |  condition   |
        | <description> |<shippingBandId>  | <isCumulative> |   <priceType>    | <price>  |  <condition> |
      And User enters the condition criteria and condition value
        | value    | criteria   |
        | <value>  | <criteria> |
      And user make a request to create a shipping offer based on products
      Then User should be able to create shipping offer
      Examples:
        | description                                      | shippingBandId             | isCumulative   | priceType      | price    |  condition         | value    | criteria     |
        | hit by RestAssured on products by seller         | 5e82ea96869d7c0013af0636   | false          | fixed          |  20      |                    |          |              |
        | hit by RestAssured on products by seller         | 5e82ea96869d7c0013af0636   | false          | free           |  0       | productPrice       |  200     | greaterThan  |
        | hit by RestAssured on products by seller         | 5e82ea96869d7c0013af0636   | false          | free           |  0       | productPrice       |  200     | lessThan     |
        | hit by RestAssured on products by seller         | 5e82ea96869d7c0013af0636   | false          | free           |  0       | productQuantity    |  200     | greaterThan  |
        | hit by RestAssured on products by seller         | 5e82ea96869d7c0013af0636   | false          | free           |  0       | productQuantity    |  200     | lessThan     |
        | hit by RestAssured on products by seller         | 5e82ea96869d7c0013af0636   | false          | free           |  0       | orderValue         |  200     | greaterThan  |
        | hit by RestAssured on products by seller         | 5e82ea96869d7c0013af0636   | false          | free           |  0       | orderValue         |  200     | lessThan     |






    Scenario Outline: Login with valid registered user details as  a seller and user wants to create shipping offer for seller based on destination
      When User is able to log into application
        | email                                 | password       |
        | vikrant.singh@successive.tech         | HaiVikki12     |
      Then User should be able to login to the system and store token
      And User enters destination details for shipping offer
        |   UK             |
      And User enters product details for shipping offer
        |  5e58bd1672d6c500170cd903 |
      And User enters the shippingBandID details,Price details,shipping offer condition and description of shipping offer
        | description   |shippingBandId    | isCumulative   |   priceType      | price    |  condition   |
        | <description> |<shippingBandId>  | <isCumulative> |   <priceType>    | <price>  |  <condition> |
      And User enters the condition criteria and condition value
        | value    | criteria   |
        | <value>  | <criteria> |
      And user make a request to create a shipping offer based on destination
#      Then User should be able to create shipping offer
      Examples:
        | description                                      | shippingBandId             | isCumulative   | priceType      | price    |  condition         | value    | criteria     |
        | hit by RestAssured on destination  by seller     | 5e82ea96869d7c0013af0636   | false          | fixed          |  20      |                    |          |              |
        | hit by RestAssured on destination  by seller     | 5e82ea96869d7c0013af0636   | false          | free           |  0       | productPrice       |  200     | greaterThan  |
        | hit by RestAssured on destination  by seller     | 5e82ea96869d7c0013af0636   | false          | free           |  0       | productPrice       |  200     | lessThan     |
        | hit by RestAssured on destination  by seller     | 5e82ea96869d7c0013af0636   | false          | fixed          |  20      | productQuantity    |  200     | greaterThan  |
        | hit by RestAssured on destination  by seller     | 5e82ea96869d7c0013af0636   | false          | free           |  0       | productQuantity    |  200     | lessThan     |
        | hit by RestAssured on destination  by seller     | 5e82ea96869d7c0013af0636   | false          | fixed          |  20      | orderValue         |  200     | greaterThan  |
        | hit by RestAssured on destination  by seller     | 5e82ea96869d7c0013af0636   | false          | free           |  0       | orderValue         |  200     | lessThan     |



    Scenario Outline: Login with valid registered user details as  a seller and without follow field validation user wants to create shipping offer for seller based on destination
      When User is able to log into application
        | email                                 | password       |
        | vikrant.singh@successive.tech         | HaiVikki12     |
      Then User should be able to login to the system and store token
      And User enters destination details for shipping offer
        |   UK             |
      And User enters product details for shipping offer
        |  5e58bd1672d6c500170cd903 |
      And User enters the shippingBandID details,Price details,shipping offer condition and description of shipping offer
        | description   |shippingBandId    | isCumulative   |   priceType      | price    |  condition   |
        | <description> |<shippingBandId>  | <isCumulative> |   <priceType>    | <price>  |  <condition> |
      And User enters the condition criteria and condition value
        | value    | criteria   |
        | <value>  | <criteria> |
      And user make a request to create a shipping offer based on destination
      Then User should not be able to create offer and user should gets validation error message
        | Description is required.                                                     |
        | ShippingBandId is required.                                                  |
        | Please provide price amount for criteria of product price                    |
        | Please enter valid value for product price, should be more than 0            |
        | Please provide quantity amount for criteria of product quantity              |
        | Please enter valid value for product quantity, should be more than 0         |
        | Please provide order amount for criteria of order value                      |
        | Please enter valid amount for order value, should be more than 0             |
        | criteria is required.                                                        |
        | criteria is required.                                                        |
        | criteria is required.                                                        |
        | Invalid criteria provided.                                                   |
        | PriceType is required.                                                       |
        | Invalid priceType provided.                                                  |
        | Please provide price for shipping offer or select Free as shipping           |
        | Invalid ShippingBandId provided.                                             |
      Examples:
        | description                                      | shippingBandId             | isCumulative   | priceType      | price    |  condition         | value    | criteria     |
        |                                                  | 5e82ea96869d7c0013af0636   | false          | fixed          |  20      |                    |          |              |
        | hit by RestAssured on destination  by seller     |                            | false          | free           |  0       | productPrice       |  200     | greaterThan  |
        | hit by RestAssured on destination  by seller     | 5e82ea96869d7c0013af0636   | false          | free           |  0       | productPrice       |          |  lessThan    |
        | hit by RestAssured on destination  by seller     | 5e82ea96869d7c0013af0636   | false          | free           |  0       | productPrice       |   0      | greaterThan  |
        | hit by RestAssured on destination  by seller     | 5e82ea96869d7c0013af0636   | false          | fixed          |  20      | productQuantity    |          | greaterThan  |
        | hit by RestAssured on destination  by seller     | 5e82ea96869d7c0013af0636   | false          | free           |  0       | productQuantity    |  0       | lessThan     |
        | hit by RestAssured on destination  by seller     | 5e82ea96869d7c0013af0636   | false          | fixed          |  20      | orderValue         |          | greaterThan  |
        | hit by RestAssured on destination  by seller     | 5e82ea96869d7c0013af0636   | false          | free           |  0       | orderValue         |  0       | lessThan     |
        | hit by RestAssured on destination  by seller     | 5e82ea96869d7c0013af0636   | false          | free           |  0       | productPrice       |  200     |              |
        | hit by RestAssured on destination  by seller     | 5e82ea96869d7c0013af0636   | false          | free           |  0       | productQuantity    |  200     |              |
        | hit by RestAssured on destination  by seller     | 5e82ea96869d7c0013af0636   | false          | free           |  0       | orderValue         |  200     |              |
        | hit by RestAssured on destination  by seller     | 5e82ea96869d7c0013af0636   | false          | free           |  0       | orderValue         |  200     | ddddddddd    |
        | hit by RestAssured on destination  by seller     | 5e82ea96869d7c0013af0636   | false          |                |  0       | orderValue         |  200     | lessThan    |
        | hit by RestAssured on destination  by seller     | 5e82ea96869d7c0013af0636   | false          | freeeeeeee     |  0       | orderValue         |  200     | lessThan    |
        | hit by RestAssured on destination  by seller     | 5e82ea96869d7c0013af0636   | false          | free           |          | orderValue         |  200     | lessThan    |
        | hit by RestAssured on destination  by seller     | 222222222222222222222222   | false          | free           |  0       | orderValue         |  200     | lessThan    |
#bug --


    Scenario Outline: Login with valid registered user details as  a vendor and user wants to create shipping offer for seller based on products
      When User is able to log into application
        | email                                 | password       |
        | vikrant.singh@successive.tech         | 1234567890     |
      Then User should be able to login to the system and store token
      And User enters destination details for shipping offer
        |   UK             |
      And User enters product details for shipping offer
        |  5e58bd1672d6c500170cd903 |
      And User enters the shippingBandID details,Price details,shipping offer condition and description of shipping offer
        | description   |shippingBandId    | isCumulative   |   priceType      | price    |  condition   |
        | <description> |<shippingBandId>  | <isCumulative> |   <priceType>    | <price>  |  <condition> |
      And User enters the condition criteria and condition value
        | value    | criteria   |
        | <value>  | <criteria> |
      And user make a request to create a shipping offer based on products
      Then User should be able to create shipping offer
      Examples:
        | description                                      | shippingBandId             | isCumulative   | priceType      | price    |  condition         | value    | criteria     |
        | hit by RestAssured on products by seller         | 5e82ea96869d7c0013af0636   | false          | fixed          |  20      |                    |          |              |
        | hit by RestAssured on products by seller         | 5e82ea96869d7c0013af0636   | false          | free           |  0       | productPrice       |  200     | greaterThan  |
        | hit by RestAssured on products by seller         | 5e82ea96869d7c0013af0636   | false          | free           |  0       | productPrice       |  200     | lessThan     |
        | hit by RestAssured on products by seller         | 5e82ea96869d7c0013af0636   | false          | free           |  0       | productQuantity    |  200     | greaterThan  |
        | hit by RestAssured on products by seller         | 5e82ea96869d7c0013af0636   | false          | free           |  0       | productQuantity    |  200     | lessThan     |
        | hit by RestAssured on products by seller         | 5e82ea96869d7c0013af0636   | false          | free           |  0       | orderValue         |  200     | greaterThan  |
        | hit by RestAssured on products by seller         | 5e82ea96869d7c0013af0636   | false          | free           |  0       | orderValue         |  200     | lessThan     |



    Scenario Outline: Login with valid registered user details as  a vendor and user wants to create shipping offer for seller based on destination
      When User is able to log into application
        | email                                 | password       |
        | vikrant.singh@successive.tech         | 1234567890     |
      Then User should be able to login to the system and store token
      And User enters destination details for shipping offer
        |   UK             |
      And User enters product details for shipping offer
        |  5e58bd1672d6c500170cd903 |
      And User enters the shippingBandID details,Price details,shipping offer condition and description of shipping offer
        | description   |shippingBandId    | isCumulative   |   priceType      | price    |  condition   |
        | <description> |<shippingBandId>  | <isCumulative> |   <priceType>    | <price>  |  <condition> |
      And User enters the condition criteria and condition value
        | value    | criteria   |
        | <value>  | <criteria> |
      And user make a request to create a shipping offer based on destination
      Then User should be able to create shipping offer
      Examples:
        | description                                      | shippingBandId             | isCumulative   | priceType      | price    |  condition         | value    | criteria     |
        | hit by RestAssured on destination  by vendor     | 5e82ea96869d7c0013af0636   | false          | fixed          |  20      |                    |          |              |
        | hit by RestAssured on destination  by vendor     | 5e82ea96869d7c0013af0636   | false          | free           |  0       | productPrice       |  200     | greaterThan  |
        | hit by RestAssured on destination  by vendor     | 5e82ea96869d7c0013af0636   | false          | free           |  0       | productPrice       |  200     | lessThan     |
        | hit by RestAssured on destination  by vendor     | 5e82ea96869d7c0013af0636   | false          | fixed          |  20      | productQuantity    |  200     | greaterThan  |
        | hit by RestAssured on destination  by vendor     | 5e82ea96869d7c0013af0636   | false          | free           |  0       | productQuantity    |  200     | lessThan     |
        | hit by RestAssured on destination  by vendor     | 5e82ea96869d7c0013af0636   | false          | fixed          |  20      | orderValue         |  200     | greaterThan  |
        | hit by RestAssured on destination  by vendor     | 5e82ea96869d7c0013af0636   | false          | free           |  0       | orderValue         |  200     | lessThan     |



#    Scenario Outline: Login with valid registered user details as  a System Admin and user wants to create shipping offer for seller based on products
#      When User is able to log into application
#        | email                                 | password       |
#        | systemadmin@marketcube.io             | 12345678n@N    |
#      Then User should be able to login to the system and store token
#      And User enters destination details for shipping offer
#        |   UK             |
#      And User enters product details for shipping offer
#        |  5e58bd1672d6c500170cd903 |
#      And User enters the shippingBandID details,Price details,shipping offer condition and description of shipping offer
#        | description   |shippingBandId    | isCumulative   |   priceType      | price    |  condition   |
#        | <description> |<shippingBandId>  | <isCumulative> |   <priceType>    | <price>  |  <condition> |
#      And User enters the condition criteria and condition value
#        | value    | criteria   |
#        | <value>  | <criteria> |
#      And user make a request to create a shipping offer based on products
#      Then User should not be able to create offer and user should gets validation error message
#        | User is not authorized to perform this action |
#        | User is not authorized to perform this action |
#        | User is not authorized to perform this action |
#        | User is not authorized to perform this action |
#        | User is not authorized to perform this action |
#        | User is not authorized to perform this action |
#        | User is not authorized to perform this action |
#      Examples:
#        | description                                      | shippingBandId             | isCumulative   | priceType      | price    |  condition         | value    | criteria     |
#        | hit by RestAssured on products by seller         | 5e82ea96869d7c0013af0636   | false          | fixed          |  20      |                    |          |              |
#        | hit by RestAssured on products by seller         | 5e82ea96869d7c0013af0636   | false          | free           |  0       | productPrice       |  200     | greaterThan  |
#        | hit by RestAssured on products by seller         | 5e82ea96869d7c0013af0636   | false          | free           |  0       | productPrice       |  200     | lessThan     |
#        | hit by RestAssured on products by seller         | 5e82ea96869d7c0013af0636   | false          | free           |  0       | productQuantity    |  200     | greaterThan  |
#        | hit by RestAssured on products by seller         | 5e82ea96869d7c0013af0636   | false          | free           |  0       | productQuantity    |  200     | lessThan     |
#        | hit by RestAssured on products by seller         | 5e82ea96869d7c0013af0636   | false          | free           |  0       | orderValue         |  200     | greaterThan  |
#        | hit by RestAssured on products by seller         | 5e82ea96869d7c0013af0636   | false          | free           |  0       | orderValue         |  200     | lessThan     |
#


#    Scenario Outline: Login with valid registered user details as  a System Admin and user wants to create shipping offer for seller based on destination
#      When User is able to log into application
#        | email                                 | password       |
#        | systemadmin@marketcube.io             | 12345678n@N    |
#      Then User should be able to login to the system and store token
#      And User enters destination details for shipping offer
#        |   UK             |
#      And User enters product details for shipping offer
#        |  5e58bd1672d6c500170cd903 |
#      And User enters the shippingBandID details,Price details,shipping offer condition and description of shipping offer
#        | description   |shippingBandId    | isCumulative   |   priceType      | price    |  condition   |
#        | <description> |<shippingBandId>  | <isCumulative> |   <priceType>    | <price>  |  <condition> |
#      And User enters the condition criteria and condition value
#        | value    | criteria   |
#        | <value>  | <criteria> |
#      And user make a request to create a shipping offer based on destination
#      Then User should not be able to create offer and user should gets validation error message
#        | User is not authorized to perform this action |
#        | User is not authorized to perform this action |
#        | User is not authorized to perform this action |
#        | User is not authorized to perform this action |
#        | User is not authorized to perform this action |
#        | User is not authorized to perform this action |
#        | User is not authorized to perform this action |
#      Examples:
#        | description                                      | shippingBandId             | isCumulative   | priceType      | price    |  condition         | value    | criteria     |
#        | hit by RestAssured on destination  by vendor     | 5e82ea96869d7c0013af0636   | false          | fixed          |  20      |                    |          |              |
#        | hit by RestAssured on destination  by vendor     | 5e82ea96869d7c0013af0636   | false          | free           |  0       | productPrice       |  200     | greaterThan  |
#        | hit by RestAssured on destination  by vendor     | 5e82ea96869d7c0013af0636   | false          | free           |  0       | productPrice       |  200     | lessThan     |
#        | hit by RestAssured on destination  by vendor     | 5e82ea96869d7c0013af0636   | false          | fixed          |  20      | productQuantity    |  200     | greaterThan  |
#        | hit by RestAssured on destination  by vendor     | 5e82ea96869d7c0013af0636   | false          | free           |  0       | productQuantity    |  200     | lessThan     |
#        | hit by RestAssured on destination  by vendor     | 5e82ea96869d7c0013af0636   | false          | fixed          |  20      | orderValue         |  200     | greaterThan  |
#        | hit by RestAssured on destination  by vendor     | 5e82ea96869d7c0013af0636   | false          | free           |  0       | orderValue         |  200     | lessThan     |








