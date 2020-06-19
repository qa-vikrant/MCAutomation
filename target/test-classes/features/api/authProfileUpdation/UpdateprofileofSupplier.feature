Feature: Api- (Update profile of Supplier / Seller /SystemAdmin)------ put--  /user/profile

        As a Supplier / Seller /SystemAdmin
        User wants to change the profile of Vendor

  Scenario: User login as a seller with valid registered details and update the profile of their associated vendor
    When User is able to log into application
      | email                         | password    |
      | vikrant.singh@successive.tech | HaiVikki432 |
    Then User should be able to login to the system and store token
    And user enters profile details for update vendor profile
    | brandName        | firstName   | lastName   | phoneNumber  | email                           | id                          | address             | city       | country     | pinCode     | commision   | commisionType  | logo  | profile |  editedBy  |
    | vikrant_Vendor   | Bigger      | B deal     | 12221212     | vikrant.singh@successive.tech   |  5e2996260da2580011251edb   | delhi1              | delhi2     | India       | 110090      |  12         |                |       | true    |   Seller   |
    And user make a request to update the profile of their associated Vendor
    Then user should be able to update the vendor profile successfully



  Scenario: User login as a Vendor with valid registered details and update the profile of their associated vendor
    When User is able to log into application
      | email                         | password   |
      | vikrant.singh@successive.tech | 1234567890 |
    Then User should be able to login to the system and store token
    And user enters profile details for update vendor profile
      | brandName     | firstName   | lastName   | phoneNumber  | email                           | id                          | address             | city       | country     | pinCode     | commision   | commisionType  | logo  | profile |  editedBy  |
      | Your vendor   | Bigger      | B deal     | 12221212     | vikrant.singh@successive.tech   |  5e2996260da2580011251edb   | delhi1              | delhi2     | India       | 110090      |  12         |                |       | true    |   Seller   |
    And user make a request to update the profile of their associated Vendor
    Then user should be able to update the vendor profile successfully



#  Scenario: User login as a System Admin with valid registered details and update the profile of their associated vendor
#    When User is able to log into application
#      | email                         | password   |
#      | systemadmin@marketcube.io     | 123456789 |
#    Then User should be able to login to the system and store token
#    And user enters profile details for update vendor profile
#      | brandName     | firstName   | lastName   | phoneNumber  | email                           | id                          | address             | city       | country     | pinCode     | commision   | commisionType  | logo  | profile |  editedBy  |
#      | Your vendor   | Bigger      | B deal     | 12221212     | vikrant.singh@successive.tech   |  5e2996260da2580011251edb   | delhi1              | delhi2     | India       | 110090      |  12         |                |       | true    |   Seller   |
#    And user make a request to update the profile of their associated Vendor
#    Then user should be able to update the vendor profile successfully
#



  Scenario Outline: user request for change Profile of their associated vendor and not follow any field validation
    When User is able to log into application
      | email                         | password   |
      | vikrant.singh@successive.tech | HaiVikki12 |
    Then User should be able to login to the system and store token
    And user enters profile details for update vendor profile
      | brandName       | firstName     | lastName     | phoneNumber   | email                             | id                            | address               | city         | country       | pinCode       | commision     | commisionType    | logo    | profile   |  editedBy    |
      | <brandName>     | <firstName>   | <lastName>   | <phoneNumber> | <email>                           | <id>                          | <address>             | <city>       | <country>     | <pinCode>     | <commision>   | <commisionType>  | <logo>  | <profile> |  <editedBy>  |
    And user make a request to update the profile of their associated Vendor
    Then user should not able to update vendor profile and user should get validation error message
      |  All fields marked with * are required        |
      |  All fields marked with * are required        |
      |  All fields marked with * are required        |
      |  All fields marked with * are required        |
      |  Cast to ObjectId failed for value \"5e2996260da2580011251edb1\" at path \"_id\" for model \"Users\"  |
    Examples:
      | brandName     | firstName   | lastName   | phoneNumber  | email                           | id                          | address             | city       | country     | pinCode     | commision   | commisionType  | logo  | profile |  editedBy  |
      | Your vendor   |             | B deal     | 12221212     | vikrant.singh@successive.tech   |  5e2996260da2580011251edb   | delhi1              | delhi2     | India       | 110090      |  12         |                |       | true    |   Seller   |
      | Your vendor   | Bigger      |            | 12221212     | vikrant.singh@successive.tech   |  5e2996260da2580011251edb   | delhi1              | delhi2     | India       | 110090      |  12         |                |       | true    |   Seller   |
      | Your vendor   | Bigger      | B deal     |              | vikrant.singh@successive.tech   |  5e2996260da2580011251edb   | delhi1              | delhi2     | India       | 110090      |  12         |                |       | true    |   Seller   |
      | Your vendor   | Bigger      | B deal     | 12221212     | vikrant.singh@successive.tech   |                             | delhi1              | delhi2     | India       | 110090      |  12         |                |       | true    |   Seller   |
      | Your vendor   | Bigger      | B deal     | 12221212     | vikrant.singh@successive.tech   |  5e2996260da2580011251edb1  | delhi1              | delhi2     | India       | 110090      |  12         |                |       | true    |   Seller   |





  Scenario Outline: User make a request to update the vendor profile with valid field by passing Incorrect/blank token data
    When user enters profile details for update vendor profile
      | brandName     | firstName   | lastName   | phoneNumber  | email                           | id                          | address             | city       | country     | pinCode     | commision   | commisionType  | logo  | profile |  editedBy  |
      | Your vendor   | Bigger      | B deal     | 12221212     | vikrant.singh@successive.tech   |  5e2996260da2580011251edb   | delhi1              | delhi2     | India       | 110090      |  12         |                |       | true    |   Seller   |
    When user make a request to update the vendor profile with Incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then user should not able to update vendor profile and user should get validation error message
      | Invalid token provided          |
      | token is required.              |
    Examples:
      | token                           |
      |  sgshhshhshhshshhsh             |
      |                                 |



