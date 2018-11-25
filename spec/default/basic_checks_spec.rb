require 'spec_helper'

describe service('nginx'), :if => os[:family] == 'alpine' do
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end
