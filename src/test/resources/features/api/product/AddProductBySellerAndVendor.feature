Feature: API - Product - Add Product.-  post -  /product

       As a seller user
       I want to add a product on marketcube
       So that seller is able to add product on behalf of vendor

       As a vendor user
       I want to add a product on marketcube


  Scenario Outline: Login with valid registered user details as a seller and user wants to add a product on marketcube for vendor
    When User is able to log into application
      | email                                    | password       |
      | vikrant.singh+60@successive.tech         | 1234@Vik       |
    Then user should be able to login to the system and store token
    And user enters tag details for new product
      |  |
    And user enter image details for new product
      |  |
    And user enter variant details for new product
      |  |
    And user enter other details for new product
      | title   | description   | handle   | vendor   | vendorId   | collections   | productType   | isTaxable   | price   | comparePrice    | barcode   | inventoryManagement   | sku   | isShipping   | weight   | weightUnit   | fulfillmentService   | option1   | option2   | option3   | isWebhook   | shopifyProductId   | markUp   |  discount  | inventoryQuantity   |
      | <title> | <description> | <handle> | <vendor> | <vendorId> | <collections> | <productType> | <isTaxable> | <price> | <comparePrice>  | <barcode> | <inventoryManagement> | <sku> | <isShipping> | <weight> | <weightUnit> | <fulfillmentService> | <option1> | <option2> | <option3> | <isWebhook> | <shopifyProductId> | <markUp> | <discount> | <inventoryQuantity> |
    When user make request to add product on marketcube
    Then user should be able to add product on marketcube
    Examples:
      | title             | description               | handle   | vendor    | vendorId                    | collections   | productType   | isTaxable   | price   | comparePrice | barcode   | inventoryManagement   | sku   | isShipping   | weight   | weightUnit   | fulfillmentService   | option1   | option2   | option3   | isWebhook   | shopifyProductId   | markUp   |  discount  | inventoryQuantity   |
      | Nike              | API Automation by vikrant | handle   | vendor64 | 5ec61d5dc54ca1001a9f0ac0    |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  | size      | color     | material  |             |                    |          |            |                     |
      | Nike              | API Automation by vikrant | handle   | vendor64 | 5ec61d5dc54ca1001a9f0ac0    |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  | size      | color     | material  |             |                    |          |            |                     |
      | Nike              | API Automation by vikrant | handle   | vendor64 | 5ec61d5dc54ca1001a9f0ac0    |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  | size      | color     | material  |             |                    |          |            |                     |
      | Nike              | API Automation by vikrant | handle   | vendor64 | 5ec61d5dc54ca1001a9f0ac0    |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  | size      | color     | material  |             |                    |          |            |                     |
      | Nike              | API Automation by vikrant | handle   | vendor64 | 5ec61d5dc54ca1001a9f0ac0    |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  | size      | color     | material  |             |                    |          |            |                     |
      | Nike              | API Automation by vikrant | handle   | vendor64 | 5ec61d5dc54ca1001a9f0ac0    |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  | size      | color     | material  |             |                    |          |            |                     |
      | Nike              | API Automation by vikrant | handle   | vendor64 | 5ec61d5dc54ca1001a9f0ac0    |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  | size      | color     | material  |             |                    |          |            |                     |
      | Nike              | API Automation by vikrant | handle   | vendor64 | 5ec61d5dc54ca1001a9f0ac0    |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  | size      | color     | material  |             |                    |          |            |                     |
