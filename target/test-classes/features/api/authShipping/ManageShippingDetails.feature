Feature: API -Auth - Manage shipping details -PUT-/user/shipping

         As a registered User(Seller)
         User wants to manage shipping details

  Scenario Outline: Login with valid registered user details as a seller and user wants to update own shipping settings
    When User is able to log into application
      | email                                     | password       |
      | vikrant.singh+250@successive.tech         | 123!45@Vik     |
    Then User should be able to login to the system and store token
    And User enters shipping details
      | term   | type   | amount   | allowVendor   | isFreeForCustomer   | isHideDescription   |
      | <term> | <type> | <amount> | <allowVendor> | <isFreeForCustomer> | <isHideDescription> |
    When User make a request to update shipping details
    Then User should be able to update shipping details successfully
    Examples:
      | term            | type | amount | allowVendor      | isFreeForCustomer | isHideDescription |
      | none            | free | 0      |                  |                   |                   |
      | equal           | flat | 0      |                  |                   |                   |
      | flat            | flat | 22     |                  |                   |                   |

  Scenario Outline: Login with valid registered user details as a seller and user wants to shipping charges manage by vendor
    When User is able to log into application
      | email                                     | password       |
      | vikrant.singh+250@successive.tech         | 123!45@Vik     |
    Then User should be able to login to the system and store token
    And User enters shipping details
      | term   | type   | amount   | allowVendor   | isFreeForCustomer   | isHideDescription   |
      | <term> | <type> | <amount> | <allowVendor> | <isFreeForCustomer> | <isHideDescription> |
    And User enters vendor manage vendorIds
      | 5eef2bc08e18360012163f69 |
    When User make a request to update shipping details
    Then User should be able to update shipping details successfully
    Examples:
      | term            | type | amount | allowVendor      | isFreeForCustomer | isHideDescription |
      | vendorManage    | flat | 0      | none             | true              |                   |
      | vendorManage    | flat | 0      | all              | true              |                   |
      | vendorManage    | flat | 0      | selected         | false             |                   |

  Scenario Outline: Login with valid registered user details as a vendor and user wants to update shipping details
    When User is able to log into application
      | email                                     | password       |
      | vikrant.singh+351@successive.tech         | 1234@Vik       |
    Then User should be able to login to the system and store token
    And User enters shipping details
      | term   | type   | amount   | allowVendor   | isFreeForCustomer   | isHideDescription |
      | <term> | <type> | <amount> | <allowVendor> | <isFreeForCustomer> | <isHideDescription> |
    And User enters vendor manage vendorIds
      | 5e2996260da2580011251edb |
    When User make a request to update shipping details
    Then User should not be able to manage shipping details and user should get validation error message
      | User is not authorized to perform this action |
      | User is not authorized to perform this action |
      | User is not authorized to perform this action |
      | User is not authorized to perform this action |
      | User is not authorized to perform this action |
      | User is not authorized to perform this action |
    Examples:
      | term            | type | amount | allowVendor      | isFreeForCustomer | isHideDescription |
      | vendorManage    | flat | 0      | none             | true              |                   |
      | vendorManage    | flat | 0      | all              | true              |                   |
      | vendorManage    | flat | 0      | selected         | false             |                   |
      | none            | free | 0      |                  |                   |                   |
      | equal           | flat | 0      |                  |                   |                   |
      | flat            | flat | 22     |                  |                   |                   |

  Scenario Outline: Login with valid registered user details as a seller and without follow field validation user wants to update own shipping settings
    When User is able to log into application
      | email                                     | password       |
      | vikrant.singh+250@successive.tech         | 123!45@Vik     |
    Then User should be able to login to the system and store token
    And User enters shipping details
      | term   | type   | amount   | allowVendor   | isFreeForCustomer   | isHideDescription   |
      | <term> | <type> | <amount> | <allowVendor> | <isFreeForCustomer> | <isHideDescription> |
    When User make a request to update shipping details
    Then User should not be able to manage shipping details and user should get validation error message
      | Term is required.                                                   |
      | Type is required.                                                   |
      | Invalid term provided.                                              |
      | Invalid type provided.                                              |
      | Please enter valid amount for flat term, should be more than 0      |
      | Please enter valid amount for flat term, should be more than 0      |
    Examples:
      | term            | type      | amount | allowVendor      | isFreeForCustomer | isHideDescription |
      |                 | free      | 0      |                  |                   |                   |
      | equal           |           | 0      |                  |                   |                   |
      | fsfsfsfsfsss    | flat      | 22     |                  |                   |                   |
      | flat            | vfsfsffsf | 22     |                  |                   |                   |
      | flat            | flat      |        |                  |                   |                   |
      | flat            | flat      | 0      |                  |                   |                   |

  Scenario Outline: Login with valid registered user details as a seller and without follow field validation user wants to shipping charges manage by vendor
    When User is able to log into application
      | email                                     | password       |
      | vikrant.singh+250@successive.tech         | 123!45@Vik     |
    Then User should be able to login to the system and store token
    And User enters shipping details
      | term   | type   | amount   | allowVendor   | isFreeForCustomer   | isHideDescription   |
      | <term> | <type> | <amount> | <allowVendor> | <isFreeForCustomer> | <isHideDescription> |
    And User enters vendor manage vendorIds
      | 5eef2bc08e18360012163f69 |
    When User make a request to update shipping details
    Then User should not be able to manage shipping details and user should get validation error message
      | AllowVendor is required.                                |
      | Invalid allowVendor provided.                           |
      | Invalid allowVendor provided.                           |
    Examples:
      | term            | type | amount | allowVendor      | isFreeForCustomer | isHideDescription |
      | vendorManage    | flat | 0      |                  | true              |                   |
      | vendorManage    | flat | 0      | gshhshshshhshsss | true              |                   |
      | vendorManage    | flat | 0      | 1111111111111111 | false             |                   |

  Scenario Outline: User make a request to update shipping details with valid field by passing Incorrect/blank token data
    And User enters shipping details
      | term            | type   | amount   | allowVendor      | isFreeForCustomer   | isHideDescription   |
      | flat            | flat   | 22       |                  |                     |                     |
    When User make request to update shipping details with Incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then User should not be able to manage shipping details and user should get validation error message
      | Invalid token provided          |
      | Token is required.              |
    Examples:
      | token                           |
      | sgshhshhshhshshhsh              |
      |                                 |

  Scenario Outline: Login with valid registered user details as a System Admin and user wants to manage shipping details
    When User is able to log into application
      | email                                 | password       |
      | systemadmin@marketcube.io             | 12345678n@N    |
    Then User should be able to login to the system and store token
    And User enters shipping details
      | term   | type   | amount   | allowVendor   | isFreeForCustomer   |
      | <term> | <type> | <amount> | <allowVendor> | <isFreeForCustomer> |
    And User enters vendor manage vendorIds
      | 5e2996260da2580011251edb |
    When User make a request to update shipping details
    Then User should not be able to manage shipping details and user should get validation error message
      | User is not authorized to perform this action |
    Examples:
      | term            | type | amount | allowVendor      | isFreeForCustomer |
      | vendorManage    | flat | 0      | none             | true              |


