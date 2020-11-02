# install some basics
yum -y update
amazon-linux-extras install R4 python3.8 postgresql11 vim golang1.11 ruby2.6 
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum-config-manager --enable epel
yum install gedit libXcomposite libXcursor libXi libXtst libXrandr alsa-lib mesa-libEGL libXdamage mesa-libGL libXScrnSaver

#install rstudio server
wget https://download2.rstudio.org/server/centos6/x86_64/rstudio-server-rhel-1.3.1093-x86_64.rpm
yum install rstudio-server-rhel-1.3.1093-x86_64.rpm

#install r package dependencies
yum install udunits2-devel gdal
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

Rscript -e 'install.packages("sf", repos="https://cloud.r-project.org")'
