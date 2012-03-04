#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-

require File.dirname(__FILE__) + '/../../spec_helper'

describe Redbrew::Rebooter::Rebooter do
  REDMINE_HOME = "/path/to/redmine/home"

  describe 'passenger ' do
    subject { Redbrew::Rebooter::Rebooter.create(Redbrew::Rebooter::PassengerRebooter::TYPE, REDMINE_HOME) }
    its(:class) { should == Redbrew::Rebooter::PassengerRebooter }
  end
end