#kartikey say that userid field is not required .............................token is sufficient...






  Scenario Outline: Login with valid registered user details as a vendor and User wants to add a product on marketC for himself
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+61@successive.tech      | 1234567890     |
    Then user should be able to login to the system and store token
    And user enters tag details for new product
      |  |
    And user enter image details for new product
      |  |
    And user enter variant details for new product
      |  |
    And user enter other details for new product
      | title   | description   | handle   | vendor   | vendorId   | collections   | productType   | isTaxable   | price   | comparePrice    | barcode   | inventoryManagement   | sku   | isShipping   | weight   | weightUnit   | fulfillmentService   | option1   | option2   | option3   | markUp   |  discount  | inventoryQuantity   |
      | <title> | <description> | <handle> | <vendor> | <vendorId> | <collections> | <productType> | <isTaxable> | <price> | <comparePrice>  | <barcode> | <inventoryManagement> | <sku> | <isShipping> | <weight> | <weightUnit> | <fulfillmentService> | <option1> | <option2> | <option3> | <markUp> | <discount> | <inventoryQuantity> |
    When user make request to add product on marketcube
    Then user should be able to add product on marketcube
    Examples:
      | title               | description               | handle   | vendor    | vendorId                 | collections   | productType   | isTaxable   | price   | comparePrice | barcode   | inventoryManagement   | sku   | isShipping   | weight   | weightUnit   | fulfillmentService   | option1   | option2   | option3   | markUp   |  discount  | inventoryQuantity   |
      | Nike                | API Automation by vikrant | handle   | vendor61  | 5ea928f2e803eb0013bd256a |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  | size      | color     | material  |           |            |                     |
   # without  "isWebhook"and"shopifyProductId"   field , we  adding product by vendor not given -------------------------




  Scenario Outline: Login with valid registered user details as a System Admin and user wants to add a product on marketcube for vendor
    When User is able to log into application
      | email                                 | password       |
      | systemadmin@marketcube.io             | 12345678n@N    |
    Then user should be able to login to the system and store token
    And user enters tag details for new product
      |  |
    And user enter image details for new product
      |  |
    And user enter variant details for new product
      |  |
    And user enter other details for new product
      | title   | description   | handle   | vendor   | vendorId   | collections   | productType   | isTaxable   | price   | comparePrice    | barcode   | inventoryManagement   | sku   | isShipping   | weight   | weightUnit   | fulfillmentService   | option1   | option2   | option3   | markUp   |  discount  | inventoryQuantity   |
      | <title> | <description> | <handle> | <vendor> | <vendorId> | <collections> | <productType> | <isTaxable> | <price> | <comparePrice>  | <barcode> | <inventoryManagement> | <sku> | <isShipping> | <weight> | <weightUnit> | <fulfillmentService> | <option1> | <option2> | <option3> | <markUp> | <discount> | <inventoryQuantity> |
    When user make request to add product on marketcube
    Then user should be able to add product on marketcube
    Examples:
      | title   | description                    | handle   | vendor   | vendorId                 | collections   | productType   | isTaxable   | price   | comparePrice | barcode   | inventoryManagement   | sku   | isShipping   | weight   | weightUnit   | fulfillmentService   | option1   | option2   | option3   | markUp   |  discount  | inventoryQuantity   |
      | Nike    | API Automation by System Admin | handle   | Vikrant  | 5e2996260da2580011251edb |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           |          |            |                     |
