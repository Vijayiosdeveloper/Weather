**************************************************************************
Weather - Coding Challenge
**************************************************************************


********
SUMMARY:
********

For the given coding challenge, I have developed a framework and application that displays the user entered location weather report from the openweathermap.

************
REQUIREMENTS
************

XCode - Version 9.2 (9C40b)

************
GIT HUB REPO
************


Git URL - https://github.com/Vijayiosdeveloper/Weather.git


*****************
PACKAGE CONTENTS:
*****************

1. Framework folder which contains the Weather.framework source code. 
   a. Created a dedicated class for the network activity called ‘WebserviceManager’ which is responsible to send the REST API call, validate the response, return the JSON serialized object back to caller.
   b. The main class ‘Weather’ is responsible to take the location from the application, prepare the request object, pass it to the ‘WebserviceManager’ and process the response data into a model object.
   c. Model class ‘WeatherInfo’ is defined with part of the actual information coming from the server response (due to limited time). This has the couple of initializer methods. One will take the actual JSON object and prepare a model and other one is with empty object.

2. Application folder which contains the FindWeather application
   a. On App launch, user will be landed on the home screen with the ‘location’ text field where user can provide the location. And ’Submit’ button to submit the request.
   b. Once user submit the request, validation of the input data will be done and pass the user entered location to the Weather.framework.
   c. After getting the response from Weather.framework, ViewController will validate the response (handle both positive and negative scenarios) and segue way to the details screen


************
UNIT TESTING
************

1. Enter the location ‘Jersey City’ and submit. Framework gets the response and App will display the received data
2. Enter the location ‘Edison’ and submit. Framework gets the response and App will display the received data
3. Enter the location ‘Los Angles’ and submit. Framework gets the response as Not found from openweathermap and App will display an error message.
4. Enter the location ‘XYZ’ and submit. Framework gets the response as Not found from openweathermap and App will display an error message.
4. Enter the location ‘’ and submit. App will throw an error message to user to enter the location.

***************
UNIT TEST CASES
***************

- Created an XCTestCase ‘WeatherTests.swift’ on the Model ‘WeatherInfo’ inside the Weather.framework. 
- This test case will take the prepared JSON files for the real and dummy locations, and checks whether the model object is rightly populating or not.







