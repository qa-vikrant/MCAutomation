Feature:Order - Update order line (accept/reject).- put -  /order/line-status

       Login as a registered user
       User wants to Update order line as a (accept/reject)

  Scenario: Login with valid registered user details as a Seller and user wants to update order line as a accept
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then User should be able to login to the system and store token
    When User enters order lineitem id ,order id and isAccept details of new order and user request to update order line as a accept
      | lineItemId                 | orderId                   | isAccept  |
      | 5e61ff78e77898001255a9db   | 5e61ff77e77898001255a9d3  | true      |
    Then user should be able update order line as a accept



  Scenario: Login with valid registered user details as a Seller and user wants to update order line as a reject
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then User should be able to login to the system and store token
    When User enters order lineitem id ,order id and isAccept details of new order and user request to update order line as a reject
      | lineItemId                 | orderId                   | isAccept  |
      | 5e61efe999a3030011db93c3   | 5e61efe999a3030011db93c1  | false     |
    Then user should be able update order line as a reject


  Scenario: Login with valid registered user details as a Vendor and user wants to update order line as a accept
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | 1234567890     |
    Then User should be able to login to the system and store token
    When User enters order lineitem id ,order id and isAccept details of new order and user request to update order line as a accept
      | lineItemId                 | orderId                   | isAccept  |
      | 5e61ff78e77898001255a9d4   | 5e61ff77e77898001255a9d3  | true      |
    Then user should be able update order line as a accept



  Scenario: Login with valid registered user details as a Vendor and user wants to update order line as a reject
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | 1234567890     |
    Then User should be able to login to the system and store token
    When User enters order lineitem id ,order id and isAccept details of new order and user request to update order line as a reject
      | lineItemId                 | orderId                   | isAccept  |
      | 5e61ff78e77898001255a9d9   | 5e61ff77e77898001255a9d3  | false     |
    Then user should be able update order line as a reject

#
#  Scenario: Login with valid registered user details as a System Admin and user wants to update order line as a accept
#    When User is able to log into application
#      | email                                 | password       |
#      | systemadmin@marketcube.io             | 12345678n@N    |
#    Then User should be able to login to the system and store token
#    When User enters order lineitem id ,order id and isAccept details of new order and user request to update order line as a accept
#      | lineItemId                 | orderId                   | isAccept  |
#      | 5e61ff78e77898001255a9da   | 5e61ff77e77898001255a9d3  | true      |
#    Then user should be able update order line as a accept
#


#  Scenario: Login with valid registered user details as a System Admin  and user wants to update order line as a reject
#    When User is able to log into application
#      | email                                 | password       |
#      | systemadmin@marketcube.io             | 12345678n@N    |
#    Then User should be able to login to the system and store token
#    When User enters order lineitem id ,order id and isAccept details of new order and user request to update order line as a reject
#      | lineItemId                 | orderId                   | isAccept  |
#      | 5e61ff78e77898001255a9d7   | 5e61ff77e77898001255a9d3  | false     |
#    Then user should be able update order line as a reject
#
#
#  Scenario: Login with valid registered user details as a System Admin  and user wants to update order line as a reject with blank isAccept field
#    When User is able to log into application
#      | email                                 | password       |
#      | systemadmin@marketcube.io             | 12345678n@N    |
#    Then User should be able to login to the system and store token
#    When User enters order lineitem id ,order id and isAccept details of new order and user request to update order line as a reject
#      | lineItemId                 | orderId                   | isAccept  |
#      | 5e61ff78e77898001255a9d8   | 5e61ff77e77898001255a9d3  |           |
#    Then user should be able update order line as a reject with blank isAccept field





  Scenario: Login with valid registered user details as a Seller  and user wants to update order line of other seller as a reject
    When User is able to log into application
      | email                                        | password       |
      | vikrant.singh+60@successive.tech             | 123456789      |
    Then User should be able to login to the system and store token
    When User enters order lineitem id ,order id and isAccept details of new order and user request to update order line as a reject
      | lineItemId                 | orderId                   | isAccept   |
      | 5e61ff78e77898001255a9d6   | 5e61ff77e77898001255a9d3  |  false     |
    Then user should not be able to update order line as a reject and user should get a validation message
      | User is not authorized to perform this action |
#Bug Login as a seller and seller use their token to update the order line of other seller as a reject then it should be expected error message as a "User is not authorized to perform this action" but in actual scenario it accept request and show message as a ok

  Scenario: Login with valid registered user details as a Seller and user wants to update order line of other seller as a accept
    When User is able to log into application
      | email                                        | password       |
      | vikrant.singh+60@successive.tech             | 123456789      |
    Then User should be able to login to the system and store token
    When User enters order lineitem id ,order id and isAccept details of new order and user request to update order line as a accept
      | lineItemId                 | orderId                   | isAccept  |
      | 5e61ff78e77898001255a9d5   | 5e61ff77e77898001255a9d3  | true      |
    Then user should not be able to update order line as a reject and user should get a validation message
      | User is not authorized to perform this action |
#Bug Login as a seller and seller use their token to update the order line of other seller as a accept then it should be expected error message as a "User is not authorized to perform this action" but in actual scenario it accept request and show message as a ok






  Scenario Outline: Login with valid registered user details as a seller  and without follow field validation user wants to update order line as a reject
    When User is able to log into application
      | email                                 | password         |
      | vikrant.singh@successive.tech         | HaiVikki12       |
    Then User should be able to login to the system and store token
    When User enters order lineitem id ,order id and isAccept details of new order and user request to update order line as a reject
      | lineItemId                   | orderId                     | isAccept    |
      | <lineItemId>                 | <orderId>                   | <isAccept>  |
    Then user should not be able to update order line as a reject and user should get a validation message
      | LineItemId is required. |
      | OrderId is required.    |
      | Invalid data provided   |
      | Invalid data provided   |
    Examples:
      | lineItemId                 | orderId                   | isAccept  |
      |                            | 5e61d927e77898001255a9cb  | false     |
      | 5e61d927e77898001255a9cd   |                           | false     |
      | 123456789123456789123456   | 5e61d927e77898001255a9cb  | false     |
      | 5e61d927e77898001255a9cd   | 123456789123456789123456  | false     |




  Scenario Outline: User make a request to update order line item as a accept or reject with valid ids field by passing Incorrect/blank token data
    When User enters order details of new order and user request to update order line as a accept
      | lineItemId                 | orderId                   | isAccept  |
      | 5e61d757e77898001255a9c4   | 5e61d756e77898001255a9c3  | true      |
    When user make a request to update order line item as a accept or reject with Incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then user should not be able to update order line as a reject and user should get a validation message
      | Invalid token provided          |
      | Invalid token provided          |
    Examples:
      | token                           |
      |  sgshhshhshhshshhsh             |
      |                                 |