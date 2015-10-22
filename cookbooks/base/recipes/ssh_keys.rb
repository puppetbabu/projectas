directory '/root/.ssh' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end


template '/root/.ssh/authorized_keys' do
  source 'authorized_keys.erb'
  owner 'root'
  group 'root'
  mode '0600'
end


