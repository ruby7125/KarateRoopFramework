Feature: Validate JSON schema
# Use http://localhost:9897/normal/webapi/add as base URL

Background: Create and initialize baseURL
Given url 'http://localhost:9897'
And print "===========Background Initialization=========="

Scenario: To create job entry using JSON req body and getting response in JSON
Given path '/normal/webapi/add'
* def body = read("data/jobEntry.json")
And request body
And headers {Accept : "application/json", Content-Type: "application/json"}
When method post
And status 201
And print response
And match response ==
"""
{
    "jobId": '#number',
    "jobTitle": '#string',
    "jobDescription": '#string',
    "experience": '#[] #string',
    "project": '#[] #object'
}
"""

Scenario: To get all data from APP in XML Path using Path variable 

	And path '/normal/webapi/all' 
	And header Accept = 'application/json'
	When method get 
	Then status 200 
	* def projectSchema = {"projectName": '#string', "technology" : '#[] #string' }
	* def mainSchema = {"jobId": '#number', "jobTitle" : '#string', "jobDescription" :'#string', "experience" : '#[] #string', "project" : '#[] ##(projectSchema)' }
	And match response ==
	
	"""
	'#[] ##(mainSchema)'
	
	"""



