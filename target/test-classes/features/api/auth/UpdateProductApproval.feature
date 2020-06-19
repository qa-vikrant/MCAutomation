Feature: API --- Auth____For_seller--Update product approval settings for user  --put   /user/setting/product


  As a registered user(Seller)
  user want to update product approval setting for their vendors.




  Scenario Outline: Login with valid registered user details as a seller and user wants to update product approval settings
    When User is able to log into application
      | email                             | password    |
      | vikrant.singh+60@successive.tech  | 1234@Vik    |
    Then User should be able to login to the system and store token
    And User enters product Approval setting
      | reviewAll   | approveSelected   | approveAll   |
      | <reviewAll> | <approveSelected> | <approveAll> |
    And User make a request to update product approval settings
    Then User should be able to update product approval settings
    Examples:
      | reviewAll | approveSelected  | approveAll |
      | true      | false            | false      |
      | false     | true             | false      |
      | false     | false            | true       |



  Scenario Outline: Login with valid registered user details as a vendor and user wants to update product approval settings
    When User is able to log into application
      | email                             | password      |
      | vikrant.singh+62@successive.tech  | 1234567890    |
    Then User should be able to login to the system and store token
    And User enters product Approval setting
      | reviewAll   | approveSelected   | approveAll   |
      | <reviewAll> | <approveSelected> | <approveAll> |
    And User make a request to update product approval settings
    Then User should not be able to update product approval settings and user should get validation error message
      |  User is not authorized to perform this action.   |
      |  User is not authorized to perform this action.   |
      |  User is not authorized to perform this action.   |
    Examples:
      | reviewAll | approveSelected  | approveAll |
      | true      | false            | false      |
      | false     | true             | false      |
      | false     | false            | true       |


  Scenario Outline: Login with valid registered user details as a seller and without follow field validation user wants to update product approval settings
    When User is able to log into application
      | email                             | password    |
      | vikrant.singh+60@successive.tech  | 1234@Vik    |
    Then User should be able to login to the system and store token
    And User enters product Approval setting
      | reviewAll   | approveSelected   | approveAll   |
      | <reviewAll> | <approveSelected> | <approveAll> |
    And User make a request to update product approval settings
    Then User should not be able to update product approval settings and user should get validation error message
      |  User is not authorized to perform this action.   |
      |  User is not authorized to perform this action.   |
    Examples:
      | reviewAll | approveSelected  | approveAll |
      | false     | false            | false      |





  Scenario Outline: User make a request to product approval settings with valid field details by passing Incorrect/blank token data
    And User enters product Approval setting
      | reviewAll   | approveSelected   | approveAll   |
      | true        | false             | false        |
    And User make a request to product approval settings with incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then User should not be able to update product approval settings and user should get validation error message
      | Invalid token provided          |
      | Token is required.              |
    Examples:
      | token                                                |
      |  sgshhshhshhshshhshsssssssssssssssssssss             |
      |                                                      |










