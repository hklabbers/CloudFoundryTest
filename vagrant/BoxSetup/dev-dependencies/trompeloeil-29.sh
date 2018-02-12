if [ ! -f /home/vagrant/.install_status/trompeloeil-29.installed ] 
then
   mkdir -p /home/vagrant/dev-deps
   mkdir -p /tmp/dev-deps
   wget --quiet --directory-prefix=/tmp/dev-deps/ https://github.com/rollbear/trompeloeil/archive/v29.tar.gz 
   tar -xvzf /tmp/dev-deps/v29.tar.gz -C /tmp/dev-deps/
   cp /tmp/dev-deps/trompeloeil-29/include/trompeloeil.hpp /home/vagrant/dev-deps/include/trompeloeil.hpp
   touch /home/vagrant/.install_status/trompeloeil-29.installed
fi
