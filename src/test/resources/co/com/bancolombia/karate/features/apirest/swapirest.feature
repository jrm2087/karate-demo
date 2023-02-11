Feature: The Star Wars Api Rest

  Background: Set urlBase
    * url urlBase
    * def SpeciesSchema = read('../schemas/SpeciesSchema.json')

  @API2
  Scenario: GET name people not null
    Given path '/api/people'
    When method GET
    Then status 200
    * match each $.results[*].name != '#null'

  @API
  Scenario: GET Name People String
    Given path '/api/people'
    When method GET
    Then status 200
    * match each $.results[*].name == '#string'

  @API
  Scenario: GET Species
    Given path '/api/species'
    When method GET
    Then status 200
    * match each $.results[*] == SpeciesSchema

  @API
  Scenario: GET Planets
    Given path '/api/planets'
    When method GET
    Then status 200
    * match $.results[*].name contains ['Tatooine','Alderaan','Hoth']

  @API
  Scenario: GET Vehicles [0]
    Given path '/api/vehicles'
    When method GET
    Then status 200
    * match $.results[0].name == 'Sand Crawler'

  @API
  Scenario: GET Assert
    Given path '/api/vehicles'
    When method GET
    Then status 200
    * def name = $.results[0].name
    * def model = $.results[0].model
    * assert name + ' ' + model == 'Sand Crawler Digger Crawler'

