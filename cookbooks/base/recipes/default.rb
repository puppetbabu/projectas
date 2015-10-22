#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'base::hosts'
include_recipe 'base::resolve'
include_recipe 'base::ssh_keys'
