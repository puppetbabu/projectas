service 'haproxy' do
  action [:disable, :stop]
end

file '/etc/haproxy/haproxy.cfg' do
  action :delete
end

package 'haproxy' do
  action :purge
end

