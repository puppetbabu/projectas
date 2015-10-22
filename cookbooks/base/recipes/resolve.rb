
template '/etc/resolve.conf' do
  source 'resolve.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
end


