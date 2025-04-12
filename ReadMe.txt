Run Test:
    robot --include SmokeTest RobotFramework_pogo/TestCases

To view the report
    Open RobotFramework_pogo/report.html
   

__________________________________________________________________________________________________________________
How to run the project

1) Navigate to this and download the chrome driver as per your chrome version and keep it on Driver folder
https://googlechromelabs.github.io/chrome-for-testing/

2) python3 -m venv venv
3) source venv/bin/activate

4)  Navigate into RobotFramework_pogo/
pip install -r requirements.txt

5)  Navigate into RobotFramework_pogo/
robot --include SmokeTest TestCases
