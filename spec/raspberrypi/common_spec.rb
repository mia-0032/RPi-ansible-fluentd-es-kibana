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
