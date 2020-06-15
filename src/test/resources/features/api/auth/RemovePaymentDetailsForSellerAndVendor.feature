Feature: API--  Auth - To remove payment details for seller/vendor-- put--  /user/payment-disconnect

        Login as a seller
        user want to remove their payment details

        Login as a vendor
        user want to remove their payment details


  Scenario Outline: Login with valid registered user details as a seller and user wants to remove the payment details
    When User is able to log into application
      | email                                 | password    |
      | vikrant.singh+111@successive.tech     |  1234@Vik   |
    Then User should be able to login to the system and store token
    And User enters payment method details
      | paymentMethod   |
      | <paymentMethod> |
    And User make a request to remove that payment method in form of clicking on disconnect button
    Then User should be able to remove payment method successfully that he requested
    Examples:
      | paymentMethod |
      | stripe        |
      | paypal        |

  Scenario Outline: Login with valid registered user details as a seller and user wants to remove the payment details without follow input field validation
    When User is able to log into application
      | email                                 | password    |
      | vikrant.singh+111@successive.tech     |  1234@Vik   |
    Then User should be able to login to the system and store token
    And User enters payment method details
      | paymentMethod   |
      | <paymentMethod> |
    And User make a request to remove that payment method in form of clicking on disconnect button
    Then User should not be able to remove payment method that he requested and user should get a validation message
      | Invalid payment method provided |
      | Invalid payment method provided |
      | PaymentMethod is required.      |
    Examples:
      | paymentMethod |
      | stripluuuu    |
      | sdfsfsfsdf    |
      |               |
#Payment method is required not mention in docs




  Scenario Outline: Login with valid registered user details as a vendor and user wants to remove the payment details
    When User is able to log into application
      | email                                 | password     |
      | vikrant.singh+112@successive.tech     |  12345@Vik   |
    Then User should be able to login to the system and store token
    And User enters payment method details
      | paymentMethod   |
      | <paymentMethod> |
    And User make a request to remove that payment method in form of clicking on disconnect button
    Then User should be able to remove payment method successfully that he requested
    Examples:
      | paymentMethod |
      | stripe        |
      | paypal        |



  Scenario Outline: Login with valid registered user details as a vendor and user wants to remove the payment details without follow input field validation
    When User is able to log into application
      | email                                 | password    |
      | vikrant.singh+111@successive.tech     |  1234@Vik   |
    Then User should be able to login to the system and store token
    And User enters payment method details
      | paymentMethod   |
      | <paymentMethod> |
    And User make a request to remove that payment method in form of clicking on disconnect button
    Then User should not be able to remove payment method that he requested and user should get a validation message
      | Invalid payment method provided |
      | Invalid payment method provided |
      | PaymentMethod is required.      |
    Examples:
      | paymentMethod |
      | stripluuuu    |
      | sdfsfsfsdf    |
      |               |
#Payment method is required not mention in docs


  Scenario Outline: Login with valid registered user details as a system admin and user wants to remove the payment details
    When User is able to log into application
      | email                             | password       |
      | systemadmin@marketcube.io         | 12345678n@N    |
    Then User should be able to login to the system and store token
    And User enters payment method details
      | paymentMethod   |
      | <paymentMethod> |
    And User make a request to remove that payment method in form of clicking on disconnect button
    Then User should not be able to remove payment method that he requested and user should get a validation message
      | User is not authorized to perform this action |
      | User is not authorized to perform this action |
    Examples:
      | paymentMethod |
      | stripe        |
      | paypal        |




  Scenario Outline:User make a request to remove payment method by passing with Incorrect/blank token data with valid payment method
    And User enters payment method details
      | paymentMethod   |
      | <paymentMethod> |
    And user make a request to remove payment method with Incorrect/blank token field in form of without login credentials
      | token                      |
      | <token>                    |
    Then User should not be able to remove payment method that he requested and user should get a validation message
      | Invalid token provided          |
      | Token is required.              |
      | Invalid token provided          |
      | Token is required.              |
    Examples:
      | token                           | paymentMethod  |
      |  sgshhshhshhshshhsh             | stripe         |
      |                                 | stripe         |
      |  sgshhshhshhshshhsh             | paypal         |
      |                                 | paypal         |
