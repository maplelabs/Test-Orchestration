# API TestAutomation framework


## Description

This test Orchestration tool functions as a versatile execution engine for API test cases. It is designed to be compatible with multiple testing frameworks, providing a robust and flexible solution for API testing. Although we have illustrated its usage with the Karate Framework, this execution engine is capable of integrating seamlessly with other popular testing frameworks as well.

To get started with writing test cases using the Karate Framework, detailed instructions and examples are provided in the following sections. These guidelines will help you understand how to structure and implement your test cases effectively, ensuring comprehensive and reliable API testing.

These instructions will guide you through the process of setting up your environment, writing your first test cases, and utilizing advanced features of the Karate Framework to ensure robust API testing. This execution engine will help in following aspects Comprehensive API test coverage, Readable and maintainable test scripts, Data-driven testing, Assertions and validations, Error handling and reporting, Reusable test components, Integration with CI/CD pipelines, Environment management, Mocking and stubbing, Logging and debugging tools

## Usage
This section covers the details about how run/use this framework.

### Running framework locally

### prerequisites
The following items should be installed in your system:
* Docker should be installed
* git should be installed 

#### Docker execution

1) git clone the jars and docker file
```
git clone https://github.com/Ankit-Tripathi-ML/KarateAutomation.git
```
2) Edit the EnvConfig.sh environmental configuration details 
   such as dev/prod/stage and endpoint URL for the ENV
3) Build docker Image 
```
sudo docker build -t <image-name> .
```
4) Running the docker Image, In order to run the framework testcases feature files and testdata json files are needed. So while running the docker image path of testdata/testcases must be provided as command line arguments.
5) Testcase folder location can be passed either via git URL or by the local Dir path based on input argument Docker run command will change.
6) eg: Supplying Testcase folder location using git URL
```
sudo docker run --rm -e GIT_TESTDATA_REPO_URL=https://github.com/Ankit-Tripathi-ML/testdata.git -e ENV=prod -e TEST_CASES_PATH=https://github.com/Ankit-Tripathi-ML/KarateAutomation.git  <dockerImage-name>
```
7) eg: Supplying Testcase folder location using local dir path. In this scenario we need to use the -v option to mount the folder path in docker container
```
sudo docker run --rm -e GIT_TESTDATA_REPO_URL=https://github.com/Ankit-Tripathi-ML/testdata.git -e ENV=prod -e TEST_CASES_PATH=/home/ankit/KarateAutomation -v /home/ankit/KarateAutomation:/KarateAutomation  <dockerImage-name>
```
8) To access the testdata or testcases from private git repo either ssh keys or for https access token needs to generated steps are mentioned as below.
9) Accessing the private git repo

Using HTTPS with a Personal Access Token
1.	•  Generate a Personal Access Token:
2.	Go to GitHub (or the relevant Git service), navigate to Settings > Developer settings > Personal access tokens, and generate a new token with the necessary scopes (e.g., repo).
3.	•  Clone the Repository Using HTTPS:
      git clone https://username:token@github.com/username/repository.git

Using SSH Keys
1.	Generate an SSH Key (if you don't already have one):
      ssh-keygen -t rsa -b 4096 -C "your_email@example.com" 

2. Add the SSH Key to Your GitHub Account:
Copy the SSH key to your clipboard:

3. cat ~/.ssh/id_rsa.pub
Go to GitHub (or the relevant Git service), navigate to Settings > SSH and GPG keys, and add a new SSH key with the copied content.

Clone the Private Repository Using SSH:
git clone git@github.com:username/repository.git

10) Post test run for scenarios/feature detailed will be generated in target folder.
11) Report can be copied to host machine by following command
```dtd
sudo Docker CP -r target:hostpath
```


