Feature: Obtener personaje por ID

  Background:
    * def baseUrl = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters'

  Scenario: Obtener un personaje válido por ID
    Given url baseUrl + '/157'
    When method GET
    Then status 200

  Scenario: Obtener un personaje con ID inexistente debe retornar 404
    Given url baseUrl + '/999999'
    When method GET
    Then status 404

  Scenario: Obtener un personaje con ID no numérico debe retornar 504
    Given url baseUrl + '/abc'
    When method GET
    Then status 500

  Scenario: Obtener un personaje con ID negativo debe retornar 404
    Given url baseUrl + '/-1'
    When method GET
    Then status 404

  Scenario: Obtener un personaje con ID decimal debe retornar 500
    Given url baseUrl + '/3.14'
    When method GET
    Then status 500

  Scenario: Obtener un personaje sin especificar ID debe retornar el arreglo de caracteres
    Given url baseUrl
    When method GET
    Then status 200
    And match response == '#[]'
