Feature: To update existing job entry in the application.

Background: Setup the base Url
Given url 'http://localhost:9897'
And print "===========Background Initialization=========="

Scenario: To create job entry in JSON format and update it.
Given path '/normal/webapi/add'
* def getRandomValue = function() {return Math.floor((100) * Math.random());}
* def ID = getRandomValue()
And request {"jobId":'#(ID)',"jobTitle":"Software Engg-2","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
And headers {Accept : "application/json", Content-Type: "application/json"}
When method post
Then status 201
And print response

# PUT Request
Given path '/normal/webapi/update'
And request
"""
{
    "jobId": '#(ID)',
    "jobTitle": "Software Developer",
    "jobDescription": "To develop andriod application",
    "experience": [
        "Google",
        "Apple",
        "Mobile Iron",
        "Appium"
    ],
    "project": [
        {
            "projectName": "Movie App",
            "technology": [
                "Kotlin",
                "SQL Lite",
                "Gradle",
                "Eclipse"
            ]
        },
        {
            "projectName": "Movie App",
            "technology": [
                "Kotlin",
                "SQL Lite",
                "Gradle",
                "Eclipse"
            ]
        }
    ]
}
"""

And headers {Accept : "application/json", Content-Type: "application/json"}
When method put
Then status 200
* def projectArray = karate.jsonPath(response, "$[?(@.jobId == "+ ID +")].project")
And print projectArray
And match projectArray[0] == '#[2]'


Scenario: To create job entry in JSON format and update it part 2.
Given path '/normal/webapi/add'
* def getRandomValue = function() {return Math.floor((100) * Math.random());}
* def ID = getRandomValue()
And request {"jobId":'#(ID)',"jobTitle":"Software Engg-2","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
And headers {Accept : "application/json", Content-Type: "application/json"}
When method post
Then status 201
And print response

# PUT Request
Given path '/normal/webapi/update'
And request
"""
{
    "jobId": '#(getRandomValue())',
    "jobTitle": "Software Developer",
    "jobDescription": "To develop andriod application",
    "experience": [
        "Google",
        "Apple",
        "Mobile Iron",
        "Appium"
    ],
    "project": [
        {
            "projectName": "Movie App",
            "technology": [
                "Kotlin",
                "SQL Lite",
                "Gradle",
                "Eclipse"
            ]
        },
        {
            "projectName": "Movie App",
            "technology": [
                "Kotlin",
                "SQL Lite",
                "Gradle",
                "Eclipse"
            ]
        }
    ]
}
"""

And headers {Accept : "application/json", Content-Type: "application/json"}
When method put
Then status 404

Scenario: To update job entry in JSON format and add job entry from another feature file
#<Gherkin Keyword> <call> <read(<location of feature file>)>
Given call read("../AddJobEntry.feature")
# PUT Request
Given path '/normal/webapi/update'
And request
"""
{
    "jobId": 123,
    "jobTitle": "Software Developer",
    "jobDescription": "To develop andriod application",
    "experience": [
        "Google",
        "Apple",
        "Mobile Iron",
        "Appium"
    ],
    "project": [
        {
            "projectName": "Movie App",
            "technology": [
                "Kotlin",
                "SQL Lite",
                "Gradle",
                "Eclipse"
            ]
        },
        {
            "projectName": "Movie App",
            "technology": [
                "Kotlin",
                "SQL Lite",
                "Gradle",
                "Eclipse"
            ]
        }
    ]
}
"""

And headers {Accept : "application/json", Content-Type: "application/json"}
When method put
Then status 200
* def projectArray = karate.jsonPath(response, "$[?(@.jobId == 123)].project")
And print projectArray
And match projectArray[0] == '#[2]'


Scenario: To update job entry in JSON format and add job entry from another feature file and use variables
# <Gherkin Keyword> <call> <read(<location of feature file>)>
# Given call read("../AddJobEntry.feature")
* def postRequest = call read("../AddJobEntry.feature")
And print "Calling variable ==>", postRequest.ID
And print "Calling JS random variable ==>", postRequest.getRandomValue()
# PUT Request
Given path '/normal/webapi/update'
And request
"""
{
    "jobId": '#(postRequest.ID)',
    "jobTitle": "Software Developer",
    "jobDescription": "To develop andriod application",
    "experience": [
        "Google",
        "Apple",
        "Mobile Iron",
        "Appium"
    ],
    "project": [
        {
            "projectName": "Movie App",
            "technology": [
                "Kotlin",
                "SQL Lite",
                "Gradle",
                "Eclipse"
            ]
        },
        {
            "projectName": "Movie App",
            "technology": [
                "Kotlin",
                "SQL Lite",
                "Gradle",
                "Eclipse"
            ]
        }
    ]
}
"""

And headers {Accept : "application/json", Content-Type: "application/json"}
When method put
Then status 200
* def projectArray = karate.jsonPath(response, "$[?(@.jobId == "+ postRequest.ID +")].project")
And print projectArray
And match projectArray[0] == '#[2]'



Scenario: To update job entry in JSON format and add job entry from another feature file and pass variables values from here to helper feature file
#<Gherkin Keyword> <call> <read(<location of feature file>)>
* def getRandomValue = function() {return Math.floor((100) * Math.random());}
* def id = getRandomValue()
Given call read("../AddJobEntryWithVariables.feature") {_url : 'http://localhost:9897', _path : '/normal/webapi/add', _id : '#(id)' }
# PUT Request
Given path '/normal/webapi/update'
And request
"""
{
    "jobId": '#(_id)',
    "jobTitle": "Software Developer",
    "jobDescription": "To develop andriod application",
    "experience": [
        "Google",
        "Apple",
        "Mobile Iron",
        "Appium"
    ],
    "project": [
        {
            "projectName": "Movie App",
            "technology": [
                "Kotlin",
                "SQL Lite",
                "Gradle",
                "Eclipse"
            ]
        },
        {
            "projectName": "Movie App",
            "technology": [
                "Kotlin",
                "SQL Lite",
                "Gradle",
                "Eclipse"
            ]
        }
    ]
}
"""

And headers {Accept : "application/json", Content-Type: "application/json"}
When method put
Then status 200
* def projectArray = karate.jsonPath(response, "$[?(@.jobId == "+ id +")].project")
And print projectArray


