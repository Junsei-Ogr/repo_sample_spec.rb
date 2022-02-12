require 'spec_helper'

describe port(22) do
  it { should be_listening }
end

describe package('nginx'), :if => os[:family] == 'amazon' do
 it { should be_installed }
end

describe port(80) do
 it { should be_listening }
end

# Ruby2.6.3がインストールされていること
describe command('ruby -v') do
 its(:stdout) { should match /ruby 2\.6\.3+/ }
end

describe user('ec2-user') do
  it { should exist }
end

describe package('git') do
  it { should be_installed }
end