# without  "isWebhook"and"shopifyProductId"   field , we  adding product by system admin work as a vendor not given -------------------------





  Scenario Outline: Login with valid registered user details as a seller and without follow field validation user wants to add a product on marketcube for vendor
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki432    |
    Then user should be able to login to the system and store token
    And user enters tag details for new product
      |  |
    And user enter image details for new product
      |  |
    And user enter variant details for new product
      |  |
    And user enter other details for new product
      | title   | description   | handle   | vendor   | vendorId   | collections   | productType   | isTaxable   | price   | comparePrice    | barcode   | inventoryManagement   | sku   | isShipping   | weight   | weightUnit   | fulfillmentService   | option1   | option2   | option3   | isWebhook   | shopifyProductId   | markUp   |  discount  | inventoryQuantity   |
      | <title> | <description> | <handle> | <vendor> | <vendorId> | <collections> | <productType> | <isTaxable> | <price> | <comparePrice>  | <barcode> | <inventoryManagement> | <sku> | <isShipping> | <weight> | <weightUnit> | <fulfillmentService> | <option1> | <option2> | <option3> | <isWebhook> | <shopifyProductId> | <markUp> | <discount> | <inventoryQuantity> |
    When user make request to add product on marketcube
    Then user should not be able to add product on marketcube and user should get validation error message
      | Title is required.                            |
      | Handle is required.                           |
      | Supplier is required                          |
      | VendorId is required.                         |
      | Invalid supplier provided                     |
      | No special characters except - and _ allowed. |
      | Invalid VendorId provided                     |
      | Invalid VendorId provided                     |
      | Invalid VendorId provided                     |
      | Invalid VendorId provided                     |
    Examples:
      | title   | description               | handle   | vendor   | vendorId                 | collections   | productType   | isTaxable   | price   | comparePrice | barcode   | inventoryManagement   | sku   | isShipping   | weight   | weightUnit   | fulfillmentService   | option1   | option2   | option3   | isWebhook   | shopifyProductId   | markUp   |  discount  | inventoryQuantity   |
      |         | API Automation by vikrant | handle   | Vikrant  | 5e2996260da2580011251edb |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           | true        |                    |          |            |                     |
      | Nike    | API Automation by vikrant |          | Vikrant  | 5e2996260da2580011251edb |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           | true        |                    |          |            |                     |
      | Nike    | API Automation by vikrant | handle   |          | 5e2996260da2580011251edb |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           | true        |                    |          |            |                     |
      | Nike    | API Automation by vikrant | handle   | Vikrant  |                          |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           | true        |                    |          |            |                     |
      | Nike    | API Automation by vikrant | handle   | 33ddddd  | 5e2996260da2580011251edb |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           | true        |                    |          |            |                     |
      | Nike    | API Automation by vikrant | @333f    | Vikrant  | 5e2996260da2580011251edb |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           | true        |                    |          |            |                     |
      | Nike    | API Automation by vikrant | handle   | Vikrant  | aaaaaaaaaaaaaaaaaaaaaaaa |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           | true        |                    |          |            |                     |
      | Nike    | API Automation by vikrant | handle   | Vikrant  | 12345678901234567890123  |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           | true        |                    |          |            |                     |
      | Nike    | API Automation by vikrant | handle   | Vikrant  | 123456789012345678901234 |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           | true        |                    |          |            |                     |
      | Nike    | API Automation by vikrant | handle   | Vikrant  | 1234567890123456789012345|               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           | true        |                    |          |            |                     |






  Scenario Outline: Login with valid registered user details as a vendor and without follow field validation user wants to add a product on marketcube for vendor
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki4321   |
    Then user should be able to login to the system and store token
    And user enters tag details for new product
      |  |
    And user enter image details for new product
      |  |
    And user enter variant details for new product
      |  |
    And user enter other details for new product
      | title   | description   | handle   | vendor   | vendorId   | collections   | productType   | isTaxable   | price   | comparePrice    | barcode   | inventoryManagement   | sku   | isShipping   | weight   | weightUnit   | fulfillmentService   | option1   | option2   | option3   | markUp   |  discount  | inventoryQuantity   |
      | <title> | <description> | <handle> | <vendor> | <vendorId> | <collections> | <productType> | <isTaxable> | <price> | <comparePrice>  | <barcode> | <inventoryManagement> | <sku> | <isShipping> | <weight> | <weightUnit> | <fulfillmentService> | <option1> | <option2> | <option3> | <markUp> | <discount> | <inventoryQuantity> |
    When user make request to add product on marketcube
    Then user should not be able to add product on marketcube and user should get validation error message
      | Title is required.                            |
      | Handle is required.                           |
      | Supplier is required                          |
      | VendorId is required.                         |
      | Invalid supplier provided                     |
      | No special characters except - and _ allowed. |
      | Invalid VendorId provided                     |
      | Invalid VendorId provided                     |
      | Invalid VendorId provided                     |
      | Invalid VendorId provided                     |
    Examples:
      | title   | description               | handle   | vendor   | vendorId                 | collections   | productType   | isTaxable   | price   | comparePrice | barcode   | inventoryManagement   | sku   | isShipping   | weight   | weightUnit   | fulfillmentService   | option1   | option2   | option3   | markUp   |  discount  | inventoryQuantity   |
      |         | API Automation by vikrant | handle   | Vikrant  | 5e2996260da2580011251edb |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           |          |            |                     |
      | Nike    | API Automation by vikrant |          | Vikrant  | 5e2996260da2580011251edb |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           |          |            |                     |
      | Nike    | API Automation by vikrant | handle   |          | 5e2996260da2580011251edb |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           |          |            |                     |
      | Nike    | API Automation by vikrant | handle   | Vikrant  |                          |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           |          |            |                     |
      | Nike    | API Automation by vikrant | handle   | 33ddddd  | 5e2996260da2580011251edb |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           |          |            |                     |
      | Nike    | API Automation by vikrant | @333f    | Vikrant  | 5e2996260da2580011251edb |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           |          |            |                     |
      | Nike    | API Automation by vikrant | handle   | Vikrant  | aaaaaaaaaaaaaaaaaaaaaaaa |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           |          |            |                     |
      | Nike    | API Automation by vikrant | handle   | Vikrant  | 12345678901234567890123  |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           |          |            |                     |
      | Nike    | API Automation by vikrant | handle   | Vikrant  | 123456789012345678901234 |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           |          |            |                     |
      | Nike    | API Automation by vikrant | handle   | Vikrant  | 1234567890123456789012345|               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           |          |            |                     |
