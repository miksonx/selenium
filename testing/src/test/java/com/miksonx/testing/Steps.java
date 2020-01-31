package com.miksonx.testing;


import java.net.MalformedURLException;
import java.net.URL;

import org.openqa.selenium.By;		
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;

import cucumber.api.java.en.Given;		
import cucumber.api.java.en.Then;		
import cucumber.api.java.en.When;		

public class Steps {				

	RemoteWebDriver driver;		
    private String username = "ci_user";
    private String password = "smörrebröd";

    		
    @Given("^Open the Chrome and launch the application$")					
    public void open_the_Chrome_and_launch_the_application() throws Throwable							
    {	
    	String seleniumIP = System.getenv("COMPUTERNAME");
        String hubURL = "http://" + seleniumIP + ":4444/wd/hub";
    	URL seleniumHub = null;
        try {
            seleniumHub = new URL(hubURL);
        } catch (MalformedURLException e) {
            e.printStackTrace();
        }
        DesiredCapabilities capabilities = DesiredCapabilities.chrome();
        capabilities.setJavascriptEnabled(true);
        capabilities.setCapability("language", "sv");
        ChromeOptions options = new ChromeOptions();
        options.addArguments("window-size=1600,1800");
        capabilities.setCapability(ChromeOptions.CAPABILITY, options);

        driver = new RemoteWebDriver(seleniumHub, capabilities);
    	driver.manage().window().maximize();			
        
        String hostIp = System.getenv("ASSISTANT_API");
    	driver.get("http://" + hostIp + ":8080/");	
    	//driver.get("http://myassistantdocker:8080/");	
        
				
    }		



    @When("^Please login$")			
    public void enter_the_Username_and_Password() throws Throwable 							
    {	
    	try {
    		driver.findElement(By.id("username")).sendKeys(username);					
    		driver.findElement(By.id("password")).sendKeys(password);
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    }		

    @Then("^Verify the credential$")					
    public void	Verify_the_credential() throws Throwable 							
    {		
      driver.findElement(By.id("login")).click();					
    }		
}		