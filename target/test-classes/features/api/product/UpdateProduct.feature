Feature: API -  Product - Update Product.  put  /product

         As a seller user
         I want to Update a product on marketcube

         As a vendor user
         I want to Update a product on marketcube


  Scenario Outline: Login with valid registered user details as a seller and user wants to Update a product on marketcube for vendor
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki432    |
    Then User should be able to login to the system and store token
    And user enters tag details for Update product
      |  |
    And user enter image details for Update product
      |  |
    And user enter variant details for Update product
      |  |
    And user enter other details for Update product
      | id    | title   | description   | handle   | vendor   | vendorId   | collections   | productType   | isTaxable   | price   | comparePrice    | barcode   | inventoryManagement   | sku   | isShipping   | weight   | weightUnit   | fulfillmentService   | option1   | option2   | option3   | isWebhook   | shopifyProductId   | markUp   |  discount  | inventoryQuantity   |
      | <id>  | <title> | <description> | <handle> | <vendor> | <vendorId> | <collections> | <productType> | <isTaxable> | <price> | <comparePrice>  | <barcode> | <inventoryManagement> | <sku> | <isShipping> | <weight> | <weightUnit> | <fulfillmentService> | <option1> | <option2> | <option3> | <isWebhook> | <shopifyProductId> | <markUp> | <discount> | <inventoryQuantity> |
    When user make request to Update product on marketcube
    Then user should be able to Update product on marketcube
    Examples:
      | id                       | title   | description               | handle   | vendor   | vendorId                   | collections   | productType   | isTaxable   | price   | comparePrice | barcode   | inventoryManagement   | sku   | isShipping   | weight   | weightUnit   | fulfillmentService   | option1   | option2   | option3   | isWebhook   | shopifyProductId   | markUp   |  discount  | inventoryQuantity   |
      | 5e99619a87858600122a449d | Nike    | API Automation by vikrant | handle   | Vikrant  | 5e2996260da2580011251edb   |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           | true        |                    |          |            |                     |
#kartikey say that userid field is not required .............................token is sufficient...
#if iswebhook =true ---then approved status at vendor side ....




  Scenario Outline: Login with valid registered user details as a vendor and user wants to Update a product on marketcube for vendor
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki4321   |
    Then User should be able to login to the system and store token
    And user enters tag details for Update product
      |  |
    And user enter image details for Update product
      |  |
    And user enter variant details for Update product
      |  |
    And user enter other details for Update product
      | id     | title   | description   | handle   | vendor   | vendorId  | collections   | productType   | isTaxable   | price   | comparePrice    | barcode   | inventoryManagement   | sku   | isShipping   | weight   | weightUnit   | fulfillmentService   | option1   | option2   | option3   | markUp   |  discount  | inventoryQuantity   |
      | <id>  | <title> | <description> | <handle>  | <vendor> | <vendorId> | <collections> | <productType> | <isTaxable> | <price> | <comparePrice>  | <barcode> | <inventoryManagement> | <sku> | <isShipping> | <weight> | <weightUnit> | <fulfillmentService> | <option1> | <option2> | <option3> | <markUp> | <discount> | <inventoryQuantity> |
    When user make request to Update product on marketcube
    Then user should be able to Update product on marketcube
    Examples:
      | id                       | title   | description               | handle   | vendor   | vendorId                 | collections   | productType   | isTaxable   | price   | comparePrice | barcode   | inventoryManagement   | sku   | isShipping   | weight   | weightUnit   | fulfillmentService   | option1   | option2   | option3   | markUp   |  discount  | inventoryQuantity   |
      | 5e99619a87858600122a449d | Nike    | API Automation by vikrant | handle   | Vikrant  | 5e2996260da2580011251edb |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           |          |            |                     |
# without  "isWebhook"and"shopifyProductId"   field , we  adding product by vendor not given -------------------------





