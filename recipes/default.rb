#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
pkgs = value_for_platform_family(
  ["rhel", "fedora"] => %w{ bzip2-devel libc-client-devel curl-devel freetype-devel gmp-devel libjpeg-devel krb5-devel libmcrypt-devel libpng-devel openssl-devel t1lib-devel mhash-devel },
  [ "debian", "ubuntu" ] => %w{ libbz2-dev libc-client2007e-dev libcurl4-gnutls-dev libfreetype6-dev libgmp3-dev libjpeg62-dev libkrb5-dev libmcrypt-dev libpng12-dev libssl-dev libt1-dev },
  "default" => %w{ libbz2-dev libc-client2007e-dev libcurl4-gnutls-dev libfreetype6-dev libgmp3-dev libjpeg62-dev libkrb5-dev libmcrypt-dev libpng12-dev libssl-dev libt1-dev }
  )

pkgs.each do |pkg|
  package pkg do
    action :install
  end
end

configure_options = node['php']['configure_options'].join(" ")

version = node['php']['version']

cookbook_file "#{node['php']['src_dir']}#{node['php']['version']}.tar.gz" do
  mode 0644
end

bash "build php" do
  cwd node['php']['src_dir']
  code <<-EOF
  tar -zxvf #{version}.tar.gz
  (cd #{version} && ./configure #{configure_options})
  (cd #{version} && make && make install)
  EOF
  # not_if "which php"
end

template "#{node['php']['conf_dir']}/php.ini" do
  source "php.ini.erb"
  owner "root"
  group "root"
  mode "0644"
  variables(:directives => node['php']['directives'])
end
