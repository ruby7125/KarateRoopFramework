Feature: Variables in Karate Framework 

Background: Declare and initialize variables
* def app_name = "TimCook"
* def page_load_timeout = 20

# <Gherkin Keyword> <def> <Variable Name> = <Value>


# Use Var for repeating values
# Store data from external file
# In the Matcher Expression 
# Passing data from 1 feature to another 

Scenario: To Create variable 
	Given def var_int = 10 
	And def var_str = "Karate" 
	Then print "Int Variable -->", var_int 
	And print "String Variable -->", var_str 
	* def var_int_2 = var_int + 10 
	And   print "New Variable -->" , var_int_2 
	And print "Background section variables ==>", app_name, page_load_timeout


Scenario: Access the variable 
* def var_int = 30
* def var_str = "Ruby"
* def var_int_2 = var_int + 50 
	Given   print "Previous Int Variable -->" , var_int 
	And   print "Previous String Variable -->" , var_str 
	And   print "Previous Int2 Variable -->" , var_int_2
	And print "Background section variables ==>", app_name, page_load_timeout
