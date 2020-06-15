Feature: API-  Product - Update product variant image. -put-  /product/variant/image

  Login as a registered user
  user wants to update product variant image

  Scenario Outline: Login with valid registered user details as a seller and user wants to update their product variant image
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then User should be able to login to the system and store token
    When user enters the details of productId , id and image url
      | productId                          | id        | image   |
      | <productId>                        | <id>      | <image> |
    And user make a request to update product variant image
    Then user should be able to update product variant image
      | 5e65e7fc49300c0e10f1dc4a |
    Examples:
      | productId                        | id      |  image                       |
      | 5e65e7fc009ff500172925a8         | 1       |  https://res.cloudinary.com/marketcube/image/upload/v1583736827/mc/test/product/5e65e7fc009ff500172925a8/lfeodasrsm1bxiu8uk42.jpg    |
      | 5e65e7fc009ff500172925a8         | 2       |  https://res.cloudinary.com/marketcube/image/upload/v1583736827/mc/test/product/5e65e7fc009ff500172925a8/lfeodasrsm1bxiu8uk42.jpg    |
      | 5e65e7fc009ff500172925a8         | 3       |  https://res.cloudinary.com/marketcube/image/upload/v1583736827/mc/test/product/5e65e7fc009ff500172925a8/lfeodasrsm1bxiu8uk42.jpg    |
#seller---5e65e7fc49300c0e10f1dc4a    --"_id" : ObjectId("5e65e7fc49300c0e10f1dc4a") in seller products table
#  vendor---5e65e7fc009ff500172925a8   "_id" : ObjectId("5e65e7fc009ff500172925a8")   in products table.



  Scenario Outline: Login with valid registered user details as a vendor and user wants to update their product variant image
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | 1234567890     |
    Then User should be able to login to the system and store token
    When user enters the details of productId , id and image url
      | productId                          | id        | image   |
      | <productId>                        | <id>      | <image> |
    And user make a request to update product variant image
    Then user should be able to update product variant image
      | 5e65e7fc009ff500172925a8 |
    Examples:
      | productId                        | id      |  image                       |
      | 5e65e7fc009ff500172925a8         | 1       |  https://res.cloudinary.com/marketcube/image/upload/v1583736827/mc/test/product/5e65e7fc009ff500172925a8/lfeodasrsm1bxiu8uk42.jpg    |
      | 5e65e7fc009ff500172925a8         | 2       |  https://res.cloudinary.com/marketcube/image/upload/v1583736827/mc/test/product/5e65e7fc009ff500172925a8/lfeodasrsm1bxiu8uk42.jpg    |
      | 5e65e7fc009ff500172925a8         | 3       |  https://res.cloudinary.com/marketcube/image/upload/v1583736827/mc/test/product/5e65e7fc009ff500172925a8/lfeodasrsm1bxiu8uk42.jpg    |



#  Scenario Outline: Login with valid registered user details as a System Admin and user wants to update product variant image of vendor
#    When User is able to log into application
#      | email                                 | password       |
#      | systemadmin@marketcube.io             | 12345678n@N    |
#    Then User should be able to login to the system and store token
#    When user enters the details of productId , id and image url
#      | productId                          | id        | image   |
#      | <productId>                        | <id>      | <image> |
#    And user make a request to update product variant image
#    Then user should be able to update product variant image
#      | 5e65e7fc009ff500172925a8 |
#    Examples:
#      | productId                        | id      |  image                       |
#      | 5e65e7fc009ff500172925a8         | 1       |  https://res.cloudinary.com/marketcube/image/upload/v1583736827/mc/test/product/5e65e7fc009ff500172925a8/lfeodasrsm1bxiu8uk42.jpg    |
#      | 5e65e7fc009ff500172925a8         | 2       |  https://res.cloudinary.com/marketcube/image/upload/v1583736827/mc/test/product/5e65e7fc009ff500172925a8/lfeodasrsm1bxiu8uk42.jpg    |
#      | 5e65e7fc009ff500172925a8         | 3       |  https://res.cloudinary.com/marketcube/image/upload/v1583736827/mc/test/product/5e65e7fc009ff500172925a8/lfeodasrsm1bxiu8uk42.jpg    |
#      | 5e65e7fc009ff500172925a8         | 4       |  https://res.cloudinary.com/marketcube/image/upload/v1583736827/mc/test/product/5e65e7fc009ff500172925a8/lfeodasrsm1bxiu8uk42.jpg    |



