Feature: API -- Auth - Create a token, to reset Password--- put---  /user/password-token

       As a user--(Seller/Vendor)
       I want to create a token that user got by their registered emailId
       and then user use this token to reset Password

       Action---in form of Forgot Password Button( User requested to reset your password for your marketplace account.)


  Scenario:User enter their registered valid emailId and create a token that will be used for reset password
    When User enters the registered email for token creation
        | email                               |
        | vikrant.singh+101@successive.tech   |
    And User make a request to create a token
    Then Token has been created successfully and user should get a message request to reset password for marketplace account



  Scenario Outline: Without follow field validation user wants to create a token that will be used for reset password
    When User enter the incorrect/wrong email and wants to create a token
      | email   |
      | <email> |
    And User make a request to create a token
    Then User should not be able for token creation and user should get a validation error message
      | Email is required.         |
      | Invalid Email Provided.    |
      | Invalid Email Provided.    |
    Examples:
      | email                                 |
      |                                       |
      | vikrant.singh+101successive.tech      |
      | vikrant                               |


#SellerNotAllowed--Please use your shopify account to manage this functionality. User is not allowed to do it from here.---How to test

