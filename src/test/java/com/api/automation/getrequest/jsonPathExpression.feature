Feature: To use JSONPath Expression

Background: Set the baseURL
Given url 'http://localhost:9897'

Scenario: To get the value of the property using JsonPath expression

	And path '/normal/webapi/all' 
	And header Accept = 'application/json'
	When method get 
	Then status 200 
	# karate.jsonPath(doc, jsonPathExpression)
	* def JobID = 1
	* def jobTitle = karate.jsonPath(response, "$[?(@.jobId == "+ JobID +")].jobTitle ")
	* def jobDesc = karate.jsonPath(response, "$[?(@.jobId == 1)].jobDescription ")
	* def experience = karate.jsonPath(response, "$[?(@.jobId == 1)].experience ")
	And print "JT ==>",jobTitle
	And print "Job Desc ==>",jobDesc
	And print "Job Exp ==>",experience