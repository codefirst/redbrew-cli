#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-

require File.dirname(__FILE__) + '/../spec_helper'

describe Redbrew::CLI do
  describe 'version' do
    subject { capture(:stdout) { Redbrew::CLI.new(['version']).run } }
    it { should == "Redbrew #{Redbrew::VERSION}\n" }
  end

  describe 'help' do
    subject { capture(:stdout) { Redbrew::CLI.new(['help']).run } }
    it { should == Redbrew::CLI::HELP }
  end

  describe 'install' do
    before do
      plugin_id = 'redmine_attachments_size'
      @result = 'success'

      redmine_home = Redbrew::RedmineHome.new
      redmine_home.stub(:valid?) { true }

      core = Redbrew::Core.new('/REDMINE/HOME')
      core.should_receive(:install).with(plugin_id) { @result }

      @cli = Redbrew::CLI.new(['install', plugin_id])
      @cli.stub(:core) { core }
      @cli.stub(:redmine_home) { redmine_home }
    end
    subject { capture(:stdout) { @cli.run } }
    it { should == "#{@result}\n" }
  end

  describe 'restart' do
    before do
      server_type = Redbrew::Rebooter::PassengerRebooter::TYPE
      @result = 'reboot successful'

      redmine_home = Redbrew::RedmineHome.new
      redmine_home.stub(:valid?) { true }

      core = Redbrew::Core.new('/REDMINE/HOME')
      core.should_receive(:reboot).with(server_type) { @result }

      @cli = Redbrew::CLI.new(['reboot', server_type])
      @cli.stub(:core) { core }
      @cli.stub(:redmine_home) { redmine_home }
    end

    subject { capture(:stdout) { @cli.run } }
    it { should == "#{@result}\n" }
  end
end
