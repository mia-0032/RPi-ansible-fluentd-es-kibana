require 'spec_helper'

describe command('$SHELL -lc "rbenv versions"') do
  let(:disable_sudo) { true }
  its(:stdout) { should match /^\*\s+2\.2\.3/ }
end
