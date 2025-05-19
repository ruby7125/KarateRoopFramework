Feature: To validate Get endpoint response 

Background: Setup the Base Path 
	Given url 'http://localhost:9897' 
	And print '========This is Background Keyword========' 
	
	
Scenario: 
	To get all data from APP in JSON Path using Path variable and matching response contains deep
	And path '/normal/webapi/all' 
	And header Accept = 'application/xml' 
	When method get 
	Then status 200 
	And print response 
	And match response/List/item/jobId == '1' 
	And match response/List/item/jobTitle == 'Software Engg' 
	And match response/List/item/experience/experience[2] == 'Apple' 
	And match response/List/item/project/project/technology/technology[2] == 'SQL Lite' 
	#Skip response keyword
	And match /List/item/jobId == '1' 
	#Traverse similar to JSON(index must start from zero)
	And match response.List.item.experience.experience[1] == 'Apple' 
	
Scenario: 
	To get all data from APP in JSON Path using Path variable and matching response using fuzzy matcher
	And path '/normal/webapi/all' 
	And header Accept = 'application/xml' 
	When method get 
	Then status 200 
	And print response 
	And match response/List/item/jobId == '#notnull' 
	And match response/List/item/jobTitle == 'string' 
	And match response/List/item/experience/experience[2] == '#array' 
	And match response/List/item/project/project/technology/technology[2] == '#ignore' 
	#Skip response keyword
	And match /List/item/jobId == '1' 
	#Traverse similar to JSON(index must start from zero)
	And match response.List.item.experience.experience[1] == 'Apple'