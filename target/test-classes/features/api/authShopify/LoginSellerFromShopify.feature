Feature:  API -- Auth - Login a Seller from shopify.-- post--  /user/shopify-login

        As a registered user(Seller)
        User want to get logged into on marketcube from shopify as a Seller.
        So that I am able to access the platform and manage my inventory



  Scenario: Login into the system with valid registered user details as a Seller from shopify.
    When User enters sellerId and shopifyAccessToken
      | _id                         | shopifyAccessToken                |
      | 5ec67a5a58f0140019833794    | 427a869b3dd99d5cc1fddadb51dc678e  |
    And User make a request to login to the system from shopify
    Then User should be able to login to the system from shopify




  Scenario Outline: User wants to enter the system from shopify without following the valid field credentials
    When User enters sellerId and shopifyAccessToken
      | _id                         | shopifyAccessToken                |
      | <_id>                       | <shopifyAccessToken>              |
    And User make a request to login to the system from shopify
    Then User should not be able to login to the system from shopify and user should get validation error message
      |  _id is required.                                |
      |  ShopifyAccessToken is required.                 |
      |  Invalid Id provided, Not found.                 |
      |  Invalid Id provided, Not found.                 |
      |  Invalid Id provided, Not found.                 |
      |  Invalid Id provided, Not found.                 |
      |  User not found                                  |
      |  User not found                                  |
      |  User not found                                  |
    Examples:
      | _id                         | shopifyAccessToken                |
      |                             | 427a869b3dd99d5cc1fddadb51dc678e  |
      | 5ec67a5a58f0140019833794    |                                   |
      | 12345678901234567890123     | 427a869b3dd99d5cc1fddadb51dc678e  |
      | 123456789012345678901234    | 427a869b3dd99d5cc1fddadb51dc678e  |
      | aaaaaaaaaaaaaaaaaaaaaaaa    | 427a869b3dd99d5cc1fddadb51dc678e  |
      | 1234567890123456789012345   | 427a869b3dd99d5cc1fddadb51dc678e  |
      | 5ec67a5a58f0140019833794    | 1234567890123456789012345678901   |
      | 5ec67a5a58f0140019833794    | 12345678901234567890123456789012  |
      | 5ec67a5a58f0140019833794    | 123456789012345678901234567890123 |


#UserNotVerified  ----User not verified.   ------------how to test
#InvalidTokenData ------Invalid token data provided.------------how to test