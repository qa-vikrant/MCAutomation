Feature: API - Register supplier as a user

  As a new user
  I want to invite vendor by data in bulk
  So that vendor can register himself

  Scenario: Seller send bulk invite to vendor by data
    When User is able to log into application
      |email                     | password  |
      |mohit.agrawal@successive.tech | Mohit@1989 |
    Then user should be able to login to the system and store token
    When user enters email ids
      | mohit.agrawal@successive.tech |
      | mohit.agrawal@successive.tech |
    And  user enters details of Message
      |message| subject |
      | This is message | sub |
    And user enter details of messageData for list
      | storeName | url |
      | testing   | http://www.google.com |
    And user enter details of sentBy
      | type | userid |
      | testinguser | userID |
    Then invite should be sent

  Scenario: Seller send bulk invite to vendor by data with no email provided
    When User is able to log into application
      |email                     | password  |
      |mohit.agrawal@successive.tech | Mohit@1989 |
    Then user should be able to login to the system and store token
    When user enters email ids
      ||
    And  user enters details of Message
      |message| subject |
      | This is message | sub |
    And user enter details of messageData for list
      | storeName | url |
      | testing   | http://www.google.com |
    And user enter details of sentBy
      | type | userid |
      | testinguser | userID |
    Then invite should not be sent when no email provided

  Scenario: Seller send bulk invite to vendor by data with no sendBy provided
    When User is able to log into application
      |email                     | password  |
      |mohit.agrawal@successive.tech | Mohit@1989 |
    Then user should be able to login to the system and store token
    When user enters email ids
      | mohit.agrawal@successive.tech |
    And  user enters details of Message
      |message| subject |
      | This is message | sub |
    And user enter details of messageData for list
      | storeName | url |
      | testing   | http://www.google.com |
    And user enter details of sentBy
      | type | userid |
      |  |  |
    Then invite should not be sent when no sentBy provided

  Scenario: Seller send bulk invite to vendor by data with no message provided
    When User is able to log into application
      |email                     | password  |
      |mohit.agrawal@successive.tech | Mohit@1989 |
    Then user should be able to login to the system and store token
    When user enters email ids
      | mohit.agrawal@successive.tech |
    And  user enters details of Message
      |message| subject |
      |||
    And user enter details of messageData for list
      | storeName | url |
      | testing   | http://www.google.com |
    And user enter details of sentBy
      | type | userid |
      | testinguser | userID |
    Then invite should not be sent when no message provided