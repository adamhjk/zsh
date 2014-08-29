## Comments make me happy, I guess

require 'spec_helper'

describe "zsh::default" do
  let(:chef_run) do
    runner = ChefSpec::Runner.new(
      log_level: :error
    )
    Chef::Config.force_logger true
    runner.converge('recipe[zsh::default]')
  end

  it "installs zsh" do
    expect(chef_run).to install_package "zsh"
  end

  context "debian 7.0" do
    let(:chef_run) do
      runner = ChefSpec::Runner.new(
        platform: 'debian', 
        version: '7.0',
        log_level: :error
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
      runner = ChefSpec::Runner.new(
        platform: 'redhat', 
        version: '6.3',
        log_level: :error
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
      runner = ChefSpec::Runner.new(
        log_level: :error
      ) do |node|
        node.automatic['platform_family'] = 'fedora'
      end
      Chef::Config.force_logger true
      runner.converge('recipe[zsh::default]')
    end

    it "installs zsh-html" do
      expect(chef_run).to install_package "zsh-html"
    end
  end
end