#  Scenario Outline: Login with valid registered user details as a System Admin and user wants to Update a product on marketcube for vendor
#    When User is able to log into application
#      | email                                 | password       |
#      | systemadmin@marketcube.io             | 12345678n@N    |
#    Then User should be able to login to the system and store token
#    And user enters tag details for Update product
#      |  |
#    And user enter image details for Update product
#      |  |
#    And user enter variant details for Update product
#      |  |
#    And user enter other details for Update product
#      | id     | title   | description   | handle   | vendor   | vendorId  | collections   | productType   | isTaxable   | price   | comparePrice    | barcode   | inventoryManagement   | sku   | isShipping   | weight   | weightUnit   | fulfillmentService   | option1   | option2   | option3   | markUp   |  discount  | inventoryQuantity   |
#      | <id>  | <title> | <description> | <handle> | <vendor> | <vendorId> | <collections> | <productType> | <isTaxable> | <price> | <comparePrice>  | <barcode> | <inventoryManagement> | <sku> | <isShipping> | <weight> | <weightUnit> | <fulfillmentService> | <option1> | <option2> | <option3> | <markUp> | <discount> | <inventoryQuantity> |
#    When user make request to Update product on marketcube
#    Then user should be able to Update product on marketcube
#    Examples:
#      | id                       | title   | description               | handle   | vendor   | vendorId                 | collections   | productType   | isTaxable   | price   | comparePrice | barcode   | inventoryManagement   | sku   | isShipping   | weight   | weightUnit   | fulfillmentService   | option1   | option2   | option3   | markUp   |  discount  | inventoryQuantity   |
#      | 5e99619a87858600122a449d | Nike    | API Automation by vikrant | handle   | Vikrant  | 5e2996260da2580011251edb |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           |          |            |                     |
## without  "isWebhook"and"shopifyProductId"   field , we  adding product by system admin work as a vendor not given -------------------------





  Scenario Outline: Login with valid registered user details as a seller and without follow field validation user wants to Update a product on marketcube for vendor
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki432    |
    Then User should be able to login to the system and store token
    And user enters tag details for Update product
      |  |
    And user enter image details for Update product
      |  |
    And user enter variant details for Update product
      |  |
    And user enter other details for Update product
      | id    | title   | description   | handle   | vendor   | vendorId   | collections   | productType   | isTaxable   | price   | comparePrice    | barcode   | inventoryManagement   | sku   | isShipping   | weight   | weightUnit   | fulfillmentService   | option1   | option2   | option3   | isWebhook   | shopifyProductId   | markUp   |  discount  | inventoryQuantity   |
      | <id>  | <title> | <description> | <handle> | <vendor> | <vendorId> | <collections> | <productType> | <isTaxable> | <price> | <comparePrice>  | <barcode> | <inventoryManagement> | <sku> | <isShipping> | <weight> | <weightUnit> | <fulfillmentService> | <option1> | <option2> | <option3> | <isWebhook> | <shopifyProductId> | <markUp> | <discount> | <inventoryQuantity> |
    When user make request to Update product on marketcube
    Then user should not be able to Update product on marketcube and user should get validation error message
      | productId is required.                        |
      | Invalid Product provided, Not found.          |
      | Invalid Product provided, Not found.          |
      | Invalid Product provided, Not found.          |
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
      | id                        | title   | description               | handle   | vendor   | vendorId                 | collections   | productType   | isTaxable   | price   | comparePrice | barcode   | inventoryManagement   | sku   | isShipping   | weight   | weightUnit   | fulfillmentService   | option1   | option2   | option3   | isWebhook   | shopifyProductId   | markUp   |  discount  | inventoryQuantity   |
      |                           | Nike    | API Automation by vikrant | handle   | Vikrant  | 5e2996260da2580011251edb |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           | true        |                    |          |            |                     |
      | 12345678901234567890123   | Nike    | API Automation by vikrant | handle   | Vikrant  | 5e2996260da2580011251edb |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           | true        |                    |          |            |                     |
      | 123456789012345678901234  | Nike    | API Automation by vikrant | handle   | Vikrant  | 5e2996260da2580011251edb |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           | true        |                    |          |            |                     |
      | 1234567890123456789012345 | Nike    | API Automation by vikrant | handle   | Vikrant  | 5e2996260da2580011251edb |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           | true        |                    |          |            |                     |
      | 5e99619a87858600122a449d  |         | API Automation by vikrant | handle   | Vikrant  | 5e2996260da2580011251edb |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           | true        |                    |          |            |                     |
      | 5e99619a87858600122a449d  | Nike    | API Automation by vikrant |          | Vikrant  | 5e2996260da2580011251edb |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           | true        |                    |          |            |                     |
      | 5e99619a87858600122a449d  | Nike    | API Automation by vikrant | handle   |          | 5e2996260da2580011251edb |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           | true        |                    |          |            |                     |
      | 5e99619a87858600122a449d  | Nike    | API Automation by vikrant | handle   | Vikrant  |                          |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           | true        |                    |          |            |                     |
      | 5e99619a87858600122a449d  | Nike    | API Automation by vikrant | handle   | 33ddddd  | 5e2996260da2580011251edb |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           | true        |                    |          |            |                     |
      | 5e99619a87858600122a449d  | Nike    | API Automation by vikrant | @333f    | Vikrant  | 5e2996260da2580011251edb |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           | true        |                    |          |            |                     |
      | 5e99619a87858600122a449d  | Nike    | API Automation by vikrant | handle   | Vikrant  | 12345678901234567890123  |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           | true        |                    |          |            |                     |
      | 5e99619a87858600122a449d  | Nike    | API Automation by vikrant | handle   | Vikrant  | 123456789012345678901234 |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           | true        |                    |          |            |                     |
      | 5e99619a87858600122a449d  | Nike    | API Automation by vikrant | handle   | Vikrant  | 1234567890123456789012345|               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           | true        |                    |          |            |                     |
      | 5e99619a87858600122a449d  | Nike    | API Automation by vikrant | handle   | Vikrant  | aaaaaaaaaaaaaaaaaaaaaaaa |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           | true        |                    |          |            |                     |



  Scenario Outline: Login with valid registered user details as a vendor and without follow field validation user wants to Update a product on marketcube for vendor
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | 1234567890     |
    Then User should be able to login to the system and store token
    And user enters tag details for Update product
      |  |
    And user enter image details for Update product
      |  |
    And user enter variant details for Update product
      |  |
    And user enter other details for Update product
      | id    | title   | description   | handle   | vendor   | vendorId   | collections   | productType   | isTaxable   | price   | comparePrice    | barcode   | inventoryManagement   | sku   | isShipping   | weight   | weightUnit   | fulfillmentService   | option1   | option2   | option3   | markUp   |  discount  | inventoryQuantity   |
      | <id>  | <title> | <description> | <handle> | <vendor> | <vendorId> | <collections> | <productType> | <isTaxable> | <price> | <comparePrice>  | <barcode> | <inventoryManagement> | <sku> | <isShipping> | <weight> | <weightUnit> | <fulfillmentService> | <option1> | <option2> | <option3> | <markUp> | <discount> | <inventoryQuantity> |
    When user make request to Update product on marketcube
    Then user should not be able to Update product on marketcube and user should get validation error message
      | productId is required.                        |
      | Invalid Product provided, Not found.          |
      | Invalid Product provided, Not found.          |
      | Invalid Product provided, Not found.          |
      | Title is required.                            |
      | Handle is required.                           |
      | Supplier is required                          |
      | VendorId is required.                         |
      | Invalid supplier provided                     |
      | No special characters except - and _ allowed. |
      | Invalid VendorId provided                     |
      | Invalid VendorId provided                     |
      | Invalid VendorId provided                     |
    Examples:
      | id                       | title   | description               | handle   | vendor   | vendorId                 | collections   | productType   | isTaxable   | price   | comparePrice | barcode   | inventoryManagement   | sku   | isShipping   | weight   | weightUnit   | fulfillmentService   | option1   | option2   | option3   | markUp   |  discount  | inventoryQuantity   |
      |                          | Nike    | API Automation by vikrant | handle   | Vikrant  | 5e2996260da2580011251edb |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           |          |            |                     |
      | 12345678901234567890123  | Nike    | API Automation by vikrant | handle   | Vikrant  | 5e2996260da2580011251edb |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           |          |            |                     |
      | 123456789012345678901234 | Nike    | API Automation by vikrant | handle   | Vikrant  | 5e2996260da2580011251edb |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           |          |            |                     |
      | 1234567890123456789012345| Nike    | API Automation by vikrant | handle   | Vikrant  | 5e2996260da2580011251edb |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           |          |            |                     |
      | 5e99619a87858600122a449d |         | API Automation by vikrant | handle   | Vikrant  | 5e2996260da2580011251edb |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           |          |            |                     |
      | 5e99619a87858600122a449d | Nike    | API Automation by vikrant |          | Vikrant  | 5e2996260da2580011251edb |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           |          |            |                     |
      | 5e99619a87858600122a449d | Nike    | API Automation by vikrant | handle   |          | 5e2996260da2580011251edb |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           |          |            |                     |
      | 5e99619a87858600122a449d | Nike    | API Automation by vikrant | handle   | Vikrant  |                          |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           |          |            |                     |
      | 5e99619a87858600122a449d | Nike    | API Automation by vikrant | handle   | 33ddddd  | 5e2996260da2580011251edb |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           |          |            |                     |
      | 5e99619a87858600122a449d | Nike    | API Automation by vikrant | @333f    | Vikrant  | 5e2996260da2580011251edb |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           |          |            |                     |
      | 5e99619a87858600122a449d | Nike    | API Automation by vikrant | handle   | Vikrant  | 12345678901234567890123  |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           |          |            |                     |
      | 5e99619a87858600122a449d | Nike    | API Automation by vikrant | handle   | Vikrant  | 123456789012345678901234 |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           |          |            |                     |
      | 5e99619a87858600122a449d | Nike    | API Automation by vikrant | handle   | Vikrant  | 1234567890123456789012345|               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           |          |            |                     |
