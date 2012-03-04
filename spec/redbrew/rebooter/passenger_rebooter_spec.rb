#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-

require File.dirname(__FILE__) + '/../../spec_helper'

describe Redbrew::Rebooter::PassengerRebooter do
  describe 'reboot ' do
    context 'success' do
      before do
        redmine_home = Redbrew::RedmineHome.new("/path/to/redmine/home")
        restart_file = "#{redmine_home.tmp}/restart.txt"
        @rebooter = Redbrew::Rebooter::PassengerRebooter.new(redmine_home)
        @rebooter.should_receive(:system).with("touch #{restart_file}") { true }
      end
      subject { @rebooter }
      its (:reboot) { should be_true }
    end
  end
end
