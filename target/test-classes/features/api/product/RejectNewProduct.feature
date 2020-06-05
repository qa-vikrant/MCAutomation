Feature: API -  Product - Reject New Product. put - /product/reject

        As a seller user
        user want to reject a newly added product on marketcube

        As a vendor user
        user want to reject a newly added product on marketcube


  Scenario Outline: Login with valid registered user details as a seller and user wants to reject a newly added product on marketcube
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | HaiVikki12     |
    Then user should be able to login to the system and store token
    When user enters the product details that he wants to reject
      | id      | seller   |
      | <id>    | <seller> |
    And user make a request to reject the desired product
    Then user should be able to reject the desired product
      | 5e65e7fc49300c0e10f1dc4a |
    Examples:
      | id                       | seller                   |
      | 5e902d129f60f90013c34c48 | 5e29912fbfec74a0272e9a92 |


  Scenario Outline: Login with valid registered user details as a vendor and user wants to reject a newly added product on marketcube
    When User is able to log into application
      | email                                 | password       |
      | vikrant.singh@successive.tech         | 1234567890     |
    Then user should be able to login to the system and store token
    When user enters the product details that he wants to reject
      | id      | seller   |
      | <id>    | <seller> |
    And user make a request to reject the desired product
    Then user should be able to reject the desired product
      | 5e65e7fc49300c0e10f1dc4a |
    Examples:
      | id                       | seller                   |
      | 5e908efc1e02270012432fbe | 5e29912fbfec74a0272e9a92 |