Feature: To validate Get endpoint response 

Background: Setup the Base Path 
	Given url 'http://localhost:9897' 
	And print '========This is Background Keyword========' 
	
	
Scenario: 
	To get all data from APP in JSON Path using Path variable and matching response contains deep
	And path '/normal/webapi/all' 
	And header Accept = 'application/json' 
	When method get 
	Then status 200 
	And print response 
	And match response.[0].jobId == 1 
	And match response.[0].experience[1] == 'Apple' 
	And match response.[0].project[0].projectName == 'Movie App' 
	And match response.[0].project[0].technology[2] == 'Gradle' 
	#validate size of json array
	And match response.[0].experience == '#[3]' 
	And match response.[0].project[0].technology == '#[3]' 
	#validate using wild card char
	And match response.[0].experience[*] == ["Google","Apple","Mobile Iron"] 
	And match response.[0].project[0].technology[*] == ["Kotlin","SQL Lite","Gradle"] 
	#validate using contains
	And match response.[0].experience[*] contains [,"Mobile Iron"] 
	And match response.[0].project[0].technology[*] contains ["Kotlin","Gradle"] 
	And match response.[*].jobId contains 1 
	
	
	
Scenario: 
	To get all data from APP in JSON Path and validate response using fuzzy matchers
	And path '/normal/webapi/all' 
	And header Accept = 'application/json' 
	When method get 
	Then status 200 
	And print response 
	And match response.[0].jobId == '#present'
	And match response.[0].experience[1] == '#notnull' 
	And match response.[0].project[0].projectName == '#ignore' 
	And match response.[0].project[0].technology == '#array' 
	And match response.[0].jobTitle == '#string'
	And match response.[0].jobId == '#number'
	#validate size of json array
	And match response.[0].experience == '#[3]' 
	And match response.[0].project[0].technology == '#[3]' 
	#validate using wild card char
	And match response.[0].experience[*] == ["Google","Apple","Mobile Iron"] 
	And match response.[0].project[0].technology[*] == ["Kotlin","SQL Lite","Gradle"] 
	#validate using contains
	And match response.[0].experience[*] contains [,"Mobile Iron"] 
	And match response.[0].project[0].technology[*] contains ["Kotlin","Gradle"] 
	And match response.[*].jobId contains 1 
	
	
	
