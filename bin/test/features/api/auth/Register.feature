Feature: API - Register as a direct user

  As a new user
  I want to get regsitered on marketcube
  So that I am able to access the platform and manage my inventory

  Scenario: Register directly on marketcube as a vendor
    When User request to get registered into the system
    |email    | password      |
    |user+    | 123456789     |
    Then User should be registered successfully into the system

  Scenario: Register directly on marketcube as a vendor with already registered email
    When User request to get registered into the system
      |email                             | password      |
      |systemadmin@marketcube.io         | 123456789     |
    Then User should get message as ""

