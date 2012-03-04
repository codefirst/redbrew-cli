#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-

require File.dirname(__FILE__) + '/../../spec_helper'

describe Redbrew::Fetcher do
  describe 'fetch' do
    it 'fetch error' do
      lambda{ Redbrew::Fetcher.new('', '').fetch }.should raise_error
    end
  end

  describe 'create git' do
    subject { Redbrew::Fetcher.create('git', '', '')}
    its(:class) { should == Redbrew::GitFetcher.new('', '').class }
  end

  describe 'create mercurial' do
    subject { Redbrew::Fetcher.create('mercurial', '', '')}
    its(:class) { should == Redbrew::MercurialFetcher.new('', '').class }
  end
end
