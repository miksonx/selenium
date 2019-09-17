package com.miksonx.testing;


import org.junit.runner.RunWith;		
import cucumber.api.CucumberOptions;		
import cucumber.api.junit.Cucumber;		

@RunWith(Cucumber.class)
@CucumberOptions(
        plugin = {
                "json:build/cucumber/test-reports/all.json",
                "html:build/cucumber/html/"
        },
        features = "src/test/resources/",
        glue = "com.miksonx.testing"
)					
public class RunnerTest 				
{		

}