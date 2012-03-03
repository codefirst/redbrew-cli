#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-

require File.dirname(__FILE__) + '/../../spec_helper'

describe Redbrew::Fetcher do
#  describe 'fetch' do
#    lambda{ Redbrew::Fetcher.new('', '').fetch }.should raise_error
#  end

  describe 'create' do
    subject { Redbrew::Fetcher.create('git', '', '')}
    its(:class) { should == Redbrew::GitFetcher.new('', '').class }
  end
end
