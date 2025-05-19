Feature: To validate Get endpoint response 

Background: Setup the Base Path 
	Given url 'http://localhost:9897' 
	And print '========This is Background Keyword========' 
	
Scenario: To get all data from APP in JSON Path using Path variable  and validate from JSON file
	And path '/normal/webapi/all' 
	And header Accept = 'application/json' 
	When method get 
	Then status 200 
	* def actualResponse = read("../JSONResponse.json")
		And print "JSON File ==> ", actualResponse
	And match response == actualResponse
	
	
	Scenario: To get all data from APP in JSON Path using Path variable  and validate from XML file
	And path '/normal/webapi/all' 
	And header Accept = 'application/xml' 
	When method get 
	Then status 200 
	* def actualResponse = read("../JSONResponse.xml")
		And print "XML File ==> ", actualResponse
	And match response == actualResponse
	
	
	

