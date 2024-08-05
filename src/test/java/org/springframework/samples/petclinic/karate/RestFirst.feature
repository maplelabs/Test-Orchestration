Feature: first project

  Background:
    * def testData = read('petclinic_testdata.json')
     * def baseurl = java.lang.System.getenv('BASE_URL')

  Scenario: Test API
#    Given url ccUrl
 #   When method get
    #Then status 200
    * def baseurl = read('customEnvConfig.json')
    * print baseurl.baseurl


  Scenario: Add owner
    # * def baseurl = read('customEnvConfig.json')
    Given url baseurl+"petclinic/api/owners"
    And request testData.owners[0]
    #And request {"firstName":"Ankit","lastName":"T","address":"110 W. Liberty St.","city":"Madison","telephone":"6085551045"}
    When method post
    Then status 201

    * def id = response.id
    And print id
    * def jsonObject =
      """
      {
        "id": '#(id)'
      }
      """
    * def user = call read('sub1/Get.feature') jsonObject
    * print user
