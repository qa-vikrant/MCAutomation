Feature: Api- (Update profile of Supplier / Seller /SystemAdmin)------ put--  /user/profile

       As a  Seller /SystemAdmin
       User wants to change the profile of Seller


  Scenario: login as a Seller with valid registered user details and user wants to update own profile details
    When User is able to log into application
      | email                             | password    |
      | vikrant.singh+100@successive.tech | 123456789   |
    Then User should be able to login to the system and store token
    And User enters the required details to update seller profile
      | brandName        | email                              | isProfile   | editedBy  |
      | vikrant100       | vikrant.singh+100@successive.tech  | true        |           |
    And User make a request to update the seller profile
    Then User should be able to update the seller profile successfully




  Scenario: login as a Seller with valid registered user details and user wants to update another seller profile details
    When User is able to log into application
      | email                             | password    |
      | vikrant.singh@successive.tech     | 1234@Vik    |
    Then User should be able to login to the system and store token
    And User enters the required details to update seller profile
      | brandName        | email                              | isProfile   | editedBy  |
      |                  | vikrant.singh@successive.tech      | true        |           |
    And User make a request to update the seller profile
    Then User should be able to update the seller profile successfully


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