# without  "isWebhook"and"shopifyProductId"   field , we  adding product by vendor not given -------------------------


  Scenario Outline: Login with valid registered user details as a seller and user wants to add a product on marketcube for vendor that already exists.
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki432    |
    Then user should be able to login to the system and store token
    And user enters tag details for new product
      |  |
    And user enter image details for new product
      |  |
    And user enter variant details for new product
      |  |
    And user enter other details for new product
      | title   | description   | handle   | vendor   | vendorId   | collections   | productType   | isTaxable   | price   | comparePrice    | barcode   | inventoryManagement   | sku   | isShipping   | weight   | weightUnit   | fulfillmentService   | option1   | option2   | option3   | isWebhook   | shopifyProductId   | markUp   |  discount  | inventoryQuantity   |
      | <title> | <description> | <handle> | <vendor> | <vendorId> | <collections> | <productType> | <isTaxable> | <price> | <comparePrice>  | <barcode> | <inventoryManagement> | <sku> | <isShipping> | <weight> | <weightUnit> | <fulfillmentService> | <option1> | <option2> | <option3> | <isWebhook> | <shopifyProductId> | <markUp> | <discount> | <inventoryQuantity> |
    When user make request to add product on marketcube
    Then user should not be able to add product on marketcube and user should get validation error message
      | Product Already Exists.         |
    Examples:
      | title                | description               | handle                      | vendor   | vendorId                 | collections   | productType   | isTaxable   | price   | comparePrice | barcode   | inventoryManagement   | sku   | isShipping   | weight   | weightUnit   | fulfillmentService   | option1   | option2   | option3   | isWebhook   | shopifyProductId   | markUp   |  discount  | inventoryQuantity   |
      | Realme Buds Wireless | Duplicate product testing | 431897-realme-buds-wireless | Vikrant  | 5e2996260da2580011251edb |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           | true        |                    |          |            |                     |
#kartikey say that userid field is not required .............................token is sufficient...




  Scenario Outline: Login with valid registered user details as a vendor and user wants to add a product on marketcube for vendor that already exists.
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki4321   |
    Then user should be able to login to the system and store token
    And user enters tag details for new product
      |  |
    And user enter image details for new product
      |  |
    And user enter variant details for new product
      |  |
    And user enter other details for new product
      | title   | description   | handle   | vendor   | vendorId   | collections   | productType   | isTaxable   | price   | comparePrice    | barcode   | inventoryManagement   | sku   | isShipping   | weight   | weightUnit   | fulfillmentService   | option1   | option2   | option3   | markUp   |  discount  | inventoryQuantity   |
      | <title> | <description> | <handle> | <vendor> | <vendorId> | <collections> | <productType> | <isTaxable> | <price> | <comparePrice>  | <barcode> | <inventoryManagement> | <sku> | <isShipping> | <weight> | <weightUnit> | <fulfillmentService> | <option1> | <option2> | <option3> | <markUp> | <discount> | <inventoryQuantity> |
    When user make request to add product on marketcube
    Then user should not be able to add product on marketcube and user should get validation error message
      | Product Already Exists.         |
    Examples:
      | title                | description               | handle                      | vendor   | vendorId                 | collections   | productType   | isTaxable   | price   | comparePrice | barcode   | inventoryManagement   | sku   | isShipping   | weight   | weightUnit   | fulfillmentService   | option1   | option2   | option3   | markUp   |  discount  | inventoryQuantity   |
      | Realme Buds Wireless | Duplicate product testing | 431897-realme-buds-wireless | Vikrant  | 5e2996260da2580011251edb |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           |          |            |                     |
