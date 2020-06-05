Feature: API-Product - Approve Seller Changes of a product. put  /product/approve-seller

       Login as a registered user(System admin/seller/vendor)
       I want to Approve Seller Changes of a product

  Scenario Outline: Login with valid registered user details as a seller and user wants to Approve seller changes of a product
    When User is able to log into application
      | email                             | password      |
      | vikrant.singh@successive.tech     | HaiVikki432   |
    Then user should be able to login to the system and store token
    And user enters the productId and selelrId for approve seller changes of a product
      |  id          |  seller           |
      |  <id>        |  <seller>         |
    And user make a request to approve seller changes of a product
    Then user should be able to approve seller changes of a product
    Examples:
      |  id                        |  seller                     |
      |  5eb3e18fa1a8330011f849b3  |  5e467ab03dcebee6ad14a23f   |
