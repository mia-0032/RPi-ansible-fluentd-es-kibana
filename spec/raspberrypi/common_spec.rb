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
