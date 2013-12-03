lib_dir = node['kernel']['machine'] =~ /x86_64/ ? 'lib64' : 'lib'
default['php']['conf_dir']      = '/etc'
default['php']['ext_conf_dir']  = '/etc/php.d'
default['php']['ext_dir']       = "/usr/#{lib_dir}/php/modules"
default['php']['prefix_dir']    = "/usr/local/"

default['php']['version'] = 'php-5.4.19'
default['php']['configure_options'] = %W{--prefix=#{php['prefix_dir']}
                                          --with-libdir=#{lib_dir}
                                          --with-config-file-path=#{php['conf_dir']}
                                          --with-config-file-scan-dir=#{php['ext_conf_dir']}
                                          --with-apxs2=/usr/sbin/apxs
                                          --with-pear
                                          --with-zlib
                                          --with-openssl
                                          --with-kerberos
                                          --with-bz2
                                          --with-curl
                                          --enable-ftp
                                          --enable-zip
                                          --enable-exif
                                          --with-gd
                                          --enable-gd-native-ttf
                                          --with-gettext
                                          --with-gmp
                                          --with-mhash
                                          --with-iconv
                                          --enable-sockets
                                          --enable-soap
                                          --with-xmlrpc
                                          --with-libevent-dir
                                          --with-mcrypt
                                          --enable-mbstring
                                          --with-t1lib
                                          --with-mysql
                                          --with-mysqli=/usr/bin/mysql_config
                                          --with-mysql-sock
                                          --with-sqlite3
                                          --with-pdo-mysql
                                          --with-pdo-sqlite}
default['php']['directives'] = {}
