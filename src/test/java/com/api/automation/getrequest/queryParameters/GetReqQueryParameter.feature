Feature: To create job entry in the application using helper feature file and get using query param.

Background: Setup the base Url
Given url 'http://localhost:9897'
And print "===========Background Initialization=========="

Scenario: To create job entry using helper feature file

* def getRandomValue = function() {return Math.floor((100) * Math.random());}
* def ID = getRandomValue()
Given call read("../../AddJobEntryWithVariables.feature") {_url : 'http://localhost:9897', _path : '/normal/webapi/add', _id : '#(ID)' }

#Send Get request using query param
Given path '/normal/webapi/find'
#And param id = ID
#And param jobTitle = 'Software Engg-2'
And params {id : '#(ID)',jobTitle :'Software Engg-2'}
And headers {Accept : "application/json"}
When method get
Then status 200
And match response.jobId == ID

