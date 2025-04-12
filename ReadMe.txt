To view the report
    Open RobotFramework_pogo/report.html

__________________________________________________________________________________________________________________
How to run the project

1) Open the following link and download the chromedriver as per your chrome version and keep it on "Driver" folder
https://googlechromelabs.github.io/chrome-for-testing/


And Now go to the Terminal and follow the following steps

2) cd RobotFramework_pogo           #go to the Poject Folder
2) python3 -m venv venv
3) Activate virtual environament
    On Windows, use: venv\Scripts\activate
    On macOS or Linux use: source venv/bin/activate

4) pip install -r requirements.txt          #install the dependencies if not installed before. This needs to be only for the 1st time.
5) robot --include SmokeTest TestCases      #Run all the test case which has Tags = SmokeTest    
