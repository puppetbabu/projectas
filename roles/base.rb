name "base"
description "Base Server Role"
run_list  "recipe[ntp]", "recipe[chef-client]", "recipe[chef-client::delete_validation]",  "recipe[motd]", "recipe[users]"
default_attributes({
  "chef_client" => { "interval" => '60' , 
  	                 "splay"    => 20
  }, 
  "ntp" => {
    "servers" => ['time0.int.example.org', 'time1.int.example.org']
  }
})

