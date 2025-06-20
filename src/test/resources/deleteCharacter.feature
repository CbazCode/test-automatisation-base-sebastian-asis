Feature: Pruebas para el endpoint DELETE /characters/{id}

  Background:
    * def baseUrl = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters'

  Scenario: Eliminar un personaje existente exitosamente
    Given url baseUrl + '/80'
    When method DELETE
    Then status 204

  Scenario: Eliminar un personaje inexistente retorna error
    Given url baseUrl + '/999999'
    When method DELETE
    Then status 404
    And match response contains { error: '#string' }
