search("node", "platform:centos").each do | server |
  log "Centos Servers => #{server["fqdn"]}/#{server["apache"]["sites"]}"
end
