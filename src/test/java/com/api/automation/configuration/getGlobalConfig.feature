Feature: To get variables set by Karate-config.js file	

Background: To get values 
* def myLocalVarName = myVarName
Given print "Background variable value ==> ", myLocalVarName

Scenario: To get value of username and password from karate-config.js file	
* def myLocalUsername = username
Given print "Username variable value ==> ", username
Given print "Password variable value ==> ", password