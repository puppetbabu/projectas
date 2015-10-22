#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'httpd' do
  action :install
end


execute 'disable_vhost' do
  command 'mv /etc/httpd/conf.d/welcome.conf /etc/httpd/conf.d/welcome.conf.disabled'
  #not_if  "test -e /etc/httpd/conf.d/welcome.conf.disabled"
  creates '/etc/httpd/conf.d/welcome.conf.disabled'
  #action :nothing
  notifies :restart, 'service[httpd]'
end

node["apache"]["sites"].each do | site_name, site_data |
  document_root = "/srv/apache/#{site_name}"

  template "/etc/httpd/conf.d/#{site_name}.conf" do
    source 'custom.erb'
    mode '0644'
    variables(
    	:document_root => document_root,
    	:port => site_data["port"]
    )
    notifies :restart, 'service[httpd]'
  end
  
  directory document_root do
    mode '0755'
    recursive true
    action :create
  end
  
  template "#{document_root}/index.html" do
    source 'index.html.erb'
    mode '0644'
    variables(
    	:site_name => site_name,
    	:port => site_data["port"]
    )
  end
  
end


service 'httpd' do
  action [:start, :enable]
end


