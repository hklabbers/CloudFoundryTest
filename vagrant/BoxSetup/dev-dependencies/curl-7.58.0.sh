if [ ! -f /home/vagrant/.install_status/curl-7.58.0.installed ] 
then
   mkdir -p /home/vagrant/dev-deps
   mkdir -p /tmp/dev-deps
   wget --quiet --directory-prefix=/tmp/dev-deps/ https://github.com/curl/curl/releases/download/curl-7_58_0/curl-7.58.0.tar.gz 
   tar -xvzf /tmp/dev-deps/curl-7.58.0.tar.gz -C /tmp/dev-deps/

  # Build curl 7.58.0
  cd /tmp/dev-deps/curl-7.58.0
  ./configure --prefix=/home/vagrant/dev-deps/ --with-ssl --disable-shared
  make
  make install
  touch /home/vagrant/.install_status/curl-7.58.0.installed
fi
