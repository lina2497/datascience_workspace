# datascience_workspace
This is a shell script to configure an AWS workspace running amazon linux to install the programs, packages and dependencies required for data science and development.

# R
Amazon linux doesn't seem to support R studio desktop so we install R studio server instead. The user experience is identical except that R studio is accessed from a browser on the workspace e.g. firefox by navigating to "localhost:8787" then logging in. The username r_user is created as part of this script and you will be prompted to create a password, this enables you to login to r studio server. 

R itself is instaled
