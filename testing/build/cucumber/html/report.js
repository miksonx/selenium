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
});