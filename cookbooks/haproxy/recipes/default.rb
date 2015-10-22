#
# Cookbook Name:: haproxy
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'haproxy' do
  action :upgrade
end

template '/etc/haproxy/haproxy.cfg' do
  source 'haproxy.cfg.erb'
  mode '0644'
  notifies :restart, 'service[haproxy]'
end


service 'haproxy' do
  action [:start, :enable]
  #subscribes :restart, 'template[/etc/haproxy/haproxy.cfg]'
end
