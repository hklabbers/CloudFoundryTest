if [ ! -f /home/vagrant/.install_status/catch2-2.1.1.installed ] 
then
   mkdir -p /home/vagrant/dev-deps
   mkdir -p /tmp/dev-deps
   wget --quiet --directory-prefix=/tmp/dev-deps/ https://github.com/catchorg/Catch2/releases/download/v2.1.1/catch.hpp
   cp /tmp/dev-deps/catch.hpp /home/vagrant/dev-deps/include/catch.hpp
  touch /home/vagrant/.install_status/catch2-2.1.1.installed
fi
