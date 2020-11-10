# datascience_workspace
This is a shell script to configure an AWS workspace running amazon linux to install the programs, packages and dependencies required for data science and development.

# Amazon linux essentials
The image should come preinstalled with R (4.0), Python (3.8) PostgreSQL (11), vim, golang 1.11 and ruby2.6 from the amazon linux repository.

# R studio and shinyserver
Amazon linux doesn't seem to support R studio desktop so we install R studio server instead. The user experience is identical except that R studio is accessed from a browser on the workspace e.g. firefox by navigating to "localhost:8787" then logging in. The username r_user is created as part of this script and you will be prompted to create a password, this enables you to login to r studio server. 

If you need to reset the password for r_user:
sudo passwd r_user

Shiny server is also installed. It isn't exposed from here e.g. your shiny apps from the workspace will not be visible outside the workspace. But shiny server is useful for testing out shiny apps before deployment. You can find it at "localhost:3838". The directory for apps is //srv/shiny-server/.

# Pycharm
sh //datascience_workspace/community-2020.2.3/bin/pycharm.sh 

# Anaconda
source //datascience_workspace/anaconda3/bin/activate 

anaconda-navigatior

# VS code
Installed and can be found in applications under programming. 
