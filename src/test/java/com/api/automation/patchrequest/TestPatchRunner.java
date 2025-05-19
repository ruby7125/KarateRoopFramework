package com.api.automation.patchrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestPatchRunner {
	
	@Test
	public Karate runTest() {
		
		//return Karate.run("getRequest2", "responseMatcher", "validateJSONArray").relativeTo(getClass());
		return Karate.run("PartialUpdatePatchRequest").relativeTo(getClass());
	}
	
//	@Test
//	public Karate runUsingClassPath() {
//		
//		return Karate.run("classpath:com/api/automation/getrequest/getRequest2.feature");
//		
//	}


}
