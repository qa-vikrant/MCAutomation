Feature: API -Auth - Manage shipping details -PUT-/user/shipping

         As a registered user
         I want to manage shipping details

  Scenario Outline: Login with valid registered user details as a seller and user wants to manage shipping details
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then User should be able to login to the system and store token
    And user enters manage shipping details
      | term   | type   | amount   | allowVendor   | isFreeForCustomer   |
      | <term> | <type> | <amount> | <allowVendor> | <isFreeForCustomer> |
    And user enters vendorIds
      | 5e2996260da2580011251edb |
    When User make a request to manage shipping details
    Then User should be able to manage shipping details successfully
    Examples:
      | term            | type | amount | allowVendor      | isFreeForCustomer |
      | vendorManage    | flat | 0      | none             | true              |
      | vendorManage    | flat | 0      | selected         | true              |
      | vendorManage    | flat | 0      | all              | true              |
      | equal           | flat | 0      |                  |                   |
      | none            | flat | 0      |                  |                   |
      | flat            | flat | 22     |                  |                   |



  Scenario Outline: Login with valid registered user details as a vendor and user wants to manage shipping details
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | 1234567890     |
    Then User should be able to login to the system and store token
    And user enters manage shipping details
      | term   | type   | amount   | allowVendor   | isFreeForCustomer   |
      | <term> | <type> | <amount> | <allowVendor> | <isFreeForCustomer> |
    And user enters vendorIds
      | 5e2996260da2580011251edb |
    When User make a request to manage shipping details
    Then User should not be able to manage shipping details and user should get validation error message
      | User is not authorized to perform this action|
      | User is not authorized to perform this action|
      | User is not authorized to perform this action|
      | User is not authorized to perform this action|
      | User is not authorized to perform this action|
      | User is not authorized to perform this action|
    Examples:
      | term            | type | amount | allowVendor      | isFreeForCustomer |
      | vendorManage    | flat | 0      | none             | true              |
      | vendorManage    | flat | 0      | selected         | true              |
      | vendorManage    | flat | 0      | all              | true              |
      | equal           | flat | 0      |                  |                   |
      | none            | flat | 0      |                  |                   |
      | flat            | flat | 22     |                  |                   |



#  Scenario Outline: Login with valid registered user details as a System Admin and user wants to manage shipping details
#    When User is able to log into application
#      | email                                 | password       |
#      | systemadmin@marketcube.io             | 12345678n@N    |
#    Then User should be able to login to the system and store token
#    And user enters manage shipping details
#      | term   | type   | amount   | allowVendor   | isFreeForCustomer   |
#      | <term> | <type> | <amount> | <allowVendor> | <isFreeForCustomer> |
#    And user enters vendorIds
#      | 5e2996260da2580011251edb |
#    When User make a request to manage shipping details
#    Then User should not be able to manage shipping details and user should get validation error message
#      | User is not authorized to perform this action |
#      | User is not authorized to perform this action |
#      | User is not authorized to perform this action |
#      | User is not authorized to perform this action |
#      | User is not authorized to perform this action |
#      | User is not authorized to perform this action |
#    Examples:
#      | term            | type | amount | allowVendor      | isFreeForCustomer |
#      | vendorManage    | flat | 0      | none             | true              |
#      | vendorManage    | flat | 0      | selected         | true              |
#      | vendorManage    | flat | 0      | all              | true              |
#      | equal           | flat | 0      |                  |                   |
#      | none            | flat | 0      |                  |                   |
#      | flat            | flat | 22     |                  |                   |



  Scenario Outline: Login with valid registered user details as a seller and without follow field validation user wants to manage shipping details
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then User should be able to login to the system and store token
    And user enters manage shipping details
      | term   | type   | amount   | allowVendor   | isFreeForCustomer   |
      | <term> | <type> | <amount> | <allowVendor> | <isFreeForCustomer> |
    And user enters vendorIds
      | 5e2996260da2580011251edb |
    When User make a request to manage shipping details
    Then User should not be able to manage shipping details and user should get validation error message
      | Term is required.                                |
      | Type is required.                                |
      | Invalid term provided.                           |
      | Invalid type provided.                           |
      | allowVendor is required.                         |
      | Please enter valid amount for flat term, should be more than 0 |
       Examples:
      | term            | type        | amount | allowVendor      | isFreeForCustomer |
      |                 | flat        | 0      | none             | true              |
      | vendorManage    |             | 0      | selected         | true              |
      | equal3333       | flat        | 0      |                  |                   |
      | none            | flat2222222 | 0      |                  |                   |
      | vendorManage    | flat        | 0      |                  | true              |
      | flat            | flat        | 0      |                  |                   |

































  Scenario Outline: Login with valid registered user details and manage shipping details
    When User is able to log into application
      |email                     | password  |
      |mohit.agrawal@successive.tech | Mohit@1989 |
    Then user should be able to login to the system and store token
    When user enters manage shipping details
      | term | type | amount | isAllowAllVendor | vendorIds |
      | <term> | <type> | <amount> | <isAllowAllVendor> | <vendorIds> |
      | 2    | free | 1221   | true             | 5dcbfbe0e07320001a882d18|
    Then User should be able to manage shipping details successfully
    Examples:
      | term | type | amount | isAllowAllVendor | vendorIds |
      | 2    | free | 1221   | true             | 5dcbfbe0e07320001a882d18|












































  Scenario Outline: Login with valid registered user details and manage shipping details
    When User is able to log into application
    |email                     | password  |
    |mohit.agrawal@successive.tech | Mohit@1989 |
    Then user should be able to login to the system and store token
    When user enters manage shipping details
    | term | type | amount | isAllowAllVendor | vendorIds |
    | <term> | <type> | <amount> | <isAllowAllVendor> | <vendorIds> |
    | 2    | free | 1221   | true             | 5dcbfbe0e07320001a882d18|
    Then User should be able to manage shipping details successfully
    Examples:
      | term | type | amount | isAllowAllVendor | vendorIds |
      | 2    | free | 1221   | true             | 5dcbfbe0e07320001a882d18|

  Scenario Outline: Login with valid registered user details and validate error message for manage shipping details
    When User is able to log into application
      |email                     | password  |
      |mohit.agrawal@successive.tech | Mohit@1989 |
    Then user should be able to login to the system and store token
    When user enters manage shipping details
      | term | type | amount | isAllowAllVendor | vendorIds |
      | <term> | <type> | <amount> | <isAllowAllVendor> | <vendorIds> |
    Then User validates error messages for manage shipping details
      | Term is required. |
      | Type is required.  |
    Examples:
      | term | type | amount | isAllowAllVendor | vendorIds |
      |     | free | 1221   | true             | 5dcbfbe0e07320001a882d18|
      |  2   |  | 1221   | true             | 5dcbfbe0e07320001a882d18|