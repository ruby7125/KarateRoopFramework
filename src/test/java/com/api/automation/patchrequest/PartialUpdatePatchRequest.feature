Feature: To create job entry in the application using helper feature file and update partial info using patch req.

Background: Setup the base Url
Given url 'http://localhost:9897'
And print "===========Background Initialization=========="

@Regression
Scenario: To create job entry using helper feature file

* def getRandomValue = function() {return Math.floor((100) * Math.random());}
* def createJobID = getRandomValue()
Given call read("../AddJobEntryWithVariables.feature") {_url : 'http://localhost:9897', _path : '/normal/webapi/add', _id : '#(createJobID)' }

#Update Job entry using Patch request using query param
Given path '/normal/webapi/update/details'
#And param id = ID
#And param jobTitle = 'Software Engg-2'
* def  jobDesc = "To develop Hybrid iOS application"
And params {id : '#(createJobID)',jobTitle :'Software Engg-2', jobDescription : '#(jobDesc)'}
And headers {Accept : "application/json"}
When method patch
Then status 200
And match response.jobDescription == jobDesc

@Smoke
Scenario: To create job entry using helper feature file and patch request without jobtitle query

* def getRandomValue = function() {return Math.floor((100) * Math.random());}
* def createJobID = getRandomValue()
Given call read("../AddJobEntryWithVariables.feature") {_url : 'http://localhost:9897', _path : '/normal/webapi/add', _id : '#(createJobID)' }

#Update Job entry using Patch request using query param
Given path '/normal/webapi/update/details'
#And param id = ID
#And param jobTitle = 'Software Engg-2'
* def  jobDesc = "To develop Hybrid iOS application"
And params {id : '#(createJobID)', jobDescription : '#(jobDesc)'}
And headers {Accept : "application/json"}
When method patch
Then status 400
And match response.message contains "'jobTitle' is not present"