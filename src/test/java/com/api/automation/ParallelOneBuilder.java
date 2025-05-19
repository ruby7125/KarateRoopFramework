package com.api.automation;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class ParallelOneBuilder {

	@Test
	public void executeKaratetest() {

		Builder aRunner = new Builder();
		aRunner.path("classpath:com/api/automation/getrequest");
		Results result = aRunner.parallel(2);
		System.out.println("Total Features Count ==>" + result.getFeaturesTotal());
		System.out.println("Total Scenario Count ==>" + result.getScenariosTotal());
		System.out.println("Passed Scenarios ==>" + result.getScenariosPassed());

		Assertions.assertEquals(0, result.getFailCount(), "There are failed scenarios");
	}

}
