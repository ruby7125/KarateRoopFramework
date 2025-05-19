package com.api.automation;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class ParallelOneBuilderWithCucumberReport {

	@Test
	public void executeKaratetest() {

		Builder aRunner = new Builder();
		aRunner.path("classpath:com/api/automation/getrequest");
		Results result = aRunner.outputCucumberJson(true).parallel(2);
		System.out.println("Total Features Count ==>" + result.getFeaturesTotal());
		System.out.println("Total Scenario Count ==>" + result.getScenariosTotal());
		System.out.println("Passed Scenarios ==>" + result.getScenariosPassed());
		generateCucumberReports(result.getReportDir());
		Assertions.assertEquals(0, result.getFailCount(), "There are failed scenarios");
	}
	
	// reportDirLocation --> D:\Work\Repository\KarateFramework\target\surefire-reports
	private void generateCucumberReports(String reportDirLocation) {
		File dirLocation = new File(reportDirLocation);
		Collection<File> jsonCollection =  FileUtils.listFiles(dirLocation, new String[] {"json"}, true);
		
		List<String> jsonFiles = new ArrayList<String>();
		jsonCollection.forEach(file -> jsonFiles.add(file.getAbsolutePath()));
		
		Configuration configuration = new Configuration(dirLocation,"Karate Run");
		ReportBuilder reportBuilder = new ReportBuilder(jsonFiles, configuration);
		reportBuilder.generateReports();
	}

}
