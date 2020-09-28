Feature: Location restriction

Scenario: Location control on all resources that have location defined
    Given I have a resource defined that supports location
    When it has location
    Then its value must match the "^eur(4|3)$|^europe-(north1|west(1|3|4))$" regex