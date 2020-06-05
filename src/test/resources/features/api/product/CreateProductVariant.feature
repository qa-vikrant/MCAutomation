Feature: API - Product - Create product variant -post  -/product/variant

         Login user as a seller
         I want to create the variant of product

         Login user as a vendor
         I want to create the variant of product

  Scenario Outline: Login with valid registered user details as a seller and user wants to create the variant of product
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then user should be able to login to the system and store token
    When User enters the details of product variant
      | productId     | image       | option1Val   | option1   | option2Val   | option2   | option3Val   | option3   | price   | comparePrice   | sku   | barcode   | inventoryManagement   | inventoryQuantity   | isShipping   | weight   | weightUnit   |
      | <productId>   | <image>     | <option1Val> | <option1> | <option2Val> | <option2> | <option3Val> | <option3> | <price> | <comparePrice> | <sku> | <barcode> | <inventoryManagement> | <inventoryQuantity> | <isShipping> | <weight> | <weightUnit> |
    And User make a request to create the variant of product
    Then User should be able to create the variant of product
      | 5e65e7fc49300c0e10f1dc4a |
    Examples:
      | productId                | image   | option1Val | option1   | option2Val   | option2   | option3Val   | option3   | price   | comparePrice   | sku   | barcode   | inventoryManagement   | inventoryQuantity   | isShipping   | weight   | weightUnit   |
      | 5e65e7fc009ff500172925a8 |         | 2          | Size      | Red          | Color     | Cotton       | Material  | 1899    | 2000           | 11    |           |  shopify              |                     |              |          |              |
      | 5e65e7fc009ff500172925a8 |         | 2          | Size      | Red          | Color     | Cotton       | Material  | 1899    | 2000           | 11    |           |  shopify              |                     |              |          |              |
      | 5e65e7fc009ff500172925a8 |         | 2          | Size      | Red          | Color     | Cotton       | Material  | 1899    | 2000           | 11    |           |  shopify              |                     |              |          |              |




  Scenario Outline: Login with valid registered user details as a vendor and user wants to create the variant of product
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | 1234567890     |
    Then user should be able to login to the system and store token
    When User enters the details of product variant
      | productId     | image       | option1Val   | option1   | option2Val   | option2   | option3Val   | option3   | price   | comparePrice   | sku   | barcode   | inventoryManagement   | inventoryQuantity   | isShipping   | weight   | weightUnit   |
      | <productId>   | <image>     | <option1Val> | <option1> | <option2Val> | <option2> | <option3Val> | <option3> | <price> | <comparePrice> | <sku> | <barcode> | <inventoryManagement> | <inventoryQuantity> | <isShipping> | <weight> | <weightUnit> |
    And User make a request to create the variant of product
    Then User should be able to create the variant of product
      | 5e65e7fc009ff500172925a8 |
    Examples:
      | productId                | image   | option1Val | option1   | option2Val   | option2   | option3Val   | option3   | price   | comparePrice   | sku   | barcode   | inventoryManagement   | inventoryQuantity   | isShipping   | weight   | weightUnit   |
      | 5e65e7fc009ff500172925a8 |         | 2          | Size      | Red          | Color     | Cotton       | Material  | 1899    | 2000           | 11    |           |  shopify              |                     |              |          |              |
      | 5e65e7fc009ff500172925a8 |         | 2          | Size      | Red          | Color     | Cotton       | Material  | 1899    | 2000           | 11    |           |  shopify              |                     |              |          |              |
      | 5e65e7fc009ff500172925a8 |         | 2          | Size      | Red          | Color     | Cotton       | Material  | 1899    | 2000           | 11    |           |  shopify              |                     |              |          |              |



  Scenario Outline: Login with valid registered user details as a System Admin and user wants to create the variant of product for vendor
    When User is able to log into application
      | email                                 | password       |
      | systemadmin@marketcube.io             | 12345678n@N    |
    Then user should be able to login to the system and store token
    When User enters the details of product variant
      | productId     | image       | option1Val   | option1   | option2Val   | option2   | option3Val   | option3   | price   | comparePrice   | sku   | barcode   | inventoryManagement   | inventoryQuantity   | isShipping   | weight   | weightUnit   |
      | <productId>   | <image>     | <option1Val> | <option1> | <option2Val> | <option2> | <option3Val> | <option3> | <price> | <comparePrice> | <sku> | <barcode> | <inventoryManagement> | <inventoryQuantity> | <isShipping> | <weight> | <weightUnit> |
    And User make a request to create the variant of product
    Then User should be able to create the variant of product
      | 5e65e7fc009ff500172925a8 |
    Examples:
      | productId                | image   | option1Val | option1   | option2Val   | option2   | option3Val   | option3   | price   | comparePrice   | sku   | barcode   | inventoryManagement   | inventoryQuantity   | isShipping   | weight   | weightUnit   |
      | 5e65e7fc009ff500172925a8 |         | 2          | Size      | Red          | Color     | Cotton       | Material  | 1899    | 2000           | 11    |           |  shopify              |                     |              |          |              |
      | 5e65e7fc009ff500172925a8 |         | 2          | Size      | Red          | Color     | Cotton       | Material  | 1899    | 2000           | 11    |           |  shopify              |                     |              |          |              |
      | 5e65e7fc009ff500172925a8 |         | 2          | Size      | Red          | Color     | Cotton       | Material  | 1899    | 2000           | 11    |           |  shopify              |                     |              |          |              |



  Scenario Outline: Login with valid registered user details as a seller and without follow field validation user wants to create the variant of product
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then user should be able to login to the system and store token
    When User enters the details of product variant
      | productId     | image       | option1Val   | option1   | option2Val   | option2   | option3Val   | option3   | price   | comparePrice   | sku   | barcode   | inventoryManagement   | inventoryQuantity   | isShipping   | weight   | weightUnit   |
      | <productId>   | <image>     | <option1Val> | <option1> | <option2Val> | <option2> | <option3Val> | <option3> | <price> | <comparePrice> | <sku> | <barcode> | <inventoryManagement> | <inventoryQuantity> | <isShipping> | <weight> | <weightUnit> |
    And User make a request to create the variant of product
    Then User should not be able to create the product variant and user should get validation error message
      | ProductId is required. |
      | Invalid data provided  |
      | Atleast one option is required. |
    Examples:
      | productId                | image   | option1Val | option1   | option2Val   | option2   | option3Val   | option3   | price   | comparePrice   | sku   | barcode   | inventoryManagement   | inventoryQuantity   | isShipping   | weight   | weightUnit   |
      |                          |         | 2          | Size      | Red          | Color     | Cotton       | Material  | 1899    | 2000           | 11    |           |  shopify              |                     |              |          |              |
      | 123456789012345678901234 |         | 2          | Size      | Red          | Color     | Cotton       | Material  | 1899    | 2000           | 11    |           |  shopify              |                     |              |          |              |
      | 5e65e7fc009ff500172925a8 |         |            |           |              |           |              |           | 1899    | 2000           | 11    |           |  shopify              |                     |              |          |              |




  Scenario Outline: User make a request to create the variant of product with valid field by passing Incorrect/blank token data
    When User enters the details of product variant
      | productId     | image       | option1Val   | option1   | option2Val   | option2   | option3Val   | option3   | price   | comparePrice   | sku   | barcode   | inventoryManagement   | inventoryQuantity   | isShipping   | weight   | weightUnit   |
      | 5e65e7fc009ff500172925a8 |         | 2          | Size      | Red          | Color     | Cotton       | Material  | 1899    | 2000           | 11    |           |  shopify              |                     |              |          |              |
    When User make a request to create the variant of product with Incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then User should not be able to create the product variant and user should get validation error message
      | Invalid token provided          |
      | Invalid token provided          |
    Examples:
      | token                           |
      |  sgshhshhshhshshhsh             |
      |                                 |
