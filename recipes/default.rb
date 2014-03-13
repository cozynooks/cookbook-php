#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

pkgs = %w{
  libxml2-devel
  openssl-devel
  db4-devel
  libjpeg-devel
  libpng-devel
  freetype-devel
  libicu-devel
  libmcrypt-devel
  readline-devel
  libxslt-devel
}

default['php']['configure_options'] = %W{--prefix=/opt/php/5.5.9
                                            --with-libdir=lib64
                                            --with-apxs2=/opt/httpd/2.4.7/bin/apxs
                                            --enable-mbstring
                                            --enable-intl
                                            --with-icu-dir=/usr
                                            --with-gettext=/usr
                                            --with-pcre-regex=/opt/pcre/8.34
                                            --with-readline=/usr
                                            --with-libxml-dir=/usr/bin/xml2-config
                                            --enable-soap
                                            --enable-wddx
                                            --with-xmlrpc
                                            --with-xsl=/usr
                                            --with-mysql=mysqlnd
                                            --with-mysqli=mysqlnd
                                            --with-pdo-mysql=mysqlnd
                                            --with-pgsql=/opt/postgresql-9.3.3 \
                                            --with-pdo-pgsql=/opt/postgresql-9.3.3 \
                                            --with-zlib=/usr
                                            --with-zlib-dir=/usr
                                            --enable-dba
                                            --with-db4=/usr
                                            --with-gd
                                            --with-jpeg-dir=/usr
                                            --with-png-dir=/usr
                                            --with-freetype-dir=/usr
                                            --enable-gd-native-ttf
                                            --enable-gd-jis-conv
                                            --with-openssl=/usr
                                            --with-mcrypt=/usr
                                            --enable-bcmath}

