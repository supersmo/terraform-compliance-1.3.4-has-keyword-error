Feature: Location restriction

Scenario: Location control on all resources that have location defined
    Given I have resource that supports location defined
    When it has location
    Then its value must match the "^eur(4|3)$|^europe-(north1|west(1|3|4))$" regex