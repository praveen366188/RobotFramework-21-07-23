# RobotFramework-21-07-23
**Step 1 : Pre-check**
       **Check if python is already installed**
  python --version
  pip --version
       **Check if robot framework is already installed**
  robot --version

**Step 2 : Install Python **
      check on cmd : python --version
          pip --version

**Step 3 : Set Python in environment variables**
      C:\Python27;C:\Python27\Scripts;
      Check: 
                python --version
  pip --version

**Step 4 : Install robot framework**
       pip install robotframework
       to uninstall : pip uninstall robotframework

**Step 5 : Check on cmd :**
  robot --version
  pybot --version

Step 6 : Download and install pycharm  
  clone the project -> https://github.com/praveen366188/RobotFramework-21-07-23.git

Step 7 : download chromedriver and put it in the scripts folder
  find the python folder opening cmd and type "where python"
  go to the script folder for example
  C:\Users\91812\AppData\Local\Programs\Python\Python310\Scripts
  paste ur chrome driver.

step 8 run the robot file
  robot --include smoke SuaceLabInventory/Tests/
  it will execute all the test with tag smoke.

<img width="960" alt="image" src="https://github.com/praveen366188/RobotFramework-21-07-23/assets/55683483/1be83cfc-f851-4cb1-a79b-7148e3d0770d">
