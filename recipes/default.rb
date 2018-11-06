#
# Cookbook:: jenkins
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
apt_update "update" do
  action :update
end

package "openjdk-8-jdk" do
  action :install
end

apt_update "update" do
  action :update
end

package "ruby-full" do
  action :install
end

apt_repository "add_jenkins" do
  key "https://pkg.jenkins.io/debian-stable/jenkins.io.key"
  uri "http://pkg.jenkins.io/debian-stable"
  distribution "binary/"
  action :add
end

apt_update "update" do
  action :update
end

package "jenkins" do
  action :install
end

service "jenkins" do
  action [:start, :enable]
end
