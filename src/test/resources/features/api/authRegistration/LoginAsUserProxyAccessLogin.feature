   Feature: API -- Auth - Login as a User--  post--  /user/proxy

            Login as a seller/System Admin user
            User wants to proxy access login as a vendor.


   Scenario Outline: Login with valid registered user details as a seller and user wants to proxy access login of their respective vendor
     When User is able to log into application
       | email                                 | password      |
       | vikrant.singh+60@successive.tech      | 123456789     |
     Then user should be able to login to the system and store token
     And user enters vendorId ,userRole and Access Method details of login of desired vendor
       | id                        | userRole   | onlyRead   |
       | <id>                      | <userRole> | <onlyRead> |
     And user make a request to proxy access login
     Then user should be able to proxy access login successfully
     Examples:
       | id                        | userRole | onlyRead |
       | 5eba522ef6d77600196d76f2  | vendor   | false    |
       | 5eba522ef6d77600196d76f2  | vendor   | true     |


     Scenario Outline: Login with valid registered user details as a seller and user wants his own login to access as a proxy
       When User is able to log into application
         | email                                 | password      |
         | vikrant.singh+60@successive.tech      | 123456789     |
       Then user should be able to login to the system and store token
       And user enters sellerId ,userRole and Access Method details of desired seller
         | id                        | userRole   | onlyRead   |
         | <id>                      | <userRole> | <onlyRead> |
       And user make a request to proxy access login
       Then user should not be able to proxy access login and user should get validation error message
         | User is not authorized to perform this action |
       Examples:
         | id                        | userRole | onlyRead |
         | 5e467ab03dcebee6ad14a23f  | seller   | false    |
         | 5e467ab03dcebee6ad14a23f  | seller   | true     |


     Scenario Outline: Login with valid registered user details as a seller and user wants to proxy access login of another seller
       When User is able to log into application
         | email                                 | password      |
         | vikrant.singh+60@successive.tech      | 123456789     |
       Then user should be able to login to the system and store token
       And user enters sellerId ,userRole and Access Method details of desired seller
         | id                        | userRole   | onlyRead   |
         | <id>                      | <userRole> | <onlyRead> |
       And user make a request to proxy access login
       Then user should not be able to proxy access login and user should get validation error message
         | User is not authorized to perform this action |
       Examples:
         | id                        | userRole | onlyRead |
         | 5e29912fbfec74a0272e9a92  | seller   | false    |
         | 5e29912fbfec74a0272e9a92  | seller   | true     |



   Scenario Outline: Login with valid registered user details as a vendor and user wants his own login to access as a proxy
       When User is able to log into application
         | email                                 | password      |
         | vikrant.singh+62@successive.tech      | 1234567890    |
       Then user should be able to login to the system and store token
       And user enters vendorId ,userRole and Access Method details of login of desired vendor
         | id                        | userRole   | onlyRead   |
         | <id>                      | <userRole> | <onlyRead> |
       And user make a request to proxy access login
       Then user should not be able to proxy access login and user should get validation error message
         | User is not authorized to perform this action |
       Examples:
         | id                        | userRole | onlyRead |
         | 5eba522ef6d77600196d76f2  | vendor   | false    |



   Scenario Outline: Login with valid registered user details as a vendor and user wants to proxy access login of another vendor
       When User is able to log into application
         | email                                 | password      |
         | vikrant.singh+61@successive.tech      | 1234567890    |
       Then user should be able to login to the system and store token
       And user enters vendorId ,userRole and Access Method details of login of desired vendor
         | id                        | userRole   | onlyRead   |
         | <id>                      | <userRole> | <onlyRead> |
       And user make a request to proxy access login
       Then user should not be able to proxy access login and user should get validation error message
         | User is not authorized to perform this action |
       Examples:
         | id                        | userRole | onlyRead |
         | 5eba522ef6d77600196d76f2  | vendor   | false    |




     Scenario Outline: Login with valid registered user details as a vendor and user wants to proxy access login of seller
       When User is able to log into application
         | email                                 | password      |
         | vikrant.singh+61@successive.tech      | 1234567890    |
       Then user should be able to login to the system and store token
       And user enters vendorId ,userRole and Access Method details of login of desired vendor
         | id                        | userRole   | onlyRead   |
         | <id>                      | <userRole> | <onlyRead> |
       And user make a request to proxy access login
       Then user should not be able to proxy access login and user should get validation error message
         | User is not authorized to perform this action |
       Examples:
         | id                        | userRole | onlyRead |
         | 5e467ab03dcebee6ad14a23f  | seller   | false    |



     Scenario Outline: Login with valid registered user details as a System-Admin and user wants his own login to access as a proxy
       When User is able to log into application
         | email                                 | password       |
         | systemadmin@marketcube.io             | 12345678n@N    |
       Then user should be able to login to the system and store token
       And user enters vendorId ,userRole and Access Method details of login of desired vendor
         | id                        | userRole   | onlyRead   |
         | <id>                      | <userRole> | <onlyRead> |
       And user make a request to proxy access login
       Then user should not be able to proxy access login and user should get validation error message
         | User is not authorized to perform this action |
       Examples:
         | id                        | userRole       | onlyRead |
         | 5e999aa97986205d64f98619  | system-admin   | false    |




   Scenario Outline: Login with valid registered user details as a System-Admin and user wants to proxy access login of vendor
       When User is able to log into application
         | email                                 | password       |
         | systemadmin@marketcube.io             | 12345678n@N    |
       Then user should be able to login to the system and store token
       And user enters vendorId ,userRole and Access Method details of login of desired vendor
         | id                        | userRole   | onlyRead   |
         | <id>                      | <userRole> | <onlyRead> |
       And user make a request to proxy access login
       Then user should be able to proxy access login successfully
       Examples:
         | id                        | userRole | onlyRead |
         | 5eba522ef6d77600196d76f2  | vendor   | false    |




     Scenario Outline: Login with valid registered user details as a System-Admin and user wants to proxy access login of seller
       When User is able to log into application
         | email                                 | password       |
         | systemadmin@marketcube.io             | 12345678n@N    |
       Then user should be able to login to the system and store token
       And user enters sellerId ,userRole and Access Method details of desired seller
         | id                        | userRole   | onlyRead   |
         | <id>                      | <userRole> | <onlyRead> |
       And user make a request to proxy access login
       Then user should be able to proxy access login successfully
       Examples:
         | id                        | userRole | onlyRead |
         | 5e467ab03dcebee6ad14a23f  | seller   | false    |



     Scenario Outline: Login with valid registered user details as a seller and without follow field validation user wants to proxy access login of their respective vendor
       When User is able to log into application
         | email                                 | password      |
         | vikrant.singh+60@successive.tech      | 123456789     |
       Then user should be able to login to the system and store token
       And user enters vendorId ,userRole and Access Method details of login of desired vendor
         | id                        | userRole   | onlyRead   |
         | <id>                      | <userRole> | <onlyRead> |
       And user make a request to proxy access login
       Then user should not be able to proxy access login and user should get validation error message
         | Id is required.                                  |
         | Invalid Id provided.                             |
         | Invalid Id provided.                             |
         | Invalid Id provided.                             |
         | Invalid Id provided.                             |
         | UserRole is required.                            |
         | Invalid UserRole provided.                       |
         | Invalid UserRole provided.                       |
         | onlyRead is required.                            |
         | Invalid onlyRead provided.                       |
       Examples:
         | id                        | userRole | onlyRead   |
         |                           | vendor   | false    |
         | 12345678901234567890123   | vendor   | true     |
         | 123456789012345678901234  | vendor   | false    |
         | 1234567890123456789012345 | vendor   | true     |
         | aaaaaaaaaaaaaaaaaaaaaaaa  | vendor   | false    |
         | 5eba522ef6d77600196d76f2  |          | true     |
         | 5eba522ef6d77600196d76f2  | 2sas23   | false    |
         | 5eba522ef6d77600196d76f2  | seller   | false    |
         | 5eba522ef6d77600196d76f2  | vendor   |          |
         | 5eba522ef6d77600196d76f2  | vendor   | hai2     |





     Scenario Outline: Login with valid registered user details as a System-Admin and without follow field validation user wants to proxy access login of vendor
       When User is able to log into application
         | email                                 | password       |
         | systemadmin@marketcube.io             | 12345678n@N    |
       Then user should be able to login to the system and store token
       And user enters vendorId ,userRole and Access Method details of login of desired vendor
         | id                        | userRole   | onlyRead   |
         | <id>                      | <userRole> | <onlyRead> |
       And user make a request to proxy access login
       Then user should not be able to proxy access login and user should get validation error message
         | Id is required.                                  |
         | Invalid Id provided.                             |
         | Invalid Id provided.                             |
         | Invalid Id provided.                             |
         | Invalid Id provided.                             |
         | UserRole is required.                            |
         | Invalid UserRole provided.                       |
         | Invalid UserRole provided.                       |
         | onlyRead is required.                            |
         | Invalid onlyRead provided.                       |
       Examples:
         | id                        | userRole | onlyRead   |
         |                           | vendor   | false    |
         | 12345678901234567890123   | vendor   | true     |
         | 123456789012345678901234  | vendor   | false    |
         | 1234567890123456789012345 | vendor   | true     |
         | aaaaaaaaaaaaaaaaaaaaaaaa  | vendor   | false    |
         | 5eba522ef6d77600196d76f2  |          | true     |
         | 5eba522ef6d77600196d76f2  | 2sas23   | false    |
         | 5eba522ef6d77600196d76f2  | seller   | false    |
         | 5eba522ef6d77600196d76f2  | vendor   |          |
         | 5eba522ef6d77600196d76f2  | vendor   | hai2     |




     Scenario Outline: Login with valid registered user details as a System-Admin and without follow field validation user wants to proxy access login of seller
       When User is able to log into application
         | email                                 | password       |
         | systemadmin@marketcube.io             | 12345678n@N    |
       Then user should be able to login to the system and store token
       And user enters sellerId ,userRole and Access Method details of desired seller
         | id                        | userRole   | onlyRead   |
         | <id>                      | <userRole> | <onlyRead> |
       And user make a request to proxy access login
       Then user should not be able to proxy access login and user should get validation error message
         | Id is required.                                  |
         | Invalid Id provided.                             |
         | Invalid Id provided.                             |
         | Invalid Id provided.                             |
         | Invalid Id provided.                             |
         | UserRole is required.                            |
         | Invalid UserRole provided.                       |
         | Invalid UserRole provided.                       |
         | onlyRead is required.                            |
         | Invalid onlyRead provided.                       |
       Examples:
         | id                        | userRole | onlyRead   |
         |                           | seller   | false    |
         | 12345678901234567890123   | seller   | true     |
         | 123456789012345678901234  | seller   | false    |
         | 1234567890123456789012345 | seller   | true     |
         | aaaaaaaaaaaaaaaaaaaaaaaa  | seller   | false    |
         | 5e467ab03dcebee6ad14a23f  |          | true     |
         | 5e467ab03dcebee6ad14a23f  | 2sas23   | false    |
         | 5e467ab03dcebee6ad14a23f  | vendor   | false    |
         | 5e467ab03dcebee6ad14a23f  | seller   |          |
         | 5e467ab03dcebee6ad14a23f  | seller   | hai2     |





     Scenario Outline: User make a request to proxy access login of their respective vendor with valid field by passing Incorrect/blank token data
       And user enters vendorId ,userRole and Access Method details of login of desired vendor
         | id                        | userRole   | onlyRead   |
         | 5e467ab03dcebee6ad14a23f  | seller     | false      |
       And user make a request to proxy access login with Incorrect/blank token field in form of without login credentials
         |  token                      |
         | <token>                     |
       Then user should not be able to proxy access login and user should get validation error message
         | Invalid token provided          |
         | token is required.              |
       Examples:
         | token                           |
         |  sgshhshhshhshshhsh             |
         |                                 |
