Feature: API -  Auth - To add paypal details for seller/vendor---  post  /user/paypal

        As a registered user
        I want to add paypal details for seller/vendor

  Scenario: Login with valid registered user details as a seller and add paypal details successfully
    When User is able to log into application
      | email                             | password   |
      | vikrant.singh+111@successive.tech | 1234@Vik   |
    Then User should be able to login to the system and store token
    When user enters paypal details for seller or vendor
      | secret   | clientId   | emailId                           | isActive |
      | secretKey| csdfsdlj32 | vikrant.singh+111@successive.tech | true     |
    Then user should be able to add paypal details for any seller or vendor

  Scenario Outline: Login with valid registered user details and check validation error messages
    When User is able to log into application
      | email                         | password   |
      | vikrant.singh@successive.tech | 1234@Vik   |
    Then User should be able to login to the system and store token
    When user enters paypal details for seller or vendor
      | secret  | clientId   | emailId   | isActive   |
      | <secret>| <clientId> | <emailId> | <isActive> |
    Then user should not be able to add paypal details for any seller or vendor
      | ClientId is required. |
      | Secret is required.   |
  Examples:
      | secret    | clientId | emailId                       | isActive |
      | secretKey |          | vikrant.singh@successive.tech | true     |
      |           | adsfsaa  | vikrant.singh@successive.tech | true     |
