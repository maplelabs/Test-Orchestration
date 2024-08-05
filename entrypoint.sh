#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Clone the git repository
echo "Cloning the git Test Data repository..."
git clone  $GIT_TESTDATA_REPO_URL

echo "Cloning the git Test Cases repository..."
#git clone $GIT_TESTCASES_REPO_URL

#if [ -d "$TARGET_DIR" ]; then
#  echo "Directory $TARGET_DIR exists. Removing it."
 # rm -rf "$TARGET_DIR"
#fi
source EnvConfig.sh $ENV


# Function to check if a string is a Git URL
is_git_url() {
    git ls-remote "$TEST_CASES_PATH" &>/dev/null
    return $?
}

# Check if the user provided a GIT URL or a local path
if is_git_url "$TEST_CASES_PATH"; then
    echo "Cloning test cases from Git URL: $TEST_CASES_PATH"
    git clone "$TEST_CASES_PATH"
    TEST_FILES_PATH="$(basename -s .git "$TEST_CASES_PATH")/"
else
    echo "Using local test cases from: $TEST_CASES_PATH"
    TEST_FILES_PATH="$TEST_CASES_PATH"
fi

# Export the test files path for the application to use
export TEST_FILES_PATH



#git clone --branch $1 $2
# Navigate to the tests directory
#cd /karate-tests



# Run Karate tests
echo "Running Karate tests..."
java -jar KarateAutomation/karate.jar  $(basename -s .git "$TEST_FILES_PATH")/*
chown 777 target/*
#scp  target ankit@10.81.1.198:/home/ankit