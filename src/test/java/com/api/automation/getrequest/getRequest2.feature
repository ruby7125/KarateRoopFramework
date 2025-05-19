Feature: To test GET endpoints of the application 

Background: Setup the Base Path 
	Given url 'http://localhost:9897' 
	And print '========This is Background Keyword========' 
	
Scenario: To get all data from APP in JSON Path 
#Given url 'http://localhost:9897/normal/webapi/all' 
	Given path '/normal/webapi/all' 
	When method get
	Then status 200 
	
Scenario: To get all data from APP in JSON Path using Path variable 
#Given url 'http://localhost:9897' 
	And path '/normal/webapi/all' 
	And header Accept = 'application/json'
	When method get 
	Then status 200
	
Scenario: To get all data from APP in XML Path using Path variable 
#Given url 'http://localhost:9897' 
	And path '/normal/webapi/all' 
	And header Accept = 'application/xml'
	When method get # send the get request
	Then status 200 # response status should be 200
	
	
	
