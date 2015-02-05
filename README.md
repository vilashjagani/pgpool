# pgpool installation

1) install puppet Agent on server

      wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb

      dpkg -i puppetlabs-release-trusty.deb

      apt-get install puppet
      Add Proxy setting in puppet
      vi /etc/puppet/puppet.conf

     http_proxy_host = x.x.x.x

     http_proxy_port = port-number 

     https_proxy_host = x.x.x.x

     https_proxy_port = port-number

2) install pgpooll
  
    First of all, make sure "/usrdata" mount point is created /available on server
     A) Download postgres-9.4-install puppet menifest ( postgresql needs to be installed for pgpool because it uses library of          postgres servers.
          wget https://github.com/vilashjagani/postgres-install-9.4/raw/master/postgres-9.4-install.pp
          
          puppet apply postgres-9.4-install.pp
          
    B)  install now pgpool
          wget https://github.com/vilashjagani/pgpool/raw/master/pgpool-install.pp
          
          puppet apply pgpool-install.pp
          
    C)   configure your memcahced server IP address in /usrdata/pgpool/etc/pgpool.conf
          memqcache_memcached_host = 'X.X.X.X'
    d)    configure your master /slave server IP address in /usrdata/pgpool/etc/pgpool.conf
            backend_hostname0 = 'X.X.X.N1'
            backend_hostname1 = 'X.X.X.N2'
    e)     if you need more users , you can add in /usrdata/pgpool/etc/pcp.conf file
           
           username:password-value
           
           password-value , you can generate using command "/usrdata/pgpool/pg_md5 userpasswd"
          
    f)   start pgpool service 
          /etc/init.d/pgpool start
