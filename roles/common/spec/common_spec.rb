require 'spec_helper'

describe command('date') do
  let(:disable_sudo) { true }
  its(:stdout) { should match /JST/ }
end

describe command('ulimit -n') do
  let(:disable_sudo) { true }
  its(:stdout) { should match /65536/ }
end

describe file('.profile') do
  let(:disable_sudo) { true }
  its(:content) { should match /export LANG=ja_JP\.UTF-8/ }
end

describe file('/etc/cron.d/cron-apt') do
  its(:content) { should match /0\s+4\s+\*\s+\*\s+\*\s+root\s+test -x \/usr\/sbin\/cron-apt && \/usr\/sbin\/cron-apt/ }
end

describe 'Linux kernel parameters' do
  context linux_kernel_parameter('fs.file-max') do
    its(:value) { should eq 794573 }
  end
end

describe process("ntpd") do
  it { should be_running }
end

describe service('ntp') do
  it { should be_enabled }
  it { should be_running }
end

describe command('ntpq -p') do
  let(:disable_sudo) { true }
  its(:stdout) { should match /\.nict\.go\./ }
end

describe iptables do
  it { should have_rule('-A INPUT -p tcp -m tcp --dport 80 -j ACCEPT') }
  it { should have_rule('-A INPUT -p udp -m state --state NEW -m udp --dport 5353 -j ACCEPT') }
  it { should have_rule('-A INPUT -p tcp -m state --state NEW -m tcp --dport 8888 -j ACCEPT') }
  it { should have_rule('-A INPUT -p tcp -m state --state NEW -m tcp --dport 24220 -j ACCEPT') }
  it { should have_rule('-A INPUT -p tcp -m state --state NEW -m tcp --dport 24224 -j ACCEPT') }
  it { should have_rule('-A INPUT -p udp -m state --state NEW -m udp --dport 24224 -j ACCEPT') }
end

describe file('/etc/ssh/sshd_config') do
  it { should be_file }
  its(:content) { should match /^Protocol\s+2/ }
  its(:content) { should match /^PermitRootLogin\s+no/ }
  its(:content) { should match /^PermitEmptyPasswords\s+no/ }
  its(:content) { should match /^ChallengeResponseAuthentication\s+no/ }
  its(:content) { should match /^PasswordAuthentication\s+no/ }
end
