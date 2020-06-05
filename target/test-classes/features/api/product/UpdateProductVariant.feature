Feature: API- Product - Update product variant.- put -  /product/variant

        Login as a registered user
        user wants to update product variant

  Scenario Outline: Login with valid registered user details as a seller and user wants to update their product variant
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then user should be able to login to the system and store token
    When User enters the details of product variant for updation
      | productId     | seller    | id    | image       | option1Val   | option2Val   | option3Val  | price   | comparePrice   | sku   | barcode   | inventoryManagement   | inventoryQuantity   | isShipping   | weight   | weightUnit    | isTaxable | markUp | discount | fulfillmentService|
      | <productId>   | <seller>  | <id>  | <image>     | <option1Val> | <option2Val> | <option3Val> | <price> | <comparePrice> | <sku> | <barcode> | <inventoryManagement> | <inventoryQuantity> | <isShipping> | <weight> | <weightUnit> |           |        |          |                   |
    And User make a request to update the variant of product
    Then User should be able to update the variant of product
      | 5e65e7fc49300c0e10f1dc4a |
    Examples:
      | productId                | seller                   | id | image   | option1Val | option2Val  | option3Val  | price   | comparePrice   | sku   | barcode   | inventoryManagement   | inventoryQuantity   | isShipping   | weight   | weightUnit   |  markUp | discount | fulfillmentService|
      | 5e65e7fc009ff500172925a8 | 5e29912fbfec74a0272e9a92 | 1  |         | 2          | Red         | Cotton      | 1899    | 2000           | 11    |           |  shopify              |                     |              |          |              |         |          |                   |
      | 5e65e7fc009ff500172925a8 | 5e29912fbfec74a0272e9a92 | 2  |         | 2          | Red         | Cotton      | 1899    | 2000           | 11    |           |  shopify              |                     |              |          |              |         |          |                   |




  Scenario Outline: Login with valid registered user details as a vendor and user wants to update their product variant
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | 1234567890     |
    Then user should be able to login to the system and store token
    When User enters the details of product variant for updation
      | productId     | id    | image       | option1Val   | option2Val   | option3Val  | price   | comparePrice   | sku   | barcode   | inventoryManagement   | inventoryQuantity   | isShipping   | weight   | weightUnit    | isTaxable | markUp | discount | fulfillmentService|
      | <productId>   | <id>  | <image>     | <option1Val> | <option2Val> | <option3Val> | <price> | <comparePrice> | <sku> | <barcode> | <inventoryManagement> | <inventoryQuantity> | <isShipping> | <weight> | <weightUnit> |           |        |          |                   |
    And User make a request to update the variant of product
    Then User should be able to update the variant of product
      | 5e65e7fc009ff500172925a8 |
    Examples:
      | productId                | id | image   | option1Val | option2Val  | option3Val  | price   | comparePrice   | sku   | barcode   | inventoryManagement   | inventoryQuantity   | isShipping   | weight   | weightUnit   |  markUp | discount | fulfillmentService|
      | 5e65e7fc009ff500172925a8 | 1  |         | 2          | Red         | Cotton      | 1899    | 2000           | 11    |           |  shopify              |                     |              |          |              |         |          |                   |
      | 5e65e7fc009ff500172925a8 | 2  |         | 2          | Red         | Cotton      | 1899    | 2000           | 11    |           |  shopify              |                     |              |          |              |         |          |                   |
      | 5e65e7fc009ff500172925a8 | 3  |         | 2          | Red         | Cotton      | 1899    | 2000           | 11    |           |  shopify              |                     |              |          |              |         |          |                   |







  Scenario Outline: Login with valid registered user details as a seller and without follow field validation user wants to update their product variant
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then user should be able to login to the system and store token
    When User enters the details of product variant for updation
      | productId     | seller    | id    | image       | option1Val   | option2Val   | option3Val  | price   | comparePrice   | sku   | barcode   | inventoryManagement   | inventoryQuantity   | isShipping   | weight   | weightUnit    | isTaxable | markUp | discount | fulfillmentService|
      | <productId>   | <seller>  | <id>  | <image>     | <option1Val> | <option2Val> | <option3Val> | <price> | <comparePrice> | <sku> | <barcode> | <inventoryManagement> | <inventoryQuantity> | <isShipping> | <weight> | <weightUnit> |           |        |          |                   |
    And User make a request to update the variant of product
    Then User should not be able to update the product variant and user should get validation error message
      | ProductId is required.                |
      | Id is required.                       |
      | seller is required.                   |
      | Invalid data provided                 |
      | Invalid data provided                 |
      | Invalid data provided                 |
      | Atleast one option is required.       |
      | Invalid data provided                 |
      | Invalid data provided                 |
      | Invalid data provided                 |
    Examples:
      | productId                | seller                   | id | image   | option1Val | option2Val  | option3Val  | price   | comparePrice   | sku   | barcode   | inventoryManagement   | inventoryQuantity   | isShipping   | weight   | weightUnit   |  markUp | discount | fulfillmentService|
      |                          | 5e29912fbfec74a0272e9a92 | 1  |         | 2          | Red         | Cotton      | 1899    | 2000           | 11    |           |  shopify              |                     |              |          |              |         |          |                   |
      | 5e65e7fc009ff500172925a8 | 5e29912fbfec74a0272e9a92 |    |         | 2          | Red         | Cotton      | 1899    | 2000           | 11    |           |  shopify              |                     |              |          |              |         |          |                   |
      | 5e65e7fc009ff500172925a8 |                          | 2  |         | 2          | Red         | Cotton      | 1899    | 2000           | 11    |           |  shopify              |                     |              |          |              |         |          |                   |
      | 12345678901234567890123  | 5e29912fbfec74a0272e9a92 | 2  |         | 2          | Red         | Cotton      | 1899    | 2000           | 11    |           |  shopify              |                     |              |          |              |         |          |                   |
      | 123456789012345678901234 | 5e29912fbfec74a0272e9a92 | 2  |         | 2          | Red         | Cotton      | 1899    | 2000           | 11    |           |  shopify              |                     |              |          |              |         |          |                   |
      | 1234567890123456789012345| 5e29912fbfec74a0272e9a92 | 2  |         | 2          | Red         | Cotton      | 1899    | 2000           | 11    |           |  shopify              |                     |              |          |              |         |          |                   |
      | 5e65e7fc009ff500172925a8 | 5e29912fbfec74a0272e9a92 | 1  |         |            |             |             | 1899    | 2000           | 11    |           |  shopify              |                     |              |          |              |         |          |                   |
      | 5e65e7fc009ff500172925a8 | 12345678901234567890123  | 1  |         | 2          | Red         | Cotton      | 1899    | 2000           | 11    |           |  shopify              |                     |              |          |              |         |          |                   |
      | 5e65e7fc009ff500172925a8 | 123456789012345678901234 | 1  |         | 2          | Red         | Cotton      | 1899    | 2000           | 11    |           |  shopify              |                     |              |          |              |         |          |                   |
      | 5e65e7fc009ff500172925a8 | 1234567890123456789012345| 2  |         | 2          | Red         | Cotton      | 1899    | 2000           | 11    |           |  shopify              |                     |              |          |              |         |          |                   |



  Scenario Outline: Login with valid registered user details as a System admin and user wants to update product variant of vendor
    When User is able to log into application
      | email                                 | password       |
      | systemadmin@marketcube.io             | 12345678n@N    |
    Then user should be able to login to the system and store token
    When User enters the details of product variant for updation
      | productId     | id    | image       | option1Val   | option2Val   | option3Val  | price   | comparePrice   | sku   | barcode   | inventoryManagement   | inventoryQuantity   | isShipping   | weight   | weightUnit    | isTaxable | markUp | discount | fulfillmentService|
      | <productId>   | <id>  | <image>     | <option1Val> | <option2Val> | <option3Val> | <price> | <comparePrice> | <sku> | <barcode> | <inventoryManagement> | <inventoryQuantity> | <isShipping> | <weight> | <weightUnit> |           |        |          |                   |
    And User make a request to update the variant of product
    Then User should be able to update the variant of product
      | 5e65e7fc009ff500172925a8 |
    Examples:
      | productId                | id | image   | option1Val | option2Val  | option3Val  | price   | comparePrice   | sku   | barcode   | inventoryManagement   | inventoryQuantity   | isShipping   | weight   | weightUnit   |  markUp | discount | fulfillmentService|
      | 5e65e7fc009ff500172925a8 | 1  |         | 2          | Red         | Cotton      | 1899    | 2000           | 11    |           |  shopify              |                     |              |          |              |         |          |                   |
      | 5e65e7fc009ff500172925a8 | 2  |         | 2          | Red         | Cotton      | 1899    | 2000           | 11    |           |  shopify              |                     |              |          |              |         |          |                   |
      | 5e65e7fc009ff500172925a8 | 3  |         | 2          | Red         | Cotton      | 1899    | 2000           | 11    |           |  shopify              |                     |              |          |              |         |          |                   |
