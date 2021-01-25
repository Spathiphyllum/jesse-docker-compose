#!/bin/bash

start=`date +%s`

echo "updaing ubuntu..."
apt-get -y update
apt-get -y upgrade
apt-get -y install software-properties-common
apt-add-repository -y universe
apt-get -y update

# wget
apt-get -y install wget

# python 3.8
echo "installing Python 3.8 ..."
apt-get -y install gcc binutils
apt-get update
#apt-get install software-properties-common
add-apt-repository -y ppa:deadsnakes/ppa
apt-get update -y
apt-get -y install python-pip
apt-get -y install python-setuptools
apt-get -y install build-essential python3.8-dev
apt-get update
update-alternatives --install /usr/bin/python python /usr/bin/python3.8 9
update-alternatives  --set python /usr/bin/python3.8
echo "Python 3.8 has been set as default python"
python --version
apt-get -y install python3-pip
python -m pip install --upgrade pip
hash -d pip
pip install -U setuptools
pip install --upgrade setuptools
pip install ez_setup
pip install Cython numpy
pip install jupyterlab

# talib
echo "installing talib ..."
apt-get -y install libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev
wget https://sourceforge.net/projects/ta-lib/files/ta-lib/0.4.0/ta-lib-0.4.0-src.tar.gz -q
ls
tar -xzf ta-lib-0.4.0-src.tar.gz
cd ta-lib/ 
./configure --prefix=/usr
make
make install
#
## install PosgreSQL database
#echo "installing PostgreSQL ..."
#cd
#apt-get install wget ca-certificates
#wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc |  apt-get-key add - &&  sh -c 'echo "deb http://apt-get.postgresql.org/pub/repos/apt-get/ `lsb_release -cs`-pgdg main" >> /etc/apt-get/sources.list.d/pgdg.list'
#apt-get update -y
#apt-get install -y postgresql postgresql-contrib python-psycopg2 libpq-dev

# install python -m  packages
pip install -r https://raw.githubusercontent.com/jesse-ai/jesse/master/requirements.txt
pip install jesse

echo "cleaning..."
rm ta-lib-0.4.0-src.tar.gz && rm -rf ta-lib
echo "Finished installation. "
end=`date +%s`
runtime=$((end-start))
echo "Installation took ${runtime} seconds."
echo "Notice not to use python3 and pip3, but instead use python and pip."
echo "Here's the output of 'python --version' (it should be 'Python 3.8.*'):"
python --version
