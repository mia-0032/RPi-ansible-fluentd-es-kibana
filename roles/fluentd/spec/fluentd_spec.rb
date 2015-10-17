require 'spec_helper'

describe service('fluentd') do
  it { should be_running.under('supervisor') }
end

describe package('fluentd') do
  let(:disable_sudo) { true }
  let(:path) { '$HOME/.rbenv/versions/2.2.3/bin/:$PATH' }
  it { should be_installed.by('gem') }
end

describe package('fluent-plugin-rewrite-tag-filter') do
  let(:disable_sudo) { true }
  let(:path) { '$HOME/.rbenv/versions/2.2.3/bin/:$PATH' }
  it { should be_installed.by('gem') }
end

describe package('fluent-plugin-secure-forward') do
  let(:disable_sudo) { true }
  let(:path) { '$HOME/.rbenv/versions/2.2.3/bin/:$PATH' }
  it { should be_installed.by('gem') }
end

describe package('fluent-plugin-record-reformer') do
  let(:disable_sudo) { true }
  let(:path) { '$HOME/.rbenv/versions/2.2.3/bin/:$PATH' }
  it { should be_installed.by('gem') }
end

describe package('fluent-plugin-record-modifier') do
  let(:disable_sudo) { true }
  let(:path) { '$HOME/.rbenv/versions/2.2.3/bin/:$PATH' }
  it { should be_installed.by('gem') }
end

describe package('fluent-plugin-forest') do
  let(:disable_sudo) { true }
  let(:path) { '$HOME/.rbenv/versions/2.2.3/bin/:$PATH' }
  it { should be_installed.by('gem') }
end

describe package('fluent-plugin-rewrite') do
  let(:disable_sudo) { true }
  let(:path) { '$HOME/.rbenv/versions/2.2.3/bin/:$PATH' }
  it { should be_installed.by('gem') }
end

describe file('/var/log/fluent') do
  it { should be_directory }
  it { should be_mode 777 }
end

describe file('/etc/fluent/conf.d') do
  it { should be_directory }
  it { should be_mode 755 }
end

describe file('/etc/fluent/fluent.conf') do
  it { should be_file }
  it { should be_readable }
  its(:content) { should match /@include \/etc\/fluent\/conf\.d\/\*/ }
end

describe process("fluentd") do
  its(:user) { should eq "pi" }
  its(:args) { should match /-c \/etc\/fluent\/fluent\.conf/ }
end
