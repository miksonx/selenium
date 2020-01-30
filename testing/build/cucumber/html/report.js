$(document).ready(function() {var formatter = new CucumberHTML.DOMFormatter($('.cucumber-report'));formatter.uri("src/test/resources/features/MyTest.feature");
formatter.feature({
  "name": "Login functionality on login page of Application",
  "description": "",
  "keyword": "Feature"
});
formatter.scenario({
  "name": "Verification of Login button",
  "description": "",
  "keyword": "Scenario"
});
formatter.step({
  "name": "Open the Chrome and launch the application",
  "keyword": "Given "
});
formatter.match({
  "location": "Steps.open_the_Chrome_and_launch_the_application()"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "Please login",
  "keyword": "When "
});
formatter.match({
  "location": "Steps.enter_the_Username_and_Password()"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "Verify the credential",
  "keyword": "Then "
});
formatter.match({
  "location": "Steps.Verify_the_credential()"
});
formatter.result({
  "status": "passed"
});
formatter.uri("src/test/resources/features/api/greeeting.feature");
formatter.feature({
  "name": "Greeting",
  "description": "",
  "keyword": "Feature",
  "tags": [
    {
      "name": "@Selenium"
    }
  ]
});
formatter.background({
  "name": "",
  "description": "",
  "keyword": "Background"
});
formatter.step({
  "name": "I am logged in to MyAssistant as the CI user",
  "keyword": "Given "
});
formatter.match({
  "location": "RestApiSteps.i_am_logged_in_to_MyAssistant_as_the_CI_user()"
});
formatter.result({
  "status": "passed"
});
formatter.scenario({
  "name": "List value from greeting api",
  "description": "",
  "keyword": "Scenario",
  "tags": [
    {
      "name": "@Selenium"
    }
  ]
});
formatter.step({
  "name": "We send request via api",
  "keyword": "When "
});
formatter.match({
  "location": "RestApiSteps.we_send_request_via_api()"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "the response should contain Hello",
  "keyword": "Then "
});
formatter.match({
  "location": "RestApiSteps.the_response_should_contain_Hello()"
});
formatter.result({
  "status": "passed"
});
});