# without  "isWebhook"and"shopifyProductId"   field , we  adding product by vendor not given -------------------------




  Scenario Outline: User make a request to Update a product on marketcube for vendor with valid field by passing Incorrect/blank token data
    And user enters tag details for Update product
      |  |
    And user enter image details for Update product
      |  |
    And user enter variant details for Update product
      |  |
    And user enter other details for Update product
      | id                       | title   | description   | handle   | vendor   | vendorId   | userId    | collections   | productType   | isTaxable   | price   | comparePrice    | barcode   | inventoryManagement   | sku   | isShipping   | weight   | weightUnit   | fulfillmentService   | option1   | option2   | option3   | isWebhook   | shopifyProductId   | markUp   |  discount  | inventoryQuantity   |
      | 5e99619a87858600122a449d | Nike    | API Automation by vikrant | handle   | Vikrant  | 5e2996260da2580011251edb | 5e29912fbfec74a0272e9a92  |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           | true        |                    |          |            |                     |
    When user make request to Update product on marketcube with Incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then user should not be able to Update product on marketcube and user should get validation error message
      | Invalid token provided          |
      | token is required.              |
    Examples:
      | token                           |
      | sgshhshhshhshshhsh              |
      |                                 |







  Scenario Outline: Login with valid registered user details as a seller and user wants to Update a product on marketcube for that vendor who is not associated to it
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+60@successive.tech      | 123456789      |
    Then User should be able to login to the system and store token
    And user enters tag details for Update product
      |  |
    And user enter image details for Update product
      |  |
    And user enter variant details for Update product
      |  |
    And user enter other details for Update product
      | id    | title   | description   | handle   | vendor   | vendorId   | collections   | productType   | isTaxable   | price   | comparePrice    | barcode   | inventoryManagement   | sku   | isShipping   | weight   | weightUnit   | fulfillmentService   | option1   | option2   | option3   | isWebhook   | shopifyProductId   | markUp   |  discount  | inventoryQuantity   |
      | <id>  | <title> | <description> | <handle> | <vendor> | <vendorId> | <collections> | <productType> | <isTaxable> | <price> | <comparePrice>  | <barcode> | <inventoryManagement> | <sku> | <isShipping> | <weight> | <weightUnit> | <fulfillmentService> | <option1> | <option2> | <option3> | <isWebhook> | <shopifyProductId> | <markUp> | <discount> | <inventoryQuantity> |
    When user make request to Update product on marketcube
    Then user should not be able to Update product on marketcube and user should get validation error message
      | User is not authorized to perform this action.                 |
    Examples:
      | id                       | title   | description               | handle   | vendor   | vendorId                 | collections   | productType   | isTaxable   | price   | comparePrice | barcode   | inventoryManagement   | sku   | isShipping   | weight   | weightUnit   | fulfillmentService   | option1   | option2   | option3   | isWebhook   | shopifyProductId   | markUp   |  discount  | inventoryQuantity   |
      | 5e99619a87858600122a449d | Nike    | API Automation by vikrant | handle   | Vikrant  | 5e2996260da2580011251edb |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           | true        |                    |          |            |                     |
