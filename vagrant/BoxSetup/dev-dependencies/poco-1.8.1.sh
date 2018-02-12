if [ ! -f /home/vagrant/.install_status/poco-1.8.1.installed ] 
then
   mkdir -p /home/vagrant/dev-deps
   mkdir -p /tmp/dev-deps
   wget --quiet --directory-prefix=/tmp/dev-deps/ https://pocoproject.org/releases/poco-1.8.1/poco-1.8.1-all.tar.gz
   tar -xvzf /tmp/dev-deps/poco-1.8.1-all.tar.gz -C /tmp/dev-deps/

  # Build poco-1.8.1
  cd /tmp/dev-deps/poco-1.8.1-all
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Debug -DPOCO_STATIC=ON -DCMAKE_INSTALL_PREFIX=/home/vagrant/dev-deps -DENABLE_CPPUNIT=OFF -DENABLE_XML=OFF -DENABLE_PDF=OFF -DENABLE_UTIL=ON -DENABLE_NET=ON -DDISABLE_INTERNAL_OPENSSL=ON -DENABLE_SQL=OFF -DENABLE_SQL_SQLITE=OFF -DENABLE_SQL_MYSQL=OFF -DENABLE_SQL_POSTGRESQL=OFF -DENABLE_SQL_ODBC=OFF -DENABLE_APACHECONNECTOR=OFF -DENABLE_CPPPARSER=OFF -DENABLE_POCODOC=OFF -DENABLE_PAGECOMPILER=OFF -DENABLE_PAGECOMPILER_FILE2PAGE=OFF -DENABLE_REDIS=ON -DENABLE_MONGODB=OFF -DENABLE_TESTS=OFF -DENABLE_SAMPLES=OFF -DENABLE_NETSSL_OPENSSL=ON -DENABLE_CRYPT=ON ..
  make
  make install
  cd /home/vagrant/dev-deps
  echo "create lib/libPocoAlld.a" > /home/vagrant/dev-deps/poco-all.mri
  echo "addlib lib/libPocoFoundationd.a" >> /home/vagrant/dev-deps/poco-all.mri
  echo "addlib lib/libPocoDatad.a" >> /home/vagrant/dev-deps/poco-all.mri
  echo "addlib lib/libPocoJSONd.a" >> /home/vagrant/dev-deps/poco-all.mri
  echo "addlib lib/libPocoNetd.a" >> /home/vagrant/dev-deps/poco-all.mri
  echo "addlib lib/libPocoUtild.a" >> /home/vagrant/dev-deps/poco-all.mri
  echo "save" >> /home/vagrant/dev-deps/poco-all.mri
  echo "end" >> /home/vagrant/dev-deps/poco-all.mri
  ar -M < poco-all.mri
  touch /home/vagrant/.install_status/poco-1.8.1.installed
fi
