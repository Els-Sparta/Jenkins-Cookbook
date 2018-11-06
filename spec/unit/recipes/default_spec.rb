#
# Cookbook:: jenkins
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'jenkins::default' do
  context 'When all attributes are default, on Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end
    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'updates all sources' do
      expect(chef_run).to update_apt_update('update')
    end

    it 'should install java' do
      expect(chef_run).to install_package("openjdk-8-jdk")
    end

    it 'should install ruby for rails' do
      expect(chef_run). to install_package('ruby-rails')
    end

    it 'should install rails' do
      expect(chef_run). to install_package('rails')
    end

    it 'should install jenkin' do
      expect(chef_run).to install_package("jenkins")
    end

    it 'should add jenkins to apt_repository' do
      expect(chef_run).to add_apt_repository("add_jenkins")
    end

    it 'should check if jenkins starts' do
      expect(chef_run).to start_service('jenkins')
      expect(chef_run).to enable_service('jenkins')
    end
  end
end
