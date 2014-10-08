require 'serverspec'

set :backend, :exec

describe service('jenkins') do
  it { should be_enabled }
  it { should be_running }
end

%w{docker chef berks foodcritic kitchen knife}.each do |cmd|
  describe command("which #{cmd}") do
    its(:exit_status) { should eq 0 }
  end
end
