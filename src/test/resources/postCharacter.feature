Feature: Pruebas para el endpoint POST /characters

  Background:
    * def baseUrl = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters'

    Scenario: Crear un nuevo personaje exitosamente
      Given url baseUrl
      And request
      """
        {
            "name": "Iron Man eleven",
            "alterego": "Tony Stark",
            "description": "Genius billionaire",
            "powers": ["Armor", "Flight"]
        }
      """
      When method POST
      Then status 201
  

  Scenario: Crear personaje sin nombre debe fallar
    Given url baseUrl
    And request 
    """
        {
            "alterego": 'Sin nombre',
            "description": 'Falta el nombre',
            "powers": ['Invisibilidad']
        }
    """
    When method POST
    Then status 400
    And match response contains { name: '#string' }

Scenario: Crear personaje con poderes vacíos debe fallar
    Given url baseUrl
    And request 
    """
        {
            "name": "Sin nombre",
            "alterego": 'Sin poderes',
            "description": 'Falta el poderes',
            "powers": []
        }
    """
    When method POST
    Then status 400
    And match response contains { powers: '#string' }

Scenario: Crear personaje con description vacìa debe fallar
    Given url baseUrl
    And request 
    """
        {
            "name": "Sin nombre",
            "alterego": 'Sin poderes',
            "description": '',
            "powers": ['Invisibilidad']
        }
    """
    When method POST
    Then status 400
    And match response contains { description: '#string' }

Scenario: Crear personaje con alterego vacìo debe fallar
    Given url baseUrl
    And request 
    """
        {
            "name": "Sin nombre",
            "alterego": '',
            "description": 'description',
            "powers": ['Invisibilidad']
        }
    """
    When method POST
    Then status 400
    And match response contains { alterego: '#string' }

