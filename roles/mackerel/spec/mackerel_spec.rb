require 'spec_helper'

describe service('mackerel-agentd') do
  it { should be_running.under('supervisor') }
end

describe file('/var/log/mackerel-agent') do
  it { should be_directory }
  it { should be_mode 755 }
end

describe file('/etc/mackerel-agent/mackerel-agent.conf') do
  it { should be_file }
  it { should be_readable }
  its(:content) { should match /^apikey\s+=\s+"[^"]+"$/ }
end

describe process("mackerel-agent") do
  its(:user) { should eq "root" }
  its(:args) { should match /--conf=\/etc\/mackerel-agent\/mackerel-agent\.conf/ }
end
