Feature: API-  Auth - Update shipping offer for seller/Vendor-  put - /user/shipping-offer

       As a registered user
       I want to update shipping offer for seller/Vendor

  Scenario Outline: Login with valid registered user details as a seller and user wants to update their own shipping offer
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then user should be able to login to the system and store token
    When User enters shipping offer details
      | _id     | userId   |  description    | priceType   | price   | isCumulative   |
      | <_id>   | <userId> |  <description>  | <priceType> | <price> | <isCumulative> |
    Then User make a request to update shipping offer
    Then User should be able to update shipping offer successfully
    Examples:
      | _id                       | userId                     |  description                                    | priceType   | price   | isCumulative   |
      | 5e86ff3d84ca54001330ed7c  | 5e29912fbfec74a0272e9a92   |  Api Hit by seller for update shipping offer    | fixed       | 222     | false          |



  Scenario Outline: Login with valid registered user details as a vendor and user wants to update their own shipping offer
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | 1234567890     |
    Then user should be able to login to the system and store token
    When User enters shipping offer details
      | _id     | userId   |  description    | priceType   | price   | isCumulative   |
      | <_id>   | <userId> |  <description>  | <priceType> | <price> | <isCumulative> |
    Then User make a request to update shipping offer
    Then User should be able to update shipping offer successfully
    Examples:
      | _id                       | userId                     |  description                                    | priceType   | price   | isCumulative   |
      | 5e86f8cab7a1f19e25dfaa03  | 5e2996260da2580011251edb   |  Api Hit by vendor for update shipping offer    | fixed       | 222     | false          |



  Scenario Outline: Login with valid registered user details as a System Admin and user wants to update shipping offer of other seller
    When User is able to log into application
      | email                                 | password       |
      | systemadmin@marketcube.io             | 12345678n@N    |
    Then user should be able to login to the system and store token
    When User enters shipping offer details
      | _id     | userId   |  description    | priceType   | price   | isCumulative   |
      | <_id>   | <userId> |  <description>  | <priceType> | <price> | <isCumulative> |
    Then User make a request to update shipping offer
    Then User should not be able to update shipping offer for seller and user should get validation error message
      | User is not authorized to perform this action               |
    Examples:
      | _id                       | userId                     |  description                                         | priceType   | price   | isCumulative   |
      | 5e86ff3d84ca54001330ed7c  | 5e29912fbfec74a0272e9a92   |  Api Hit by SystemAdmin for update shipping offer    | fixed       | 222     | false          |



  Scenario Outline: Login with valid registered user details as a seller and without follow field validation user wants to update their own shipping offer
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then user should be able to login to the system and store token
    When User enters shipping offer details
      | _id     | userId   |  description    | priceType   | price   | isCumulative   |
      | <_id>   | <userId> |  <description>  | <priceType> | <price> | <isCumulative> |
    Then User make a request to update shipping offer
    Then User should not be able to update shipping offer for seller and user should get validation error message
      | _id is required.                     |
      | Invalid _id provided.                |
      | userId is required.                  |
      | Invalid userId provided.             |
      | PriceType is required.               |
      | Description is required.             |
      | Invalid priceType provided.          |
      | Please provide price for shipping band or select Free as shipping  |
    Examples:
      | _id                       | userId                     |  description                                    | priceType   | price   | isCumulative   |
      |                           | 5e29912fbfec74a0272e9a92   |  Api Hit by seller for update shipping offer    | fixed       | 222     | false          |
      | 1234567891234567891234567 | 5e29912fbfec74a0272e9a92   |  Api Hit by seller for update shipping offer    | fixed       | 222     | false          |
      | 5e86ff3d84ca54001330ed7c  |                            |  Api Hit by seller for update shipping offer    | fixed       | 222     | false          |
      | 5e86ff3d84ca54001330ed7c  | 1234567891234567891234567  |  Api Hit by seller for update shipping offer    | fixed       | 222     | false          |
      | 5e86ff3d84ca54001330ed7c  | 5e29912fbfec74a0272e9a92   |  Api Hit by seller for update shipping offer    |             | 222     | false          |
      | 5e86ff3d84ca54001330ed7c  | 5e29912fbfec74a0272e9a92   |                                                 | fixed       | 222     | false          |
      | 5e86ff3d84ca54001330ed7c  | 5e29912fbfec74a0272e9a92   |  Api Hit by seller for update shipping offer    | freeeeeeee  | 222     | false          |
      | 5e86ff3d84ca54001330ed7c  | 5e29912fbfec74a0272e9a92   |  Api Hit by seller for update shipping offer    | fixed       |         | false          |


  Scenario Outline: user wants to update shipping offer based on the destination by passing Incorrect/blank token data
    When User enters shipping offer details
      | _id                       | userId                     |  description                                         | priceType   | price   | isCumulative   |
      | 5e86ff3d84ca54001330ed7c  | 5e29912fbfec74a0272e9a92   |  Api Hit by SystemAdmin for update shipping offer    | fixed       | 222     | false          |
    When User make a request to update shipping offer with Incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then User should not be able to update shipping offer for seller and user should get validation error message
      | Invalid token provided          |
      | Invalid token provided          |
    Examples:
      | token                           |
      |  sgshhshhshhshshhsh             |
      |                                 |
