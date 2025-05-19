Feature: To execute JS function


Scenario: Execute JS function with or without params
* def getIntValue = function() {return 10;}
Then print "Function Value ==>", getIntValue()
* def getRandomValue = function() {return Math.floor((100) * Math.random());}
Then print "Function Value ==>", getRandomValue()
* def getStringValue = function(arg1) {return "Hello " + arg1;}
Then print "Function Value ==>", getStringValue("World")