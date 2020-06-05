Feature: API - Auth - Register supplier by Seller / SystemAdmin--  post--  /user/register-supplier

    As a seller
    I want to register a supplier on marketcube
    So that supplier is able to access the platform and manage my inventory

  Scenario Outline: Login with valid registered user details as a seller and user want to create new vendor themselves using their form
    When User is able to log into application
      | email                          | password    |
      | vikrant.singh@successive.tech  | 1234@Vik    |
    Then User should be able to login to the system and store token
    And user enters details of new vendor
      | email        | brandName   | firstName   | lastName   | phoneNumber   | address      | city    | country   |  pinCode   | isReadOnly   | isOtp   | isVerified   | isVendor   | password   |
      | <email>      | <brandName> | <firstName> | <lastName> | <phoneNumber> | <address>    | <city>  | <country> |  <pinCode> | <isReadOnly> | <isOtp> | <isVerified> | <isVendor> | <password> |
    And user make a request to register supplier
    Then new vendor should be registered successfully into the system
    Examples:
      | email          | brandName | firstName | lastName | phoneNumber | address         | city  | country |  pinCode |isReadOnly | isOtp | isVerified | isVendor | password   |
      | vikrant.singh+ | Testing   | Vikrant   | Singh    | 9898989898  | testing address | Noida | India   | 201301   | false     | true  | true       | true     | Mohit@1989 |



  Scenario Outline: Login with valid registered user details as a System-Admin and user want to create new vendor using their form
    When User is able to log into application
      | email                          | password    |
      | systemadmin@marketcube.io      | 12345678n@N |
    Then User should be able to login to the system and store token
    And user enters details of new vendor
      | email        | brandName   | firstName   | lastName   | phoneNumber   | address      | city    | country   |  pinCode   | isReadOnly   | isOtp   | isVerified   | isVendor   | password   |
      | <email>      | <brandName> | <firstName> | <lastName> | <phoneNumber> | <address>    | <city>  | <country> |  <pinCode> | <isReadOnly> | <isOtp> | <isVerified> | <isVendor> | <password> |
    And user make a request to register supplier
    Then new vendor should be registered successfully into the system
    Examples:
      | email          | brandName | firstName | lastName | phoneNumber | address         | city  | country |  pinCode |isReadOnly | isOtp | isVerified | isVendor | password   |
      | vikrant.singh+ | Testing   | Vikrant   | Singh    | 9898989898  | testing address | Noida | India   | 201301   | false     | true  | true       | true     | Mohit@1989 |



  Scenario Outline: Login with valid registered user details as a Vendor and user want to create new vendor themselves using their form
    When User is able to log into application
      | email                                 | password    |
      | vikrant.singh+62@successive.tech      | 1234567890  |
    Then User should be able to login to the system and store token
    And user enters details of new vendor
      | email        | brandName   | firstName   | lastName   | phoneNumber   | address      | city    | country   |  pinCode   | isReadOnly   | isOtp   | isVerified   | isVendor   | password   |
      | <email>      | <brandName> | <firstName> | <lastName> | <phoneNumber> | <address>    | <city>  | <country> |  <pinCode> | <isReadOnly> | <isOtp> | <isVerified> | <isVendor> | <password> |
    And user make a request to register supplier
    Then user should not be able to register new supplier and user should get validation error message
      |  User is not authorized to perform this action.  |
    Examples:
      | email          | brandName | firstName | lastName | phoneNumber | address         | city  | country |  pinCode |isReadOnly | isOtp | isVerified | isVendor | password   |
      | vikrant.singh+ | Testing   | Vikrant   | Singh    | 9898989898  | testing address | Noida | India   | 201301   | false     | true  | true       | true     | Mohit@1989 |




  Scenario Outline: Login with valid registered user details as a seller and without follow field validation user want to create new vendor themselves using their form
    When User is able to log into application
      | email                          | password    |
      | vikrant.singh@successive.tech  | 1234@Vik    |
    Then User should be able to login to the system and store token
    And user enters details of new vendor
      | email        | brandName   | firstName   | lastName   | phoneNumber   | address      | city    | country   |  pinCode   | isReadOnly   | isOtp   | isVerified   | isVendor   | password   |
      | <email>      | <brandName> | <firstName> | <lastName> | <phoneNumber> | <address>    | <city>  | <country> |  <pinCode> | <isReadOnly> | <isOtp> | <isVerified> | <isVendor> | <password> |
    And user make a request to register supplier
    Then user should not be able to register new supplier and user should get validation error message
      | Email is required.                                      |
      | IsVendor is required.                                   |
      | Password is required.                                   |
      | FirstName is required.                                  |
      | LastName is required.                                   |
      | PhoneNumber is required.                                |
      | BrandName is required.                                  |
      | Address is required.                                    |
      | City is required.                                       |
      | Country is required.                                    |
      | pinCode is required.                                    |
      | Password should be minimum 8 characters long            |
      | Invalid email provided                                  |
    Examples:
      | email          | brandName | firstName | lastName | phoneNumber | address         | city  | country |  pinCode |isReadOnly | isOtp | isVerified | isVendor | password   |
      |                | Testing   | Vikrant   | Singh    | 9898989898  | testing address | Noida | India   | 201301   | false     | true  | true       | true     | Mohit@1989 |
      | vikrant.singh+ | Testing   | Vikrant   | Singh    | 9898989898  | testing address | Noida | India   | 201301   | false     | true  | true       |          | Mohit@1989 |
      | vikrant.singh+ | Testing   | Vikrant   | Singh    | 9898989898  | testing address | Noida | India   | 201301   | false     | true  | true       | true     |            |
      | vikrant.singh+ | Testing   |           | Singh    | 9898989898  | testing address | Noida | India   | 201301   | false     | true  | true       | true     | Mohit@1989 |
      | vikrant.singh+ | Testing   | Vikrant   |          | 9898989898  | testing address | Noida | India   | 201301   | false     | true  | true       | true     | Mohit@1989 |
      | vikrant.singh+ | Testing   | Vikrant   | Singh    |             | testing address | Noida | India   | 201301   | false     | true  | true       | true     | Mohit@1989 |
      | vikrant.singh+ |           | Vikrant   | Singh    | 9898989898  | testing address | Noida | India   | 201301   | false     | true  | true       | true     | Mohit@1989 |
      | vikrant.singh+ | Testing   | Vikrant   | Singh    | 9898989898  |                 | Noida | India   | 201301   | false     | true  | true       | true     | Mohit@1989 |
      | vikrant.singh+ | Testing   | Vikrant   | Singh    | 9898989898  | testing address |       | India   | 201301   | false     | true  | true       | true     | Mohit@1989 |
      | vikrant.singh+ | Testing   | Vikrant   | Singh    | 9898989898  | testing address | Noida |         | 201301   | false     | true  | true       | true     | Mohit@1989 |
      | vikrant.singh+ | Testing   | Vikrant   | Singh    | 9898989898  | testing address | Noida | India   |          | false     | true  | true       | true     | Mohit@1989 |
      | vikrant.singh+ | Testing   | Vikrant   | Singh    | 9898989898  | testing address | Noida | India   | 201301   | false     | true  | true       | true     | Mohit@1    |
      | goog@tech@tec  | Testing   | Vikrant   | Singh    | 9898989898  | testing address | Noida | India   | 201301   | false     | true  | true       | true     | Mohit@1989 |



  Scenario Outline: Login with valid registered user details as a System-Admin and without follow field validation user want to create new vendor using their form
    When User is able to log into application
      | email                          | password    |
      | systemadmin@marketcube.io      | 12345678n@N |
    Then User should be able to login to the system and store token
    And user enters details of new vendor
      | email        | brandName   | firstName   | lastName   | phoneNumber   | address      | city    | country   |  pinCode   | isReadOnly   | isOtp   | isVerified   | isVendor   | password   |
      | <email>      | <brandName> | <firstName> | <lastName> | <phoneNumber> | <address>    | <city>  | <country> |  <pinCode> | <isReadOnly> | <isOtp> | <isVerified> | <isVendor> | <password> |
    And user make a request to register supplier
    Then user should not be able to register new supplier and user should get validation error message
      | Email is required.                                      |
      | IsVendor is required.                                   |
      | Password is required.                                   |
      | FirstName is required.                                  |
      | LastName is required.                                   |
      | PhoneNumber is required.                                |
      | BrandName is required.                                  |
      | Address is required.                                    |
      | City is required.                                       |
      | Country is required.                                    |
      | pinCode is required.                                    |
      | Password should be minimum 8 characters long            |
      | Invalid email provided                                  |
    Examples:
      | email          | brandName | firstName | lastName | phoneNumber | address         | city  | country |  pinCode |isReadOnly | isOtp | isVerified | isVendor | password   |
      |                | Testing   | Vikrant   | Singh    | 9898989898  | testing address | Noida | India   | 201301   | false     | true  | true       | true     | Mohit@1989 |
      | vikrant.singh+ | Testing   | Vikrant   | Singh    | 9898989898  | testing address | Noida | India   | 201301   | false     | true  | true       |          | Mohit@1989 |
      | vikrant.singh+ | Testing   | Vikrant   | Singh    | 9898989898  | testing address | Noida | India   | 201301   | false     | true  | true       | true     |            |
      | vikrant.singh+ | Testing   |           | Singh    | 9898989898  | testing address | Noida | India   | 201301   | false     | true  | true       | true     | Mohit@1989 |
      | vikrant.singh+ | Testing   | Vikrant   |          | 9898989898  | testing address | Noida | India   | 201301   | false     | true  | true       | true     | Mohit@1989 |
      | vikrant.singh+ | Testing   | Vikrant   | Singh    |             | testing address | Noida | India   | 201301   | false     | true  | true       | true     | Mohit@1989 |
      | vikrant.singh+ |           | Vikrant   | Singh    | 9898989898  | testing address | Noida | India   | 201301   | false     | true  | true       | true     | Mohit@1989 |
      | vikrant.singh+ | Testing   | Vikrant   | Singh    | 9898989898  |                 | Noida | India   | 201301   | false     | true  | true       | true     | Mohit@1989 |
      | vikrant.singh+ | Testing   | Vikrant   | Singh    | 9898989898  | testing address |       | India   | 201301   | false     | true  | true       | true     | Mohit@1989 |
      | vikrant.singh+ | Testing   | Vikrant   | Singh    | 9898989898  | testing address | Noida |         | 201301   | false     | true  | true       | true     | Mohit@1989 |
      | vikrant.singh+ | Testing   | Vikrant   | Singh    | 9898989898  | testing address | Noida | India   |          | false     | true  | true       | true     | Mohit@1989 |
      | vikrant.singh+ | Testing   | Vikrant   | Singh    | 9898989898  | testing address | Noida | India   | 201301   | false     | true  | true       | true     | Mohit@1    |
      | goog@tech@tec  | Testing   | Vikrant   | Singh    | 9898989898  | testing address | Noida | India   | 201301   | false     | true  | true       | true     | Mohit@1989 |



  Scenario Outline: user make a request to register supplier with valid vendor details field by passing Incorrect/blank token data
    And user enters details of new vendor
      | email          | brandName   | firstName   | lastName   | phoneNumber   | address         | city    | country   |  pinCode   | isReadOnly   | isOtp   | isVerified   | isVendor   | password   |
      | vikrant.singh+ | Testing     | Vikrant     | Singh      | 9898989898    | testing address | Noida   | India     | 201301     | false        | true    | true         | true       | Mohit@1989 |
    When user make a request to register new supplier with incorrect/blank token field in form of without login credentials
      |  token                      |
      | <token>                     |
    Then user should not be able to register new supplier and user should get validation error message
      | Invalid token provided          |
      | token is required.              |
    Examples:
      | token                                                |
      |  sgshhshhshhshshhshsssssssssssssssssssss             |
      |                                                      |




  Scenario Outline: Login with valid registered user details as a seller and user want to create a new vendor for already registered email.
    When User is able to log into application
      | email                          | password    |
      | vikrant.singh@successive.tech  | 1234@Vik    |
    Then User should be able to login to the system and store token
    And user enters details of new vendor
      | email        | brandName   | firstName   | lastName   | phoneNumber   | address      | city    | country   |  pinCode   | isReadOnly   | isOtp   | isVerified   | isVendor   | password   |
      | <email>      | <brandName> | <firstName> | <lastName> | <phoneNumber> | <address>    | <city>  | <country> |  <pinCode> | <isReadOnly> | <isOtp> | <isVerified> | <isVendor> | <password> |
    And user make a request to register supplier
    Then user should not be able to register new supplier and user should get validation error message
      | Already registered email.        |
    Examples:
      | email                            | brandName | firstName | lastName | phoneNumber | address         | city  | country |  pinCode |isReadOnly | isOtp | isVerified | isVendor | password   |
      | vikrant.singh+61@successive.tech | Testing   | Vikrant   | Singh    | 9898989898  | testing address | Noida | India   | 201301   | false     | true  | true       | true     | Mohit@1989 |



  Scenario Outline: Login with valid registered user details as a seller and user want to create a new vendor for Duplicate data found for Brand Handle
    When User is able to log into application
      | email                          | password    |
      | vikrant.singh@successive.tech  | 1234@Vik    |
    Then User should be able to login to the system and store token
    And user enters details of new vendor
      | email        | brandName   | firstName   | lastName   | phoneNumber   | address      | city    | country   |  pinCode   | isReadOnly   | isOtp   | isVerified   | isVendor   | password   |
      | <email>      | <brandName> | <firstName> | <lastName> | <phoneNumber> | <address>    | <city>  | <country> |  <pinCode> | <isReadOnly> | <isOtp> | <isVerified> | <isVendor> | <password> |
    And user make a request to register supplier
    Then user should not be able to register new supplier and user should get validation error message
      | Duplicate data found for Brand Handle        |
    Examples:
      | email          | brandName | firstName | lastName | phoneNumber | address         | city  | country |  pinCode |isReadOnly | isOtp | isVerified | isVendor | password   |
      | vikrant.singh+ | Vikrant   | Vikrant   | Singh    | 9898989898  | testing address | Noida | India   | 201301   | false     | true  | true       | true     | Mohit@1989 |

