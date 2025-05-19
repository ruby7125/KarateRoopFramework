Feature: To upload the file using karate

Background: Setup the Base Path 
	Given url 'http://localhost:9897' 
	And print '========This is Background Keyword========' 
	
Scenario: To upload file in test application
Given path '/normal/webapi/upload'
# location of file, name of file, content-type of header value
And multipart file file = {read : "contentFile.txt", filename : "contentFile.txt", Content-Type: "multipart/form-data"}
When method post
Then status 200
And print response


Scenario: To upload file in test application
Given path '/normal/webapi/upload'
# location of file, name of file, content-type of header value
* def fileLocation = "../data/jobEntry.json"
And multipart file file = {read : "#(fileLocation)", filename : "jobEntry.json", Content-Type: "multipart/form-data"}
When method post
Then status 200
And print response
And match response.message contains 'jobEntry.json'