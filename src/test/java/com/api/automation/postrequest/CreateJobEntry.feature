Feature: To create the job entry in the application.
# Use http://localhost:9897/normal/webapi/add as base URL

Background: Setup the base Url
Given url 'http://localhost:9897'
And print "===========Background Initialization=========="

Scenario: To create job entry in JSON format and getting response in JSON
Given path '/normal/webapi/add'
And request {"jobId":5,"jobTitle":"Software Engg-2","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
And headers {Accept : "application/json", Content-Type: "application/json"}
When method post
And status 201
And print response
And match response.jobTitle == "Software Engg-2"


Scenario: To create job entry in XML format and getting response in JSON
Given path '/normal/webapi/add'
And request <item><jobId>8</jobId><jobTitle>SoftwareEngg</jobTitle><jobDescription>Todevelopandriodapplication</jobDescription><experience><experience>Google</experience><experience>Apple</experience><experience>MobileIron</experience></experience><project><project><projectName>MovieApp</projectName><technology><technology>Kotlin</technology><technology>SQLLite</technology><technology>Gradle</technology></technology></project></project></item>
And headers {Accept : "application/json", Content-Type: "application/xml"}
When method post
And status 201
And print response
And match response.jobId == 8

Scenario: To create job entry in XML format and getting response in XML
Given path '/normal/webapi/add'
And request <item><jobId>20</jobId><jobTitle>SoftwareEngg</jobTitle><jobDescription>Todevelopandriodapplication</jobDescription><experience><experience>Google</experience><experience>Apple</experience><experience>MobileIron</experience></experience><project><project><projectName>MovieApp</projectName><technology><technology>Kotlin</technology><technology>SQLLite</technology><technology>Gradle</technology></technology></project></project></item>
And headers {Accept : "application/xml", Content-Type: "application/xml"}
When method post
And status 201
And print response
And match response/Job/jobId == "20"

Scenario: To create job entry using JSON req body and getting response in JSON
Given path '/normal/webapi/add'
* def body = read("data/jobEntry.json")
And request body
And headers {Accept : "application/json", Content-Type: "application/json"}
When method post
And status 201
And print response
And match response.jobTitle == "Software Engg-2"

Scenario: To create job entry using XML req body and getting response in JSON
Given path '/normal/webapi/add'
And request 
* def body = read("data/jobEntry.xml")
And request body
And headers {Accept : "application/json", Content-Type: "application/xml"}
When method post
And status 201
And print response
And match response.jobId == 20

Scenario: To create job entry in JSON format using embedded expression
Given path '/normal/webapi/add'
* def getJobId = function() {return Math.floor((100) * Math.random());}
And request {"jobId":'#(getJobId())',"jobTitle":"Software Engg-2","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
And headers {Accept : "application/json", Content-Type: "application/json"}
When method post
And status 201
And print response
And match response.jobTitle == "Software Engg-2"

Scenario: To create job entry in XML format using embedded expression
Given path '/normal/webapi/add'
* def getJobId = function() {return Math.floor((100) * Math.random());}
* def jobID = getJobId()
And request <item><jobId>#(jobID)</jobId><jobTitle>SoftwareEngg</jobTitle><jobDescription>Todevelopandriodapplication</jobDescription><experience><experience>Google</experience><experience>Apple</experience><experience>MobileIron</experience></experience><project><project><projectName>MovieApp</projectName><technology><technology>Kotlin</technology><technology>SQLLite</technology><technology>Gradle</technology></technology></project></project></item>
And headers {Accept : "application/json", Content-Type: "application/xml"}
When method post
And status 201
And print response
And match response.jobId == '#(jobID)'




