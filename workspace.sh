# install some basics
yum -y update
amazon-linux-extras install R4 python3.8 postgresql11 vim golang1.11 ruby2.6 
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum-config-manager --enable epel
yum install gedit libXcomposite libXcursor libXi libXtst libXrandr alsa-lib mesa-libEGL libXdamage mesa-libGL libXScrnSaver

#install rstudio server
wget https://download2.rstudio.org/server/centos6/x86_64/rstudio-server-rhel-1.3.1093-x86_64.rpm
yum install rstudio-server-rhel-1.3.1093-x86_64.rpm

#add user for rstudio
useradd r_user
#set password for rstudio
passwd r_user

#install r package dependencies
yum install udunits2-devel
yum -y install make automake gcc gcc-c++ libcurl-devel proj-devel geos-devel proj-nad proj-epsg
yum-builddep gdal
wget http://download.osgeo.org/gdal/2.4.0/gdal-2.4.0.tar.gz
tar xf gdal-2.4.0.tar.gz
cd gdal-2.4.0/
./configure
make -j4
make install
# make sure the library can be found
echo /usr/local/lib | tee -a /etc/ld.so.conf.d/local.conf
ldconfig


#install anaconda
curl -O https://repo.anaconda.com/archive/Anaconda3-5.3.1-Linux-x86_64.sh
bash Anaconda3-5.3.1-Linux-x86_64.sh
source ~/.bashrc

#install pycharm
wget https://download.jetbrains.com/python/pycharm-community-2020.2.3.tar.gz
tar -xzf pycharm-community-2020.2.3.tar.gz
sh pycharm-community-2020.2.3/bin/pycharm.sh 

#install pip and python libraries not bundled with anaconda
python -m ensurepip --default-pip
python -m pip install --upgrade pip setuptools wheel
pip install boto3 extract-msg igraph
yum install python-sphinx


#install r packages
#installing sf in this way seems to fail, it works if you manually install in rstudio though.
Rscript -e 'install.packages("pacman", repos="https://cloud.r-project.org")'
Rscript -e 'pacman::p_load(
  sf, 
  tidyverse,
  rgl,
  rJava,
  tabulizer,
  plotly,
  data.table,
  DT,
  shinycssloaders,
  shinydashboard,
  shinydashboardPlus,
  shinyBS,
  shinythemes,
  devtools,
  latexpdf,
  lubridate,
  kableExtra,
  igraph,
  igraphdata,
  igraphinshiny,
  igraphtosonia,
  rgdal,
  leaflet,
  leaflet.esri,
  leaflet.extras,
  leaflet.extras2,
  leaflet.minicharts,
  leaflet.opacity,
  leaflet.providers,
  leafletCN,
  leafletR,
  cronR,
  r2d2,
  r2d3,
  reticulate,
  keras,
  kerasR,
  tensor,
  tensorA,
  tensorBF,
  tensorBSS,
  tensorflow,
  tensorordinal,
  tensorr,
  tensorregress,
  tensorsparse,
  xgboost,
  mlr3,
  caret,
  botor,
  radarchart,
  drake,
  parsnip,
  excelR,
  officer,
  officedown,
  pivottabler,
  PivotalR,
  pivotaltrackR,
  xlsx,
  openxlsx,
  vegan,
  sjPlot,
  reshape,
  reshape2,
  viridis,
  viridisLite,
  plotly,
  ggiraph,
  ggiraphExtra,
  brew,
  broomExtra
)'

# Update anaconda
conda update --prefix /home/nca_datalab/anaconda3 anaconda

#install rshiny server
wget https://download2.rstudio.org/server/centos6/x86_64/rstudio-server-rhel-1.3.1093-x86_64.rpm
sudo yum install rstudio-server-rhel-1.3.1093-x86_64.rpm

#Install node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
. ~/.nvm/nvm.sh
nvm install node

#Install VS code
rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
yum check-update
yum install code
node -e "console.log('Running Node.js ' + process.version)"
