user {"postgres":
                  ensure     => "present",
                  managehome => true,
                  home => '/usrdata/pgsql',
                  shell => '/bin/bash',
                 } ->
package {"libmemcached-dev":
         ensure => "installed",
        } ->

exec {"pgpool-insrall":
          command => "mkdir -p /usrdata/pgpool;
                      wget -e use_proxy=yes -e http_proxy=10.135.80.164:8678 -O /usrdata/source/pgpool-II-3.3.4.tar.gz http://www.pgpool.net/download.php?f=pgpool-II-3.3.4.tar.gz;
                      cd /usrdata/source;
                      tar -zxvf pgpool-II-3.3.4.tar.gz;
                      cd pgpool-II-3.3.4;
                      ./configure --prefix=/usrdata/pgpool --with-pgsql-includedir=/usrdata/pgsql/include --with-pgsql-libdir=/usrdata/pgsql/lib  --with-memcached=/usrdata/memcached/include;
                       make;
                       make install;
                       mkdir -p /usrdata/pgpool/var/run;
                       mkdir -p /usrdata/pgpool/var/logs;
                       chown -R postgres:postgres /usrdata/pgpool/;",
          path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
        }
