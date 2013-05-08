require 'spec_helper'

describe "zsh::default" do
  let(:chef_run) do
    runner = ChefSpec::ChefRunner.new(
      log_level: :error,
      cookbook_path: COOKBOOK_PATH
    )
    Chef::Config.force_logger true
    runner.converge('recipe[zsh::default]')
  end

  it "installs zsh" do
    expect(chef_run).to install_package "zsh"
  end

  context "debian 7.0" do
    let(:chef_run) do
      runner = ChefSpec::ChefRunner.new(
        platform: 'debian', 
        version: '7.0',
        log_level: :error,
        cookbook_path: COOKBOOK_PATH
      )
      Chef::Config.force_logger true
      runner.converge('recipe[zsh::default]')
    end

    it "installs zsh-doc" do
      expect(chef_run).to install_package "zsh-doc"
    end
  end

  context "rhel" do
    let(:chef_run) do
      runner = ChefSpec::ChefRunner.new(
        platform: 'redhat', 
        version: '6.3',
        log_level: :error,
        cookbook_path: COOKBOOK_PATH
      )
      Chef::Config.force_logger true
      runner.converge('recipe[zsh::default]')
    end

    it "installs zsh-html" do
      expect(chef_run).to install_package "zsh-html"
    end
  end

  context "fedora" do
    let(:chef_run) do
      runner = ChefSpec::ChefRunner.new(
        log_level: :error,
        cookbook_path: COOKBOOK_PATH
      ) do |node|
        node.override['platform_family'] = 'fedora'
      end
      Chef::Config.force_logger true
      runner.converge('recipe[zsh::default]')
    end

    it "installs zsh-html" do
      expect(chef_run).to install_package "zsh-html"
    end
  end
end
