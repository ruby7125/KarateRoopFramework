Feature: To create job entry in the application.

Background: Setup the base Url
Given url 'http://localhost:9897'
And print "===========Background Initialization=========="

Scenario: To create job entry in JSON format and update it.
Given path '/normal/webapi/add'
# * def getRandomValue = function() {return Math.floor((100) * Math.random());}
# * def ID = getRandomValue()
And request {"jobId":123,"jobTitle":"Software Engg-2","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
And headers {Accept : "application/json", Content-Type: "application/json"}
When method post
Then status 201
And print response