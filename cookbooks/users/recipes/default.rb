#
# Cookbook Name:: users
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#



search("users", "*:*").each do | user_data |
  user user_data["id"] do
    action :create
    comment user_data["comment"]
    uid user_data["uid"]
    gid user_data["gid"]
    home user_data["home"]
    shell user_data["shell"]
    password  "$1$T2.BDsE6$Lv68uTlTh0mZinePs9iJx0"
  end
end

include_recipe 'users::groups'
