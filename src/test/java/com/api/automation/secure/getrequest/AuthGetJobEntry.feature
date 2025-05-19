Feature: To test GET endpoints using basic auth

Background: Setup the Base Path 
	Given url 'http://localhost:9897' 
	And print '========This is Background Keyword========' 
	
Scenario: To test GET endpoints using basic auth process
Given path '/secure/webapi/all' 
And headers {Accept : 'application/json', Authorization : 'Basic YWRtaW46d2VsY29tZQ=='}
	When method get
	Then status 200
	And match response == '#notnull' 
	
	
Scenario: To test GET endpoints without basic auth process
Given path '/secure/webapi/all' 
And headers {Accept : 'application/xml'}
	When method get
	Then status 401
	And match response == '#notnull' 
	
	
Scenario: To test GET endpoints using basic auth via js function
Given path '/secure/webapi/all' 
* def auth = call read('../../basicAuth.js') {username : 'admin', password : 'welcome'}
And headers {Accept : 'application/json', Authorization : '#(auth)'}
	When method get
	Then status 200
	And match response == '#notnull' 