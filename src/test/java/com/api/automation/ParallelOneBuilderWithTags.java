package com.api.automation;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class ParallelOneBuilderWithTags {

	private static final String CLASS_PATH = "classpath:";
	private static final String DELIMITER = ",";

	@Test
	public void executeKaratetest() {

		Builder aRunner = new Builder();
		aRunner.path(getLocation());
		Results result = aRunner.parallel(5);
		aRunner.tags(getTags());
		System.out.println("Total Features Count ==>" + result.getFeaturesTotal());
		System.out.println("Total Scenario Count ==>" + result.getScenariosTotal());
		System.out.println("Passed Scenarios ==>" + result.getScenariosPassed());

		Assertions.assertEquals(0, result.getFailCount(), "There are failed scenarios");
	}
	/*
	 * private List<String> getTags(){ String aTags = System.getProperty("tags",
	 * "@Regression"); List<String> aTagList = Arrays.asList(aTags);
	 * 
	 * return aTagList; }
	 * 
	 * private List<String> getLocation(){ String alocation =
	 * System.getProperty("location", "com/api/automation"); List<String>
	 * aaLocationList = Arrays.asList(CLASS_PATH + alocation);
	 * 
	 * return aaLocationList; }
	 */

	// for multiple
	private List<String> getTags() {
		// comma separate tags will be act like AND condition
		String aTags = System.getProperty("tags", "@Regression");
		List<String> aTagList = Collections.emptyList();

		if (aTags.contains(DELIMITER)) {
			String tagArray[] = aTags.split(DELIMITER);
			aTagList = Arrays.asList(tagArray);
			
			return aTagList;
		}
		aTagList = Arrays.asList(aTags);
		return aTagList;
	
	}

	private List<String> getLocation() {
		String alocation = System.getProperty("location", "com/api/automation");
		List<String> aaLocationList = Collections.emptyList();

		if (alocation.contains(DELIMITER)) {
			String locationArray[] = alocation.split(DELIMITER);
			aaLocationList = Arrays.asList(locationArray);
			aaLocationList.replaceAll((entry) -> {
				return CLASS_PATH + entry;
			});
			
			return aaLocationList;
		}
		aaLocationList = Arrays.asList(CLASS_PATH + alocation);
		return aaLocationList;
	
	}

}
