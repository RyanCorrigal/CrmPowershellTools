# Ryan Corrigal 2022 😁😎
# Why do we do this?

param (
  # the solution zip file
  [Parameter(Mandatory)]
  [string]
  ${Solution zip},

  # the location to which the solution will be exported
  [Parameter(Mandatory)]
  [string]
  ${Working directory},

  # this is an optional test parameter, for example purposes only
  [Parameter()]
  [string]
  ${Test Param}
)

# assign the params to more sanely named variables
$solutionZip = ${Solution zip}
$workingDirectory = ${Working directory}
$testParam = ${Test Param}

# if we didn't capture in the parameters, we prompt the user
"Solution Zip: ${solutionZip}"
"Working Directory: ${workingDirectory}"

# for example purposes: if a test parameter is passed, we display
if ($TestParam) {
  "Test Param: ${TestParam}"
}

# first check to see whether the solution file exists
if (Test-Path -Path $solutionZip -PathType Leaf) {

  # create the working directory if it doesn't exist
  if (-Not(Test-Path -Path $workingDirectory)) {
    "Working directory does not exist. Creating, then extracting."
    New-Item -ItemType Directory -Path $workingDirectory
  }
  else {
    "Working directory was found. Proceeding to extraction."
  }

  "Now extracting the solution to the working directory:"
  
  # extract the files using SolutionPackager
  .\Tools\CoreTools\SolutionPackager.exe /action:extract /zipfile:$solutionZip /disableTelemetry /clobber /folder:$workingDirectory

  "Solution was successfully extracted to the working directory. 😎"
}
else {
  "The provided solution zip file could not be found. Exiting. 😖"
}