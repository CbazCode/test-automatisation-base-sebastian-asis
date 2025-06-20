Feature: Obtener todos los personajes

  Background:
    * configure ssl = true
    * url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api'
    * path 'characters'
    * method GET
    * status 200
    * def response = response

  Scenario: La respuesta es una lista no vacía
    * match response == '#[]'
    * assert response.length > 0

  Scenario: Todos los personajes tienen al menos un poder
    * def allHavePowers = function(x){ return x.powers.length > 0 }
    * assert response.every(allHavePowers)

  Scenario: Al menos un personaje tiene más de 5 poderes
    * def hasManyPowers = function(x){ return x.powers.length > 5 }
    * assert response.filter(hasManyPowers).length > 0