#  Scenario Outline: Login with valid registered user details as a System Admin and user wants to update product variant image of seller
#    When User is able to log into application
#      | email                                 | password       |
#      | systemadmin@marketcube.io             | 12345678n@N    |
#    Then User should be able to login to the system and store token
#    When user enters the details of productId , id and image url
#      | productId                         | seller     | id        | image   |
#      | <productId>                       | <seller>   | <id>      | <image> |
#    And user make a request to update product variant image
#    Then user should be able to update product variant image
#      | 5e65e7fc49300c0e10f1dc4a |
#    Examples:
#      | productId                       | seller                    | id      |  image                       |
#      | 5e65e7fc009ff500172925a8        | 5e29912fbfec74a0272e9a92  | 1       |  https://res.cloudinary.com/marketcube/image/upload/v1583736827/mc/test/product/5e65e7fc009ff500172925a8/lfeodasrsm1bxiu8uk42.jpg    |
#      | 5e65e7fc009ff500172925a8        | 5e29912fbfec74a0272e9a92  | 2       |  https://res.cloudinary.com/marketcube/image/upload/v1583736827/mc/test/product/5e65e7fc009ff500172925a8/lfeodasrsm1bxiu8uk42.jpg    |
#      | 5e65e7fc009ff500172925a8        | 5e29912fbfec74a0272e9a92  | 3       |  https://res.cloudinary.com/marketcube/image/upload/v1583736827/mc/test/product/5e65e7fc009ff500172925a8/lfeodasrsm1bxiu8uk42.jpg    |
#      | 5e65e7fc009ff500172925a8        | 5e29912fbfec74a0272e9a92  | 4       |  https://res.cloudinary.com/marketcube/image/upload/v1583736827/mc/test/product/5e65e7fc009ff500172925a8/lfeodasrsm1bxiu8uk42.jpg    |




  Scenario Outline: Login with valid registered user details as a seller and without follow field validation user wants to update their product variant image
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then User should be able to login to the system and store token
    When user enters the details of productId , id and image url
      | productId                          | id        | image   |
      | <productId>                        | <id>      | <image> |
    And user make a request to update product variant image
    Then user should not be able to update product variant image and user should get validation error message
      | ProductId is required.                |
      | Id is required.                       |
      | Image is required.                    |
      | Invalid data provided                 |
      | Invalid data provided                 |
      | Invalid data provided                 |
      | Invalid data provided                 |
      | Invalid data provided                 |
    Examples:
      | productId                        | id      |  image                       |
      |                                  | 1       |  https://res.cloudinary.com/marketcube/image/upload/v1583736827/mc/test/product/5e65e7fc009ff500172925a8/lfeodasrsm1bxiu8uk42.jpg    |
      | 5e65e7fc009ff500172925a8         |         |  https://res.cloudinary.com/marketcube/image/upload/v1583736827/mc/test/product/5e65e7fc009ff500172925a8/lfeodasrsm1bxiu8uk42.jpg    |
      | 5e65e7fc009ff500172925a8         | 3       |                              |
      | 123456789012345678901234         | 3       |  https://res.cloudinary.com/marketcube/image/upload/v1583736827/mc/test/product/5e65e7fc009ff500172925a8/lfeodasrsm1bxiu8uk42.jpg    |
      | 12345678901234567890123          | 3       |  https://res.cloudinary.com/marketcube/image/upload/v1583736827/mc/test/product/5e65e7fc009ff500172925a8/lfeodasrsm1bxiu8uk42.jpg    |
      | 1234567890123456789012345        | 3       |  https://res.cloudinary.com/marketcube/image/upload/v1583736827/mc/test/product/5e65e7fc009ff500172925a8/lfeodasrsm1bxiu8uk42.jpg    |
      | 5e65e7fc009ff500172925a8         | 5       |  https://res.cloudinary.com/marketcube/image/upload/v1583736827/mc/test/product/5e65e7fc009ff500172925a8/lfeodasrsm1bxiu8uk42.jpg    |
      | 5e65e7fc009ff500172925a8         | 3       |  123456789012345678901234    |
#bug -----| Invalid data provided                 |  for invalid image



  Scenario Outline: User make a request to update the product variant image with valid field by passing Incorrect/blank token data
    When user enters the details of productId , id and image url
      | productId                          | id        | image   |
      | 5e65e7fc009ff500172925a8           | 1         |  https://res.cloudinary.com/marketcube/image/upload/v1583736827/mc/test/product/5e65e7fc009ff500172925a8/lfeodasrsm1bxiu8uk42.jpg    |
    When User make a request to update the product variant image with Incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then user should not be able to update product variant image and user should get validation error message
      | Invalid token provided          |
      | Invalid token provided          |
    Examples:
      | token                           |
      |  sgshhshhshhshshhsh             |
      |                                 |