# by default system admin  update the product variant of vendor ,means system admin work as vendor here





  Scenario Outline: Login with valid registered user details as a System Admin and user wants to update the product variant of seller
    When User is able to log into application
      | email                                 | password       |
      | systemadmin@marketcube.io             | 12345678n@N    |
    Then user should be able to login to the system and store token
    When User enters the details of product variant for updation
      | productId     | seller    | id    | image       | option1Val   | option2Val   | option3Val  | price   | comparePrice   | sku   | barcode   | inventoryManagement   | inventoryQuantity   | isShipping   | weight   | weightUnit    | isTaxable | markUp | discount | fulfillmentService|
      | <productId>   | <seller>  | <id>  | <image>     | <option1Val> | <option2Val> | <option3Val> | <price> | <comparePrice> | <sku> | <barcode> | <inventoryManagement> | <inventoryQuantity> | <isShipping> | <weight> | <weightUnit> |           |        |          |                   |
    And User make a request to update the variant of product
    Then User should be able to update the variant of product
      | 5e65e7fc49300c0e10f1dc4a |
    Examples:
      | productId                | seller                   | id | image   | option1Val | option2Val  | option3Val  | price   | comparePrice   | sku   | barcode   | inventoryManagement   | inventoryQuantity   | isShipping   | weight   | weightUnit   |  markUp | discount | fulfillmentService|
      | 5e65e7fc009ff500172925a8 | 5e29912fbfec74a0272e9a92 | 1  |         | 2          | Red         | Cotton      | 1899    | 2000           | 11    |           |  shopify              |                     |              |          |              |         |          |                   |
      | 5e65e7fc009ff500172925a8 | 5e29912fbfec74a0272e9a92 | 2  |         | 2          | Red         | Cotton      | 1899    | 2000           | 11    |           |  shopify              |                     |              |          |              |         |          |                   |
#system admin user sellerid  to update the product variant of seller,means by use of sellerid - system admin work as seller here