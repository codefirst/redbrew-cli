#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-

require File.dirname(__FILE__) + '/../spec_helper'

describe Redbrew::RedmineHome do
  context 'valid? be false' do
    subject { Redbrew::RedmineHome.new }
    it { should_not be_valid }
  end

  context 'valid? be true' do
    subject { Redbrew::RedmineHome.new(File.dirname(__FILE__) + '/../testdata/redmine') }
    it { should be_valid }
  end

  context 'version' do
    subject { Redbrew::RedmineHome.new(File.dirname(__FILE__) + '/../testdata/redmine') }
    its(:version) { should == '1.2.3' }
  end

  context 'run with current path' do
    subject { Redbrew::RedmineHome.new }
    its(:plugins_directory) { should == './plugins/' }
    its(:tmp) { should == './tmp/' }
  end
end

