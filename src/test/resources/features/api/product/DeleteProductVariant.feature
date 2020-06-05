Feature: API-  Product - Delete Product Variant.- delete-  /product/variant

        Login as a registered user
        user wants to delete the variant of product

  Scenario Outline: Login with valid registered user details as a seller and user wants to delete the variant of product
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then user should be able to login to the system and store token
    When user enters the details of productId , id and sellerid
      | productId                          | id        | seller   |
      | <productId>                        | <id>      | <seller> |
    And User make a request to delete the variant of product
    Then user should be able to delete the variant of product
      | 5e65e7fc49300c0e10f1dc4a |
    Examples:
      | productId                        | id      | seller                       |
      | 5e65e7fc009ff500172925a8         | 8       |  5e29912fbfec74a0272e9a92    |
      | 5e65e7fc009ff500172925a8         | 7       |  5e29912fbfec74a0272e9a92    |
      | 5e65e7fc009ff500172925a8         | 6       |  5e29912fbfec74a0272e9a92    |
      | 5e65e7fc009ff500172925a8         | 5       |  5e29912fbfec74a0272e9a92    |
      | 5e65e7fc009ff500172925a8         | 4       |  5e29912fbfec74a0272e9a92    |
      | 5e65e7fc009ff500172925a8         | 3       |  5e29912fbfec74a0272e9a92    |
      | 5e65e7fc009ff500172925a8         | 2       |  5e29912fbfec74a0272e9a92    |
      | 5e65e7fc009ff500172925a8         | 1       |  5e29912fbfec74a0272e9a92    |


#take product id  as "productId" : "5e65e7fc009ff500172925a8",  from sellerProducts table and id as indexing
# By testing ---1-sellerid is mandatory ,means without sellerid unable to delete the seller products variants
# By testing ---2-indexing follow from 3,2,1.....and so on "lastVariantPosition" : 2, in deletion of product variant by vendor
#suppose "lastVariantPosition" : 3, then "position" : 1 for first variant ,"position" : 2 for second variant,"position" : 3 for third variant,
#  if you give id=2 in delete variant,then second variant deleted and third variant come on place of second variant

  Scenario Outline: Login with valid registered user details as a vendor and user wants to delete the variant of product
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | 1234567890     |
    Then user should be able to login to the system and store token
    When user enters the details of productId , id and sellerid
      | productId                          | id        | vendor   |
      | <productId>                        | <id>      | <vendor> |
    And User make a request to delete the variant of product
    Then user should be able to delete the variant of product
      | 5e65e7fc009ff500172925a8 |
    Examples:
      | productId                        | id      |  vendor                      |
      | 5e65e7fc009ff500172925a8         | 4       |  5e2996260da2580011251edb    |
      | 5e65e7fc009ff500172925a8         | 3       |  5e2996260da2580011251edb    |
      | 5e65e7fc009ff500172925a8         | 2       |  5e2996260da2580011251edb    |
      | 5e65e7fc009ff500172925a8         | 1       |  5e2996260da2580011251edb    |
