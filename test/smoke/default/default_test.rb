
describe file('/usr/local/bin/packer') do
  it { should exist }
  it { should be_executable }
  it { should be_owned_by 'root' }
end

describe command('packer --version') do
  its('exit_status') { should eq 0 }
end