# without  "isWebhook"and"shopifyProductId"   field , we  adding product by vendor not given -------------------------





  Scenario Outline: User make a request to add a product on marketcube for vendor with valid field by passing Incorrect/blank token data
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then user should be able to login to the system and store token
    And user enters tag details for new product
      |  |
    And user enter image details for new product
      |  |
    And user enter variant details for new product
      |  |
    And user enter other details for new product
      | title   | description               | handle   | vendor   | vendorId   | userId    | collections   | productType   | isTaxable   | price   | comparePrice    | barcode   | inventoryManagement   | sku   | isShipping   | weight   | weightUnit   | fulfillmentService   | option1   | option2   | option3   | isWebhook   | shopifyProductId   | markUp   |  discount  | inventoryQuantity   |
      | Nike    | API Automation by vikrant | handle   | Vikrant   | 5e2996260da2580011251edb | 5e29912fbfec74a0272e9a92  |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           | true        |                    |          |            |                     |
    When user make request to add product on marketcube with Incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then user should not be able to add product on marketcube and user should get validation error message
      | Invalid token provided          |
      | token is required.              |
    Examples:
      | token                           |
      | sgshhshhshhshshhsh              |
      |                                 |




  Scenario Outline: Login with valid registered user details as a seller and user wants to add a product on marketcube for that vendor who is not associated to it
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+60@successive.tech      | 123456789      |
    Then user should be able to login to the system and store token
    And user enters tag details for new product
      |  |
    And user enter image details for new product
      |  |
    And user enter variant details for new product
      |  |
    And user enter other details for new product
      | title   | description   | handle   | vendor   | vendorId   | collections   | productType   | isTaxable   | price   | comparePrice    | barcode   | inventoryManagement   | sku   | isShipping   | weight   | weightUnit   | fulfillmentService   | option1   | option2   | option3   | isWebhook   | shopifyProductId   | markUp   |  discount  | inventoryQuantity   |
      | <title> | <description> | <handle> | <vendor> | <vendorId> | <collections> | <productType> | <isTaxable> | <price> | <comparePrice>  | <barcode> | <inventoryManagement> | <sku> | <isShipping> | <weight> | <weightUnit> | <fulfillmentService> | <option1> | <option2> | <option3> | <isWebhook> | <shopifyProductId> | <markUp> | <discount> | <inventoryQuantity> |
    When user make request to add product on marketcube
    Then user should not be able to add product on marketcube and user should get validation error message
      | User is not authorized to perform this action.                 |
    Examples:
      | title              | description               | handle   | vendor   | vendorId                 | collections   | productType   | isTaxable   | price   | comparePrice | barcode   | inventoryManagement   | sku   | isShipping   | weight   | weightUnit   | fulfillmentService   | option1   | option2   | option3   | isWebhook   | shopifyProductId   | markUp   |  discount  | inventoryQuantity   |
      | token testing22    | API Automation by vikrant | handle   | Vikrant  | 5e2996260da2580011251edb |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           |             |                    |          |            |                     |
#kartikey say that userid field is not required .............................token is sufficient...




  Scenario Outline: Login with valid registered user details as a vendor and user wants to add a product on marketcube for another vendor
    When User is able to log into application
      | email                                   | password         |
      | vikrant.singh+1857@successive.tech      | 1234567890@H     |
    Then user should be able to login to the system and store token
    And user enters tag details for new product
      |  |
    And user enter image details for new product
      |  |
    And user enter variant details for new product
      |  |
    And user enter other details for new product
      | title   | description   | handle   | vendor   | vendorId   | userId    | collections   | productType   | isTaxable   | price   | comparePrice    | barcode   | inventoryManagement   | sku   | isShipping   | weight   | weightUnit   | fulfillmentService   | option1   | option2   | option3   | markUp   |  discount  | inventoryQuantity   |
      | <title> | <description> | <handle> | <vendor> | <vendorId> | <userId>  | <collections> | <productType> | <isTaxable> | <price> | <comparePrice>  | <barcode> | <inventoryManagement> | <sku> | <isShipping> | <weight> | <weightUnit> | <fulfillmentService> | <option1> | <option2> | <option3> | <markUp> | <discount> | <inventoryQuantity> |
    When user make request to add product on marketcube
    Then user should not be able to add product on marketcube and user should get validation error message
      | User is not authorized to perform this action.                 |
    Examples:
      | title               | description               | handle   | vendor   | vendorId                 | userId                    | collections   | productType   | isTaxable   | price   | comparePrice | barcode   | inventoryManagement   | sku   | isShipping   | weight   | weightUnit   | fulfillmentService   | option1   | option2   | option3   | markUp   |  discount  | inventoryQuantity   |
      | token user testing  | API Automation by vikrant | handle   | Vikrant  | 5e2996260da2580011251edb | 5e2996260da2580011251edb  |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           |          |            |                     |
    # without  "isWebhook"and"shopifyProductId"   field , we  adding product by vendor not given -------------------------












#Api hit by seller on ui
#{"title":"delete product 12",
#"handle":"mc-360128-delete-product-12",
#"vendor":"vendor61",
#"vendorId":"5ea928f2e803eb0013bd256a",
#"inventoryManagement":null,
#"isShipping":true,
#"fulfillmentService":"manual",
#"option1":"size","option2":"color",
#"option3":"material",
#"comparePrice":null,
#"price":null,
#"weight":null,
#"quantity":null}


  #Api hit by vendor on ui
#  {"title":"delete product 61",
#  "handle":"mc-812286-delete-product-61",
#  "vendor":"vendor61",
#  "vendorId":"5ea928f2e803eb0013bd256a",
#  "productType":"",
#  "inventoryManagement":null,
#  "isShipping":false,"weight":null,
#  "fulfillmentService":"manual",
#  "option1":"size",
#  "option2":"color",
#  "option3":"material",
#  "images":[],
#  "quantity":null,
#  "comparePrice":null,
#  "price":null}






