@ignore
Feature: To test get endpoints of the application 

Scenario: Validate GET endpoint with JSON Data 
	Given the application URL 'www.google.com' 
	And the context path is '/getdata' 
	When I send the Get Request 
	Then status code should be 200 
	And Response format shound be JSON 
	

Scenario: Validate GET endpoint with XML Data 
	Given the application URL 'www.google.com' 
	And the context path is '/getdata' 
	When I send the Get Request 
	Then status code should be 200 
	And Response format shound be JSON