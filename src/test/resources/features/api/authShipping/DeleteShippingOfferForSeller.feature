Feature: API -Auth - Delete shipping offer for seller/vendor--  delete--  /user/shipping-offer

        As a registered user
        I want to delete their own shipping offer

  Scenario Outline: Login with valid registered user details as a seller and user wants to delete their own shipping offer
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then User should be able to login to the system and store token
    When User enters shippingOfferId
      | shippingOfferId    |
      | <shippingOfferId>  |
    Then user make a request to delete shipping offer
    Then User should be able to delete shipping offer
    Examples:
      | shippingOfferId             |
      | 5e86d7247c01350012db9889    |
      | 5e86decbb0c24900133c865e    |
      | 5e86decbb0c24900133c865f    |
      | 5e86df14fccb6f0012a879c4    |
      | 5e86df14fccb6f0012a879c5    |
      | 5e86eaea84ca54001330ed52    |
      | 5e86eb0e84ca54001330ed53    |
      | 5e86eb407c01350012db996f    |
      | 5e86ff3d84ca54001330ed7c    |
      | 5e87259dfccb6f0012a87ab5    |
      | 5e8ac578f67fb6001b04f59b    |
      | 5e8ac5920167b2001a5a50df    |
      | 5e8ac5920167b2001a5a50e0    |
      | 5e8ac5b50167b2001a5a50e9    |
      | 5e8ac5b50167b2001a5a50ea    |
      | 5e8ad4ec410ae40019653179    |



  Scenario Outline: Login with valid registered user details as a vendor and user wants to delete their own shipping offer
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | 1234567890     |
    Then User should be able to login to the system and store token
    When User enters shippingOfferId
      | shippingOfferId    |
      | <shippingOfferId>  |
    Then user make a request to delete shipping offer
    Then User should be able to delete shipping offer
    Examples:
      | shippingOfferId             |
      | 5e849084768bd6001301782a    |
      | 5e849093768bd60013017834    |



#  Scenario Outline: Login with valid registered user details as a System Admin and user wants to delete shipping offer of seller
#    When User is able to log into application
#      | email                                 | password       |
#      | systemadmin@marketcube.io             | 12345678n@N    |
#    Then User should be able to login to the system and store token
#    When User enters shippingOfferId
#      | shippingOfferId    |
#      | <shippingOfferId>  |
#    Then user make a request to delete shipping offer
#    Then User should not be able to delete shipping offer and user should get validation error message
#      |  User is not authorized to perform this action |
#      |  User is not authorized to perform this action |
#    Examples:
#      | shippingOfferId             |
#      | 5e849084768bd6001301782a    |
#      | 5e849093768bd60013017834    |




  Scenario Outline: Login with valid registered user details and without follow field validation user wants to delete shipping offer for seller
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then User should be able to login to the system and store token
    When User enters shippingOfferId
      | shippingOfferId    |
      | <shippingOfferId>  |
    Then user make a request to delete shipping offer
    Then User should not be able to delete shipping offer and user should get validation error message
      | ShippingOfferId is required.                |
      | Invalid ShippingOfferId provided.           |
      | Invalid ShippingOfferId provided.           |
      | Invalid ShippingOfferId  provided.          |
    Examples:
      | shippingOfferId            |
      |                            |
      |  12345678912345678912345   |
      |  123456789123456789123456  |
      |  1234567891234567891234567 |
#Bug Login as a seller and seller wants to delete shipping offer  with greater than 24 characters of shippingOfferId then it will be expected error message as a "Invalid shippingOfferId provided." but in actual scenario it gives error message as a "Cast to ObjectId failed for value \"12345678912345678912345\" at path \"_id\" for model \"ShippingOffer\""
#Bug Login as a seller and seller wants to delete shipping offer  with equal to 24 characters of invalid shippingOfferId  then it will be expected error message as a "Invalid shippingOfferId provided." but in actual scenario it accepts the request ,gives data as true and status ok
#Bug Login as a seller and seller wants to delete shipping offer  with less than 24 characters of shippingOfferId then it will be expected error message as a "Invalid shippingOfferId provided." but in actual scenario it gives error message as a "Cast to ObjectId failed for value \"1234567891234567891234567\" at path \"_id\" for model \"ShippingOffer\""




  Scenario Outline: User make a request to delete shipping offer with valid shippingOfferId field by passing Incorrect/blank token data
    When User enters shippingOfferId
      | shippingOfferId             |
      | 5e849084768bd6001301782a    |
    When user make a request to request to delete shipping offer with Incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then User should not be able to delete shipping offer and user should get validation error message
      | Invalid token provided          |
      | Invalid token provided          |
    Examples:
      | token                           |
      |  sgshhshhshhshshhsh             |
      |                                 |
