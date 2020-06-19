Feature: API -  Email - Mute Notification.  post  /email/mute-notification

         As a registered user
         I want to mute Email Notification

  Scenario: Login with valid registered user details as a seller and user wants to mute all Email notification
    When User is able to log into application
      | email                                 | password        |
      | vikrant.singh@successive.tech         | HaiVikki432     |
    Then User should be able to login to the system and store token
    When user enter label information that needs to be muted
      | newOrderSeller                          |
      | packingSlip                             |
      | productBulkUploadNotification           |
      | productBulkUploadNotificationError      |
      | productsEditSeller                      |
      | productsResubmitSeller                  |
      | supplierJoined                          |
      | supplierAcceptsOrder                    |
      | supplierRejectsOrder                    |
      | vendorBulkUploadNotification            |
      | vendorBulkUploadNotificationError       |
    And user enter reset information
      | isResetAll  |
      | false       |
    And user make a request to mute Email notificaiton for their respective label
    Then user should be able to mute Email notificaiton


  Scenario: Login with valid registered user details as a seller and user wants to Un-mute all Email notification
    When User is able to log into application
      | email                                 | password        |
      | vikrant.singh@successive.tech         | HaiVikki432     |
    Then User should be able to login to the system and store token
    When user enter label information that needs to be muted
      ||
    And user enter reset information
      | isResetAll  |
      | true        |
    And user make a request to Un-mute Email notificaiton
    Then user should be able to Un-mute Email notificaiton


  Scenario: Login with valid registered user details as a seller and user wants to mute email notification for their selected labels
    When User is able to log into application
      | email                                 | password        |
      | vikrant.singh@successive.tech         | HaiVikki432     |
    Then User should be able to login to the system and store token
    When user enter label information that needs to be muted
      | newOrderSeller                          |
      | vendorBulkUploadNotification            |
    And user enter reset information
      | isResetAll  |
      | false       |
    And user make a request to mute Email notificaiton for their respective label
    Then user should be able to mute Email notificaiton





  Scenario: Login with valid registered user details as a vendor and user wants to mute all Email notification
    When User is able to log into application
      | email                                 | password        |
      | vikrant.singh@successive.tech         | HaiVikki4321    |
    Then User should be able to login to the system and store token
    When user enter label information that needs to be muted
      | newOrderSupplier                        |
      | packingSlip                             |
      | productBulkUploadNotification           |
      | productBulkUploadNotificationError      |
      | productsEditApproved                    |
      | productsDeleteSupplier                  |
      | productsEditSupplier                    |
      | productsRejectedSupplier                |
      | sellerAcceptsOrder                      |
      | sellerRejectsOrder                      |
      | shipmentBySeller                        |
      | productsApprovedSupplier                |
      | vendorProfileUpdate                     |
    And user enter reset information
      | isResetAll  |
      | false       |
    And user make a request to mute Email notificaiton for their respective label
    Then user should be able to mute Email notificaiton


  Scenario: Login with valid registered user details as a vendor and user wants to Un-mute all Email notification
    When User is able to log into application
      | email                                 | password        |
      | vikrant.singh@successive.tech         | HaiVikki4321    |
    Then User should be able to login to the system and store token
    When user enter label information that needs to be muted
      ||
    And user enter reset information
      | isResetAll  |
      | true        |
    And user make a request to Un-mute Email notificaiton
    Then user should be able to Un-mute Email notificaiton


  Scenario: Login with valid registered user details as a vendor and user wants to mute email notification for their respective labels
    When User is able to log into application
      | email                                 | password        |
      | vikrant.singh@successive.tech         | HaiVikki4321    |
    Then User should be able to login to the system and store token
    When user enter label information that needs to be muted
      | newOrderSupplier         |
      | vendorProfileUpdate      |
    And user enter reset information
      | isResetAll  |
      | false       |
    And user make a request to mute Email notificaiton for their respective label
    Then user should be able to mute Email notificaiton







  Scenario: Login with valid registered user details as a seller and user wants to Mute Email notification for their respective single label
    When User is able to log into application
      | email                                 | password        |
      | vikrant.singh@successive.tech         | HaiVikki432     |
    Then User should be able to login to the system and store token
    When user enter label information and reset information that needs to be muted
      | label          | isResetAll  |
      | newOrderSeller | false       |
    And user make a request to mute Email notificaiton for their respective single label
    Then user should be able to mute Email notificaiton


  Scenario: Login with valid registered user details as a vendor and user wants to Mute Email notification for their respective single label
    When User is able to log into application
      | email                                 | password        |
      | vikrant.singh@successive.tech         | HaiVikki4321    |
    Then User should be able to login to the system and store token
    When user enter label information and reset information that needs to be muted
      | label            | isResetAll  |
      | newOrderSupplier | false       |
    And user make a request to mute Email notificaiton for their respective single label
    Then user should be able to mute Email notificaiton





  Scenario: Login with valid registered user details as a seller and user wants to Un-Mute Email notification for their respective single label
    When User is able to log into application
      | email                                 | password        |
      | vikrant.singh@successive.tech         | HaiVikki432     |
    Then User should be able to login to the system and store token
    When user enter label information and reset information that needs to be muted
      | label          | isResetAll  |
      | newOrderSeller | true        |
    And user make a request to mute Email notificaiton for their respective single label
    Then user should be able to mute Email notificaiton


  Scenario: Login with valid registered user details as a vendor and user wants to Un-Mute Email notification for their respective single label
    When User is able to log into application
      | email                                 | password        |
      | vikrant.singh@successive.tech         | HaiVikki4321    |
    Then User should be able to login to the system and store token
    When user enter label information and reset information that needs to be muted
      | label            | isResetAll  |
      | newOrderSupplier | true        |
    And user make a request to mute Email notificaiton for their respective single label
    Then user should be able to mute Email notificaiton






  Scenario: Login with valid registered user details and try to mute email notificaiton without providing label details
    When User is able to log into application
      | email                                 | password        |
      | vikrant.singh@successive.tech         | HaiVikki432     |
    Then User should be able to login to the system and store token
    When user enter label information that needs to be muted
      ||
    And user enter reset information
      | isResetAll  |
      | false       |
    And user make a request to mute Email notificaiton for their respective label
    Then user should not be able to mute Email notificaiton for their respective label and user should get validation error message
      | Label is required. |