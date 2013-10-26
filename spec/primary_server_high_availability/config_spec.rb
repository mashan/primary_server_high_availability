require 'spec_helper'

describe "PrimaryServerHighAvailability::Config" do
  before do
    config = <<-EOF
hosts:
  primary: 192.2.0.1
  secondaries:
    - 192.168.2.0.2
    - 192.168.2.0.3
health_check:
  check_interval: 3
  retry_interval: 3
  retry_times: 3
  mysql:
    user: check_user
    password: 
    port: 3306 #default
failover:
  command: /usr/local/sbin/myfailover_command
    EOF

    open('/tmp/primary_server_high_availability_test.yaml','w'){|f| f.write config}
    @config_file = '/tmp/primary_server_high_availability_test.yaml'
  end

  after do
    File.delete(@config_file) if File.exist?(@config_file)
  end

  describe '#read' do
    it do
      file = File.open(@config_file, 'r')
      file.each do |line|
        puts line
      end
    end
  end
end
