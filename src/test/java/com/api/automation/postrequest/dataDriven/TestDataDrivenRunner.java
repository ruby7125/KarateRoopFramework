package com.api.automation.postrequest.dataDriven;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestDataDrivenRunner {
	
	@Test
	public Karate runTest() {
		
		//return Karate.run("getRequest2", "responseMatcher", "validateJSONArray").relativeTo(getClass());
		return Karate.run("DataDriven").relativeTo(getClass());
	}
	
//	@Test
//	public Karate runUsingClassPath() {
//		
//		return Karate.run("classpath:com/api/automation/getrequest/getRequest2.feature");
//		
//	}


}
