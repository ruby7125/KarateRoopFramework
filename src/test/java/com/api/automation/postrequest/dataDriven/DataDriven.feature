Feature: To run test with multiple data sets

Background: Read external csv file
# * def testdata = read("testData.csv")
read("testData.csv")

Scenario Outline: To create Job Desc using method <method>
Given print '<url>'
When print '<path>'
Then print '<method>'
And print '<status>'

Examples: 
|url                   |path                     |method    |status      |
|http://localhost:9897 | /normal/webapi/upload   |POST      |200         |
|http://localhost:9897 | /normal/webapi/all      |GET       |201         |
|http://localhost:9897 | /normal/webapi/add      |POST      |200         |



Scenario Outline: To run test with multiple data sets
Given url 'http://localhost:9897'
And path '/normal/webapi/add'
And request {"jobId":'#(jobId)',"jobTitle":'#(jobTitle)',"jobDescription":'#(jobDescription)',"experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
And headers {Accept : "application/json", Content-Type: "application/json"}
When method post
And status <status>



Examples: 
|jobId     |jobTitle              |jobDescription                   |status      |
|211       |Software Engg-1       |To develop andriod application   |201         |
|212       |Software Engg-2       |To develop iOS application       |201         |
|213       |Software Engg-3       |To develop Web application       |201         |


Scenario Outline: To run test with multiple data sets using external csv file - <jobId>
Given url 'http://localhost:9897'
And path '/normal/webapi/add'
And request {"jobId":'#(jobId)',"jobTitle":'#(jobTitle)',"jobDescription":'#(jobDescription)',"experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
And headers {Accept : "application/json", Content-Type: "application/json"}
When method post
And status <status>

Examples: 
|read("testData.csv")|