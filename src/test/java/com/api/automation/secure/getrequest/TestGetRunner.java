package com.api.automation.secure.getrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestGetRunner {
	
	@Test
	public Karate runTest() {
		
		//return Karate.run("getRequest2", "responseMatcher", "validateJSONArray").relativeTo(getClass());
		return Karate.run("AuthGetJobEntry").relativeTo(getClass());
	}
	
//	@Test
//	public Karate runUsingClassPath() {
//		
//		return Karate.run("classpath:com/api/automation/getrequest/getRequest2.feature");
//		
//	}


}
