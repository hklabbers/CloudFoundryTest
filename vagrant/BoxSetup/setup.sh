echo -----------------------------------
echo SET CONSTANTS
echo -----------------------------------
CLION_VERSION=2017.3.2
CLANG_VERSION=4.0

echo -----------------------------------
echo CREATE DIRECTORY FOR INSTALL STATUS
echo -----------------------------------
su -l -c "mkdir -p /home/vagrant/.install_status" vagrant
INSTALL_STATUS_DIR=/home/vagrant/.install_status

echo -----------------------------------
echo FUNCTIONS
echo -----------------------------------
wait_for_lock () {
   counter=0
   while [ -e /var/lib/dpkg/lock ] || [ -e /var/cache/apt/archives/lock ]; do
      echo Waiting for lock to be released.
      sleep 20s
      counter=$((counter+1))
      if [ "$counter" -gt 3 ]; then
         echo Removing lock file.
         if [ -e /var/lib/dpkg/lock ]; then
            rm /var/lib/dpkg/lock
         fi
         if [ -e /var/cache/apt/archives/lock ]; then
            rm /var/cache/apt/archives/lock
         fi
      fi
   done
   echo No lock or lock released, continue.
}

if [ ! -f ${INSTALL_STATUS_DIR}/chrome.installed ]; then
   echo -----------------------------------
   echo ADD GOOGLE REPOSITORY AND UPDATE
   echo -----------------------------------
   wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
   sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
   su -l -c "touch ${INSTALL_STATUS_DIR}/chrome.installed" vagrant
fi
   apt-get -y update
   wait_for_lock

if [ ! -f ${INSTALL_STATUS_DIR}/clang-4.0.installed ]; then
   echo -----------------------------------
   echo INSTALL CLANG
   echo -----------------------------------
   for PROG in clang lldb; do
      sudo apt-get -y install ${PROG}-${CLANG_VERSION}
      for C in /usr/bin/${PROG}*${CLANG_VERSION}; do
          L=${C%-$CLANG_VERSION}
          B=$(basename $L)
          update-alternatives --install $L $B $C 1000
      done
   done
   update-alternatives --install /usr/bin/cc cc /usr/bin/clang 100
   update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++ 100
   su -l -c "touch ${INSTALL_STATUS_DIR}/clang-4.0.installed" vagrant
fi

echo -----------------------------------
echo INSTALL GIT
echo -----------------------------------
apt-get -y install git

echo -----------------------------------
echo INSTALL Chrome
echo -----------------------------------
apt-get -y install google-chrome-stable

if [ ! -f ${INSTALL_STATUS_DIR}/cmake-3.9.4.installed ]; then
   echo -----------------------------------
   echo INSTALL CMAKE
   echo -----------------------------------
   cd /tmp
   wget https://cmake.org/files/v3.9/cmake-3.9.4.tar.gz
   tar -xzvf cmake-3.9.4.tar.gz
   cd cmake-3.9.4/
   ./bootstrap
   make -j4
   make install
   su -l -c "touch ${INSTALL_STATUS_DIR}/cmake-3.9.4.installed" vagrant
fi

if [ ! -f ${INSTALL_STATUS_DIR}/clion-2017.3.2.installed ]; then
   echo -----------------------------------
   echo DOWNLOAD CLION
   echo -----------------------------------
   wget -q --directory-prefix=/tmp http://download.jetbrains.com/cpp/CLion-${CLION_VERSION}.tar.gz
   su -l -c "mkdir -p /home/vagrant/bin" vagrant
   su -l -c "tar xvfz /tmp/CLion-${CLION_VERSION}.tar.gz -C /home/vagrant/bin" vagrant
   su -l -c "touch ${INSTALL_STATUS_DIR}/clion-2017.3.2.installed" vagrant
fi

echo -----------------------------------
echo CLEANUP
echo -----------------------------------
apt-get -y clean
apt-get -y autoremove