#kartikey say that userid field is not required .............................token is sufficient...




  Scenario Outline: Login with valid registered user details as a vendor and user wants to Update a product on marketcube for another vendor
    When User is able to log into application
      | email                                   | password         |
      | vikrant.singh+1857@successive.tech      | 1234567890@H     |
    Then User should be able to login to the system and store token
    And user enters tag details for Update product
      |  |
    And user enter image details for Update product
      |  |
    And user enter variant details for Update product
      |  |
    And user enter other details for Update product
      | id     | title   | description   | handle   | vendor   | vendorId   | collections   | productType   | isTaxable   | price   | comparePrice    | barcode   | inventoryManagement   | sku   | isShipping   | weight   | weightUnit   | fulfillmentService   | option1   | option2   | option3   | markUp   |  discount  | inventoryQuantity   |
      | <id>  | <title> | <description> | <handle> | <vendor> | <vendorId>  | <collections> | <productType> | <isTaxable> | <price> | <comparePrice>  | <barcode> | <inventoryManagement> | <sku> | <isShipping> | <weight> | <weightUnit> | <fulfillmentService> | <option1> | <option2> | <option3> | <markUp> | <discount> | <inventoryQuantity> |
    When user make request to Update product on marketcube
    Then user should not be able to Update product on marketcube and user should get validation error message
      | User is not authorized to perform this action.                 |
    Examples:
      | id                       | title           | description               | handle   | vendor   | vendorId                 | collections   | productType   | isTaxable   | price   | comparePrice | barcode   | inventoryManagement   | sku   | isShipping   | weight   | weightUnit   | fulfillmentService   | option1   | option2   | option3   | markUp   |  discount  | inventoryQuantity   |
      | 5e9ed2c4d1d53c00180cd857 | token testing3  | API Automation by vikrant | handle   | Vikrant  | 5e2996260da2580011251edb  |               |               |             | 12      | 12           |           |                       | 12    |   true       | 12       | kg           | yes                  |           |           |           |          |            |                     |
# without  "isWebhook"and"shopifyProductId"   field , we  adding product by vendor not given -------------------------





