#take product id  as "_id" : ObjectId("5e65e7fc009ff500172925a8") in products table,  from sellerProducts table and id as indexing
# By testing ---1-vendorid is not mandatory ,means without vendorid its delete the vendor products variants
# By testing ---2-indexing follow from 3,2,1.....and so on "lastVariantPosition" : 2, in deletion of product variant by vendor
#suppose "lastVariantPosition" : 3, then "position" : 1 for first variant ,"position" : 2 for second variant,"position" : 3 for third variant,
#  if you give id=2 in delete variant,then second variant deleted and third variant come on place of second variant


  Scenario Outline: Login with valid registered user details as a System Admin and user wants to delete the product variant of vendor
    When User is able to log into application
      | email                                 | password       |
      | systemadmin@marketcube.io             | 12345678n@N    |
    Then user should be able to login to the system and store token
    When user enters the details of productId , id and sellerid
      | productId                          | id        | vendor   |
      | <productId>                        | <id>      | <vendor> |
    And User make a request to delete the variant of product
    Then user should be able to delete the variant of product
      | 5e65e7fc009ff500172925a8 |
    Examples:
      | productId                        | id      |  vendor                      |
      | 5e65e7fc009ff500172925a8         | 4       |  5e2996260da2580011251edb    |
      | 5e65e7fc009ff500172925a8         | 3       |  5e2996260da2580011251edb    |
      | 5e65e7fc009ff500172925a8         | 2       |  5e2996260da2580011251edb    |
      | 5e65e7fc009ff500172925a8         | 1       |  5e2996260da2580011251edb    |



  Scenario Outline: Login with valid registered user details as a System Admin and user wants to delete the product variant of seller
    When User is able to log into application
      | email                                 | password       |
      | systemadmin@marketcube.io             | 12345678n@N    |
    Then user should be able to login to the system and store token
    When user enters the details of productId , id and sellerid
      | productId                          | id        | seller   |
      | <productId>                        | <id>      | <seller> |
    And User make a request to delete the variant of product
    Then user should be able to delete the variant of product
      | 5e65e7fc49300c0e10f1dc4a |
    Examples:
      | productId                        | id      | seller                       |
      | 5e65e7fc009ff500172925a8         | 3       |  5e29912fbfec74a0272e9a92    |
      | 5e65e7fc009ff500172925a8         | 2       |  5e29912fbfec74a0272e9a92    |
      | 5e65e7fc009ff500172925a8         | 1       |  5e29912fbfec74a0272e9a92    |





  Scenario Outline: Login with valid registered user details as a seller and without follow field validation user wants to delete the variant of product
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then user should be able to login to the system and store token
    When user enters the details of productId , id and sellerid
      | productId                          | id        | seller   |
      | <productId>                        | <id>      | <seller> |
    And User make a request to delete the variant of product
    Then user should not be able to delete the product variant and user should get validation error message
      | ProductId is required.                |
      | Id is required.                       |
      | Invalid data provided                 |
      | sellerid is required.                 |
      | Invalid data provided                 |
    Examples:
      | productId                        | id      | seller                       |
      |                                  | 1       |  5e29912fbfec74a0272e9a92    |
      | 5e65e7fc009ff500172925a8         |         |  5e29912fbfec74a0272e9a92    |
      | 123456789012345678901234         | 3       |  5e29912fbfec74a0272e9a92    |
      | 5e65e7fc009ff500172925a8         | 1       |                              |
      | 5e65e7fc009ff500172925a8         | 1       | 123456789012345678901234     |




  Scenario Outline: Login with valid registered user details as a vendor and without follow field validation user wants to delete the variant of product
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | 1234567890     |
    Then user should be able to login to the system and store token
    When user enters the details of productId , id and sellerid
      | productId                          | id        | vendor   |
      | <productId>                        | <id>      | <vendor> |
    And User make a request to delete the variant of product
    Then user should not be able to delete the product variant and user should get validation error message
      | ProductId is required.                |
      | Id is required.                       |
      | Invalid data provided                 |
      | vendorId is required.                 |
      | Invalid data provided                 |
    Examples:
      | productId                        | id      |  vendor                      |
      |                                  | 1       |  5e2996260da2580011251edb    |
      | 5e65e7fc009ff500172925a8         |         |  5e2996260da2580011251edb    |
      | 123456789012345678901234         | 3       |  5e2996260da2580011251edb    |
      | 5e65e7fc009ff500172925a8         | 1       |                              |
      | 5e65e7fc009ff500172925a8         | 1       |  123456789012345678901234    |



  Scenario Outline: User make a request to delete the variant of product with valid productId,id and sellerId field by passing Incorrect/blank token data
    When user enters the details of productId , id and sellerid
      | productId                          | id        | seller                       |
      | 5e65e7fc009ff500172925a8           | 1         |  5e29912fbfec74a0272e9a92    |
    When User make a request to delete the variant of product with Incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then user should not be able to delete the product variant and user should get validation error message
      | Invalid token provided          |
      | Invalid token provided          |
    Examples:
      | token                           |
      |  sgshhshhshhshshhsh             |
      |                                 |
