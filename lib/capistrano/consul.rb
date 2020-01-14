require 'capistrano/consul/version'
require 'diplomat'
require 'net/ssh/gateway'

module Capistrano
  module Consul
    def self.setup
      return if @url
      @url = fetch(:consul_url)
      @token = fetch(:consul_token)
      return false unless @url
      @ssh_gateway = fetch(:consul_ssh_gateway)
      if @ssh_gateway
        @gateway = Net::SSH::Gateway.new(@ssh_gateway[:host], @ssh_gateway[:username] || @ssh_gateway[:user], @ssh_gateway[:options] || {})
        @gateway.open('127.0.0.1', @ssh_gateway[:port], @ssh_gateway[:port])
      end

      Diplomat.configure do |config|
        config.url = @url
        if @token
          config.acl_token = @token
        end
      end
    end
  end

  module DSL
    def consul_all_nodes(properties = {})
      Consul.setup
      Diplomat::Node.get_all.each_with_index do |node, index|
        properties[:primary] = true if index == 0
        server(node['Address'], properties)
      end
    end

    def consul_service(service_name, properties = {})
      Consul.setup
      Diplomat::Service.get(service_name, :all).each_with_index do |node, index|
        properties[:primary] = true if index == 0
        server(node['Address'], properties)
      end
    end
  end
end
