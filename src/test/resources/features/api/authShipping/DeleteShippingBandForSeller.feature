Feature: API--  Auth - Delete shipping band for seller -- delete --  /user/shipping-band

         As a registered user
         I want to delete shipping band for seller

  Scenario: Login with valid registered user details as a seller and user wants to delete their own shipping band
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+250@successive.tech     | 123!45@Vik     |
    Then User should be able to login to the system and store token
    When User enters shippingBandId
      | shippingBandId            |
      | 5ef389a28c03b50013a9e4fe  |
    And User make request to delete shipping band
    Then User should be able to delete shipping band

  Scenario: Login with valid registered user details as a vendor and user wants to delete the shipping band of seller
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+251@successive.tech     | 1234@Vik       |
    Then User should be able to login to the system and store token
    When User enters shippingBandId
      | shippingBandId            |
      | 5ef389a28c03b50013a9e4fe  |
    And User make request to delete shipping band
    Then User should not be able to delete shipping band and user should get validation error message
      |  User is not authorized to perform this action |

  Scenario: Login with valid registered user details as a System Admin and user wants to delete the shipping band of seller
    When User is able to log into application
      | email                                 | password       |
      | systemadmin@marketcube.io             | 12345678n@N    |
    Then User should be able to login to the system and store token
    When User enters shippingBandId
      | shippingBandId            |
      | 5e68b22982cded0019f626e6  |
    And User make request to delete shipping band
    Then User should not be able to delete shipping band and user should get validation error message
      |  User is not authorized to perform this action |

  Scenario Outline: Login with valid registered user details as a seller and without follow field validation user wants to delete shipping band for seller
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+250@successive.tech     | 123!45@Vik     |
    Then User should be able to login to the system and store token
    When User enters shippingBandId
      | shippingBandId      |
      | <shippingBandId>    |
    And User make request to delete shipping band
    Then User should not be able to delete shipping band and user should get validation error message
      | ShippingBandId is required.               |
      | Invalid shippingBandId provided.          |
      | Invalid shippingBandId provided.          |
      | Invalid shippingBandId provided.          |
    Examples:
      | shippingBandId             |
      |                            |
      |  12345678912345678912345   |
      |  123456789123456789123456  |
      |  1234567891234567891234567 |
      |  aaaaaaaaaaaaaaaaaaaaaa    |
#Bug Login as a seller and seller wants to delete shipping band  with greater than 24 characters of shippingBandId then it will be expected error message as a "Invalid shippingBandId provided." but in actual scenario it gives error message as a "Cast to ObjectId failed for value \"12345678912345678912345\" at path \"_id\" for model \"ShippingBand\""
#Bug   Login as a seller and seller wants to delete shipping band  with equal to 24 characters of invalid shippingBandId  then it will be expected error message as a "Invalid shippingBandId provided." but in actual scenario it accepts the request ,gives data as true and status ok
#Bug Login as a seller and seller wants to delete shipping band  with less than 24 characters of shippingBandId then it will be expected error message as a "Invalid shippingBandId provided." but in actual scenario it gives error message as a "Cast to ObjectId failed for value \"1234567891234567891234567\" at path \"_id\" for model \"ShippingBand\""

  Scenario Outline: User make a request to delete shipping band with valid shippingBandId field by passing Incorrect/blank token data
    When User enters shippingBandId
      | shippingBandId            |
      | 5e68b22982cded0019f626e6  |
    When User make a request to request to delete shipping band with Incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then User should not be able to delete shipping band and user should get validation error message
      | Invalid token provided          |
      | Token is required.              |
    Examples:
      | token                           |
      |  sgshhshhshhshshhsh             |
      |                                 |

  Scenario: Login with valid registered user details as a seller and user want to delete their own shipping bands again which is already deleted
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+250@successive.tech     | 123!45@Vik     |
    Then User should be able to login to the system and store token
    When User enters shippingBandId
      | shippingBandId            |
      | 5ef389a28c03b50013a9e4fe  |
    And User make request to delete shipping band
    Then User should not be able to delete shipping band and user should get validation error message
      | Invalid shippingBandId provided.          |

  Scenario: Login with valid registered user details as a seller and user wants to delete shipping band of another seller
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh+300@successive.tech     | 123!45@Vik     |
    Then User should be able to login to the system and store token
    When User enters shippingBandId
      | shippingBandId            |
      | 5ef389a48c03b50013a9e501  |
    And User make request to delete shipping band
    Then User should not be able to delete shipping band and user should get validation error message
      | Invalid shippingBandId provided.          |
