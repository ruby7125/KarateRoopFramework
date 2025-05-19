package com.api.automation.getrequest.queryParameters;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestQueryParamRunner {
	
	@Test
	public Karate runTest() {
		
		//return Karate.run("getRequest2", "responseMatcher", "validateJSONArray").relativeTo(getClass());
		return Karate.run("GetReqQueryParameter").relativeTo(getClass());
	}
	
//	@Test
//	public Karate runUsingClassPath() {
//		
//		return Karate.run("classpath:com/api/automation/getrequest/getRequest2.feature");
//		
//	}


}
