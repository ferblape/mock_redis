require 'spec_helper'

describe "ZSetMethods module" do
  it "should implement zadd method" do
    @redis.zadd(:myzset, 33, 'myvalue').should == 1
    @redis.scores[:myzset]['myvalue'].should == 33

    @redis.zadd(:myzset, 15, 'other value').should == 1
    @redis.scores[:myzset]['other value'].should == 15
  end

  it "should implement zcard method" do
    @redis.zcard(:wadus).should == 0

    @redis.zadd(:myzset, 33, 'myvalue')
    @redis.zcard(:myzset).should == 1
  end

  it "should implement zrem method" do
    @redis.zadd(:myzset, 1, 'value #1')
    @redis.zadd(:myzset, 2, 'value #2')
    @redis.zadd(:myzset, 3, 'value #3')
    @redis.zcard(:myzset).should == 3

    @redis.zrem(:myzset, 'value #2').should == 1
    @redis.scores[:myzset]['value #2'].should be_nil
    @redis.zcard(:myzset).should == 2
  end

  it "should implement zscore method" do
    @redis.zadd(:myzset, 5, 'value #1')
    @redis.zscore(:myzset, 'value #1').should == 5

    @redis.zscore(:myzset, 'value #2').should be_nil
  end

  it "should implement zrange method" do
    @redis.zadd(:myzset, 1, 'value #1')
    @redis.zadd(:myzset, 2, 'value #2')
    @redis.zadd(:myzset, 3, 'value #3')

    @redis.zrange(:myzset, 0, -1).should == ['value #1', 'value #2', 'value #3']
    @redis.zrange(:myzset, 0, 1).should  == ['value #1', 'value #2']
    @redis.zrange(:myzset, 2, 3).should  == ['value #3']
    @redis.zrange(:myzset, -2, -1).should  == ['value #2', 'value #3']
  end
end