#    Previous API hit to update vendor profile details
#    {
# "brandName":"Your vendor",
# "firstName":"Bigger",
# "lastName":"B deal",
# "phoneNumber":"12221212",
# "email":"vikrant.singh@successive.tech",
# "id":"5e2996260da2580011251edb",
# "address":"delhi1",
# "city":"delhi2",
# "country":"India",
# "pinCode":"110090",
# "commisionType":"12",
# "logo":"",
# "profile":"true",
# "editedBy":"Seller"
#}


#  API hit to update seller profile
#  {"brandName":"haistoretest","contactEmail":"vikrant.singh@successive.tech"}

# API hit to update Vendor  profile by seller
#  {"address":"delhi1","brand":{"slug":"vendor64"},"brandName":"vendor64","city":"delhi","country":"India","email":"vikrant.singh+64@successive.tech","firstName":"vikrant64","id":"5ec61d5dc54ca1001a9f0ac0","isReadOnly":false,"lastName":"singh","phoneNumber":"1234567890","pinCode":"110090"}}}

# API hit to update  profile by own vendor
#  {"firstName":"vikrant64","lastName":"singh","email":"vikrant.singh+64@successive.tech","phoneNumber":"1234567890","brandName":"vendor64","address":"delhi1","city":"delhi","country":"India","pinCode":"110090","brand":{"slug":"vendor64"}},"dataToUpdate":{"payment":{"sortCode":"","bank":"","account":"","country":"","isEnabled":false},"shipping":{"address":"","pinCode":"","country":"","city":"","isBizAddress":false,"isEnabled":false},"socialLink":{"facebook":"","twitter":"","instagram":"","linkedin":"","youtube":"","isEnabled":false},"description":"vendor64","sellerId":"5ec606dbde6a7c0019f397cb"}}}

  # API hit to update Vendor  profile by System-admin
#  {"address":"delhi1","brand":{"slug":"vendor007"},"brandName":"Vendor+007","city":"delhi2","country":"India","email":"vikrant.singh+007@successive.tech","firstName":"Vikrant007","id":"5e2996260da2580011251edb","isReadOnly":false,"lastName":"B deal","phoneNumber":"12221212","pinCode":"110090"}

