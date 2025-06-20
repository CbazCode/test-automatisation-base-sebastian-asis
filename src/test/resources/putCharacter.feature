Feature: Pruebas para el endpoint PUT /characters/{id}

  Background:
    * def baseUrl = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters'

  Scenario: Actualizar un personaje existente
    Given url baseUrl + '/157'
    And request
      """
      {
        "name": "Iron Man",
        "alterego": "Tony Stark",
        "description": "Updated description",
        "powers": ["Armor", "Flight"]
      }
      """
    When method PUT
    Then status 200
    And match response == 
      """
      {
        "id": 157,
        "name": "Iron Man",
        "alterego": "Tony Stark",
        "description": "Updated description",
        "powers": ["Armor", "Flight"]
      }
      """

  Scenario: Actualizar personaje con ID inexistente debe retornar 404
    Given url baseUrl + '/999999'
    And request
      """
      {
        "name": "Iron Man",
        "alterego": "Tony Stark",
        "description": "Updated description",
        "powers": ["Armor", "Flight"]
      }
      """
    When method PUT
    Then status 404

  Scenario: Actualizar personaje con datos inválidos debe retornar 400
    Given url baseUrl + '/157'
    And request
      """
      {
        "name": "",
        "alterego": "Tony Stark",
        "description": "Updated description",
        "powers": []
      }
      """
    When method PUT
    Then status 400
