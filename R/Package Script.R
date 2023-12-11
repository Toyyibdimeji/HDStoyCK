library(roxygen2) # In-Line Documentation for R
library(devtools) # Tools to Make Developing R Packages Easier
library(tinytest) # Unit Testing for R
library(usethis)  # Automate Package and Project Setup
library(DT)       # Required fot test_coverage
library(rhub)
# devtools::create("~/HDStoyCK")

# Now update the description file with a better formatted one
# setwd("~/HDStoyCK")
usethis::use_description(fields = list(Package = "HDStoyCK"))
# Delete NAMESPACE. It will be created automatically with Roxygen
unlink("./NAMESPACE")
devtools::document()

# Add a licence for your package
usethis::use_gpl3_license()

# Use git locally
# To install Git in your system https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
# The next 2 lines is only needed the first time you setup git in a computer to
# register your name and email
system('git config --global user.name "Chris Kypridemos"') # Use your name instead of Chris Kypridemos
system('git config --global user.email "christodoulosk@gmail.com"') # Use your email instead of mine. Need to be the same as in GitHub

system("git config --global user.name") # Test that it worked
system("git config --global user.email") # Test that it worked

usethis::use_git()


# Create GitHub Repo and link the local git to it
usethis::create_github_token()
gitcreds::gitcreds_set()

# usethis::gh_token_help() # for troubleshooting
# usethis::git_sitrep() # for troubleshooting
usethis::use_github()

# If your package require the data.table package
usethis::use_data_table()

# copy the rowSumsDT.R to ./R

# Add unit tests (in \inst\tinytest)
tinytest::setup_tinytest("./")

# copy the test_HDStoyCK to ./inst/tinytest

# Knit documentation
devtools::document()

# install the package
devtools::install()


# Run the tests
tinytest::build_install_test("./")
tinytest::test_package("HDStoyCK") # Run after installation and restart

devtools::test_coverage() # restart R first

# Check package
# The following function runs a local R CMD check
devtools::check()
# Check for CRAN specific requirements
# rhub::check_for_cran() # Do not run
# Check for win-builder
devtools::check_win_devel() # Do not run

# Update git
gert::git_add(files = ".") # add all untracked files
gert::git_commit_all(message = "first release")

gert::git_pull()
gert::git_push()
# Install from GitHub
devtools::install_github("ChristK/HDStoyCK")
tinytest::test_package("HDStoyCK")

library(data.table)
library(HDStoyCK)
x <- matrix(fdeaths, ncol = 12, byrow = TRUE)
x <- data.table(x)
x
rowSumsDT(x)
