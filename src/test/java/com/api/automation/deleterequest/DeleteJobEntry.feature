Feature: To create job entry and then delete it

Background: Setup the base Url
Given url 'http://localhost:9897'
And print "===========Background Initialization=========="

@Regression
Scenario: To create job entry using helper feature file

* def getRandomValue = function() {return Math.floor((100) * Math.random());}
* def createJobID = getRandomValue()
Given call read("../AddJobEntryWithVariables.feature") {_url : 'http://localhost:9897', _path : '/normal/webapi/add', _id : '#(createJobID)' }

#Delete Job entry
Given path '/normal/webapi/remove/' + createJobID
And headers {Accept : "application/json"}
Then method delete
And status 200

#Get Job entry to validate 
Given path '/normal/webapi/find'
#And param id = ID
#And param jobTitle = 'Software Engg-2'
And params {id : '#(createJobID)',jobTitle :'Software Engg-2'}
And headers {Accept : "application/json"}
When method get
Then status 404

@Smoke
Scenario: To create job entry using helper feature file and delete it and call delete req twice

* def getRandomValue = function() {return Math.floor((100) * Math.random());}
* def createJobID = getRandomValue()
Given call read("../AddJobEntryWithVariables.feature") {_url : 'http://localhost:9897', _path : '/normal/webapi/add', _id : '#(createJobID)' }

#Delete Job entry
Given path '/normal/webapi/remove/' + createJobID
And headers {Accept : "application/json"}
Then method delete
And status 200

#Delete Job entry 2nd time
Given path '/normal/webapi/remove/' + createJobID
And headers {Accept : "application/json"}
Then method delete
And status 404

@Sanity
Scenario: To demo request chaining
# Create job entry
# Extract jobid and jobtitle from response of POST req
# Send patch request 
# Extract jobid and jobtitle from response of PATCH req
# Get Req using query param 
# Add validation on GET Req.
* def getRandomValue = function() {return Math.floor((100) * Math.random());}
* def createJobID = getRandomValue()
* def createJob = call read("../AddJobEntryWithVariables.feature") {_url : 'http://localhost:9897', _path : '/normal/webapi/add', _id : '#(createJobID)' }
* def jobId = createJob.responseJobID
* def jobTitle = createJob.responseJobTitle
And print jobId
And print jobTitle

#Patch Request
* def jobDesc = "To develop Hybrid iOS application"
Given path '/normal/webapi/update/details'
And params {id : '#(jobId)',jobTitle :'#(jobTitle)', jobDescription : '#(jobDesc)'}
And headers {Accept : "application/json"}
When method patch
Then status 200
* def jobId = response.jobId
* def jobTitle = response.jobTitle

#Get Request
Given path '/normal/webapi/find'
#And param id = ID
#And param jobTitle = 'Software Engg-2'
And params {id : '#(jobId)', jobTitle :'#(jobTitle)'}
And headers {Accept : "application/json"}
When method get
Then status 200
And match response.jobDescription == jobDesc