#---------------------------API HIT on UI--------------------------------------------------
# {"term":"none", "amount":0,"type":"flat","setting":{}}
#{"term":"equal"," amount":0,"type":"flat","setting":{}}
#{"term":"flat"," amount":2,"type":"flat","isHideDescription":false,"setting":{}}
#{"term":"flat","amount":1,"type":"flat","isHideDescription":false,"setting":{"bandIds":[],"offerIds":[],"ruleIds":[],"vendorIds":[]}}
#{"term":"vendorManage","amount":0,"type":"flat","allowVendor":"none","vendorIds":[],"isFreeForCustomer":true,"shippingPerVendor":{"isAllowed":false,"vendorIds":[]},"isHideDescription":true,"setting":{"bandIds":[],"offerIds":[],"ruleIds":[],"vendorIds":[]}}
#{"term":"vendorManage","amount":0,"type":"flat","allowVendor":"all","vendorIds":[],"isFreeForCustomer":false,"shippingPerVendor":{"isAllowed":false,"vendorIds":[]},"isHideDescription":true,"setting":{"bandIds":[],"offerIds":[],"ruleIds":[],"vendorIds":[]}}
#{"term":"vendorManage","amount":0,"type":"flat","allowVendor":"selected","vendorIds":["5eef2bc08e18360012163f69"],"isFreeForCustomer":false,"shippingPerVendor":{"isAllowed":false,"vendorIds":[]},"isHideDescription":false,"setting":{"bandIds":[],"offerIds":[],"ruleIds":[],"vendorIds":[]}}
#{"operationName":"saveShipping","variables":{"input":{"term":"vendorManage","amount":0,"type":"flat","allowVendor":"selected","vendorIds":["5eef2bc08e18360012163f69"],"isFreeForCustomer":false,"shippingPerVendor":{"isAllowed":false,"vendorIds":[]},"isHideDescription":false,"setting":{"bandIds":[],"offerIds":[],"ruleIds":[],"vendorIds":[]}}
#{"term":"vendorManage","amount":0,"type":"flat","allowVendor":"selected","vendorIds":["5ef05f545df56a0012f91461"],"isFreeForCustomer":true,"shippingPerVendor":{"isAllowed":true,"vendorIds":["5ef05f545df56a0012f91461"]},"isHideDescription":true,"setting":{"bandIds":[],"offerIds":[],"ruleIds":[],"vendorIds":[]}}