Feature: To create job entry in the application.


Scenario: To create job entry in JSON format and update it.
Given url _url
And path _path
And print "Var 1==>", _url
And print "Var 1==>", _path
And print "Var 1==>", _id

And request {"jobId":'#(_id)',"jobTitle":"Software Engg-2","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
And headers {Accept : "application/json", Content-Type: "application/json"}
When method post
Then status 201
And print response
* def responseJobID = response.jobId
* def responseJobTitle = response.jobTitle