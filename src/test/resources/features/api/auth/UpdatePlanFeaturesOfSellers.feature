Feature: API -  Auth - Update plan features of sellers--- put--  /user/plan

       As a System-Admin User
       User wants Update plan features of sellers


  Scenario Outline: Login with valid registered user details as a System Admin and user want to Update plan features of seller
    When User is able to log into application
      | email                         | password     |
      | systemadmin@marketcube.io     | 12345678n@N  |
    Then user should be able to login to the system and store token
    And user enters the seller details and new plan details
      | id                         | isBranding   | maxProducts   | maxVendors    |
      | <id>                       | <isBranding> | <maxProducts> | <maxVendors>  |
    And user make a request to Update plan features of seller
    Then user should be able to Update plan features of seller
    Examples:
      | id                         | isBranding | maxProducts| maxVendors  |
      | 5ec77821a05e91001a6c8ae2   | true       | 25600      | 1250        |



  Scenario Outline: Login with valid registered user details as a Seller and user want to Update plan features of another seller
    When User is able to log into application
      | email                                | password     |
      | vikrant.singh+60@successive.tech     | 1234@Vik     |
    Then user should be able to login to the system and store token
    And user enters the seller details and new plan details
      | id                         | isBranding   | maxProducts   | maxVendors    |
      | <id>                       | <isBranding> | <maxProducts> | <maxVendors>  |
    And user make a request to Update plan features of seller
    Then user should not be able to Update plan features of seller and user should get validation error message
      |  User is not authorized to perform this action |
    Examples:
      | id                         | isBranding | maxProducts| maxVendors  |
      | 5ec77821a05e91001a6c8ae2   | true       | 25400      | 1240        |



  Scenario Outline: Login with valid registered user details as a Seller and user want to Update own plan features
    When User is able to log into application
      | email                                | password     |
      | vikrant.singh+60@successive.tech     | 1234@Vik     |
    Then user should be able to login to the system and store token
    And user enters the seller details and new plan details
      | id                         | isBranding   | maxProducts   | maxVendors    |
      | <id>                       | <isBranding> | <maxProducts> | <maxVendors>  |
    And user make a request to Update plan features of seller
    Then user should not be able to Update plan features of seller and user should get validation error message
      |  User is not authorized to perform this action |
    Examples:
      | id                         | isBranding | maxProducts| maxVendors  |
      | 5ec606dbde6a7c0019f397cb   | true       | 25400      | 1240        |



  Scenario Outline: Login with valid registered user details as a Vendor and user want to Update plan features of another seller
    When User is able to log into application
      | email                                | password       |
      | vikrant.singh+64@successive.tech     | 1234567890     |
    Then user should be able to login to the system and store token
    And user enters the seller details and new plan details
      | id                         | isBranding   | maxProducts   | maxVendors    |
      | <id>                       | <isBranding> | <maxProducts> | <maxVendors>  |
    And user make a request to Update plan features of seller
    Then user should not be able to Update plan features of seller and user should get validation error message
      |  User is not authorized to perform this action |
    Examples:
      | id                         | isBranding | maxProducts| maxVendors  |
      | 5ec77821a05e91001a6c8ae2   | true       | 25400      | 1240        |




  Scenario Outline: Login with valid registered user details as a System Admin and without follow field validation user want to Update plan features of seller
    When User is able to log into application
      | email                         | password     |
      | systemadmin@marketcube.io     | 12345678n@N  |
    Then user should be able to login to the system and store token
    And user enters the seller detail and new plan detail
      | id                         | isBranding   | maxProducts   | maxVendors    |
      | <id>                       | <isBranding> | <maxProducts> | <maxVendors>  |
    And user make a request to Update plan feature of seller
    Then user should not be able to Update plan features of seller and user should get validation error message
      | Id is required.                                  |
      | Invalid Id provided.                             |
      | Invalid Id provided.                             |
      | Invalid Id provided.                             |
      | Invalid Id provided.                             |
      | MaxProducts is required.                         |
      | Invalid maxProducts provided                     |
      | MaxVendors is required.                          |
      | Invalid maxVendors provided                      |
    Examples:
      | id                         | isBranding | maxProducts| maxVendors  |
      |                            | true       | 25400      | 1240        |
      | 12345678901234567890123    | true       | 25400      | 1240        |
      | 123456789012345678901234   | true       | 25400      | 1240        |
      | 1234567890123456789012345  | true       | 25400      | 1240        |
      | aaaaaaaaaaaaaaaaaaaaaaaa   | true       | 25400      | 1240        |
      | 5ec77821a05e91001a6c8ae2   | true       |            | 1240        |
      | 5ec77821a05e91001a6c8ae2   | true       | asdfdd     | 1240        |
      | 5ec77821a05e91001a6c8ae2   | true       | 25400      |             |
      | 5ec77821a05e91001a6c8ae2   | true       | 25400      | asdfdd      |




  Scenario Outline: User make a request to Update plan features of sellers with valid field by passing Incorrect/blank token data
    And user enters the seller details and new plan details
      | id                         | isBranding   | maxProducts   | maxVendors    |
      | 5ec77821a05e91001a6c8ae2   | true         | 25400         | 1240          |
    When user make request to Update plan features of sellers with Incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then user should not be able to Update plan features of seller and user should get validation error message
      | Invalid token provided          |
      | token is required.              |
    Examples:
      | token                           |
      | sgshhshhshhshshhsh              |
      |                                 |

