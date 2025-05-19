package com.api.automation;




import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*; 

import com.intuit.karate.Results;
import com.intuit.karate.Runner;

public class ParallelOneRunner {
	
	@Test
	void TestParallel() {
		
		//Runner.parallel(getClass(),5);
		Results results = Runner.path("classpath:com/api/automation/getrequest").parallel(5);
		assertEquals(0, results.getFailCount(), results.getErrorMessages());
		
	}

}
