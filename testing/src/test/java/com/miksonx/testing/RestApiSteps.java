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

import static com.github.tomakehurst.wiremock.client.WireMock.aResponse;
import static com.github.tomakehurst.wiremock.client.WireMock.configureFor;
import static com.github.tomakehurst.wiremock.client.WireMock.containing;
import static com.github.tomakehurst.wiremock.client.WireMock.equalTo;
import static com.github.tomakehurst.wiremock.client.WireMock.get;
import static com.github.tomakehurst.wiremock.client.WireMock.getRequestedFor;
import static com.github.tomakehurst.wiremock.client.WireMock.post;
import static com.github.tomakehurst.wiremock.client.WireMock.postRequestedFor;
import static com.github.tomakehurst.wiremock.client.WireMock.stubFor;
import static com.github.tomakehurst.wiremock.client.WireMock.urlEqualTo;
import static com.github.tomakehurst.wiremock.client.WireMock.verify;
import static com.github.tomakehurst.wiremock.core.WireMockConfiguration.options;
import static org.hamcrest.CoreMatchers.containsString;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertThat;

import java.io.IOException;
import java.io.InputStream;
import java.util.Scanner;

import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;

import com.github.tomakehurst.wiremock.WireMockServer;

public class RestApiSteps {				

	
    private static final String CREATE_PATH = "/greeting";
    private static final String APPLICATION_JSON = "application/json";

//    private final InputStream jsonInputStream = this.getClass().getClassLoader().getResourceAsStream("cucumber.json");
 //   private final String jsonString = new Scanner(jsonInputStream, "UTF-8").useDelimiter("\\Z").next();

   // private final WireMockServer wireMockServer = new WireMockServer(options().dynamicPort());
    private final CloseableHttpClient httpClient = HttpClients.createDefault();

	@Given("^I am logged in to MyAssistant as the CI user$")
	public void i_am_logged_in_to_MyAssistant_as_the_CI_user() throws Exception {
	    // Write code here that turns the phrase above into concrete actions
	    //throw new PendingException();
  //      wireMockServer.start();

       // configureFor("localhost", wireMockServer.port());
  //      stubFor(post(urlEqualTo(CREATE_PATH))
   //             .withHeader("content-type", equalTo(APPLICATION_JSON))
    //            .withRequestBody(containing("testing-framework"))
     //           .willReturn(aResponse().withStatus(200)));
        String hostIp = System.getenv("ASSISTANT_API");
        HttpGet request = new HttpGet("http://" + hostIp + ":8080" + "/greeting");
 //       StringEntity entity = new StringEntity(jsonString);
        request.addHeader("accept", APPLICATION_JSON);
//        request.setEntity(entity);
        HttpResponse response = httpClient.execute(request);

       // assertEquals(200, response.getStatusLine().getStatusCode());
       // verify(postRequestedFor(urlEqualTo(CREATE_PATH))
        //        .withHeader("content-type", equalTo(APPLICATION_JSON)));

   //     wireMockServer.stop();
	}

	@When("^We send request via api$")
	public void we_send_request_via_api() throws Exception {
	    // Write code here that turns the phrase above into concrete actions
	    //throw new PendingException();
   //     wireMockServer.start();

      //  configureFor("localhost", wireMockServer.port());
   //     stubFor(get(urlEqualTo("/greeting")).withHeader("accept", equalTo(APPLICATION_JSON))
     //           .willReturn(aResponse().withBody(jsonString)));
        String hostIp = System.getenv("ASSISTANT_API");
        HttpGet request = new HttpGet("http://" + hostIp +":8080" + "/greeting");
        request.addHeader("accept", APPLICATION_JSON);
        HttpResponse httpResponse = httpClient.execute(request);
        String responseString = convertResponseToString(httpResponse);

        assertThat(responseString, containsString("\"content\":\"Hello, World!\""));
       // verify(getRequestedFor(urlEqualTo("/greeting")).withHeader("accept", equalTo(APPLICATION_JSON)));

   //     wireMockServer.stop();
	}

	@Then("^the response should contain Hello$")
	public void the_response_should_contain_Hello() throws Exception {
	
	}

    private String convertResponseToString(HttpResponse response) throws IOException {
        InputStream responseStream = response.getEntity().getContent();
        Scanner scanner = new Scanner(responseStream, "UTF-8");
        String responseString = scanner.useDelimiter("\\Z").next();
        scanner.close();
        return responseString;
    }
}		