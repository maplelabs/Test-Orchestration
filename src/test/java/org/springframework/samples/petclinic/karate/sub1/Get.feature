Feature: Get request

  Scenario: new user fetch
    * def baseurl = read("customEnvConfig.json")
    Given url baseurl.baseurl + "petclinic/api/owners/" + jsonObject.id
  #Given url 'http://localhost:9966/petclinic/api/owners/'+jsonObject.id
    When method get
    #Then status 200
