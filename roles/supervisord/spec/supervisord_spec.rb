require 'spec_helper'

describe process("supervisord") do
  it { should be_running }
end

describe service('supervisor') do
  it { should be_enabled }
  it { should be_running }
end

describe file('/etc/supervisor/supervisord.conf') do
  it { should be_file }
  it { should be_readable.by_user('root') }
end

describe file('/var/run/supervisor.sock') do
  it { should be_socket }
end

describe file('/var/log/supervisor/supervisord.log') do
  it { should be_file }
  it { should be_writable.by_user('root') }
end

describe file('/var/run/supervisord.pid') do
  it { should be_file }
end

describe file('/etc/supervisor/conf.d') do
  it { should be_directory }
end
