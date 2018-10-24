# # encoding: utf-8

# Inspec test for recipe jenkins::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe package "openjdk-8-jdk" do
  it { should be_installed }
  its("version") { should match "8u181-b13-0ubuntu0.16.04.1" }
end

describe apt("http://pkg.jenkins.io/debian-stable") do
  it { should exist }
  it { should be_enabled }
end

describe package "jenkins" do
  it { should be_installed }
end

describe service("jenkins") do
  it { should be_running }
  it { should be_enabled }
end
