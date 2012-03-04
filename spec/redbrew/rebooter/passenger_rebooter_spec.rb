#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-

require File.dirname(__FILE__) + '/../../spec_helper'

describe Redbrew::Rebooter::PassengerRebooter do
  REDMINE_HOME = "/path/to/redmine/home"
  RESTART_FILE = "#{REDMINE_HOME}/tmp/restart.txt"
  describe 'reboot ' do
    context 'success' do
      before do
        @rebooter = Redbrew::Rebooter::PassengerRebooter.new(REDMINE_HOME)
        @rebooter.should_receive(:system).with("touch #{RESTART_FILE}") { true }
      end
      subject { @rebooter }
      its (:reboot) { should be_true }
    end
  end
end
