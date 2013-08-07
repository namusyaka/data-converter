require File.expand_path("../../lib/data-converter", __FILE__)
require 'rubygems'
require 'rspec-html-matchers'
require 'rspec'

describe DataConverter do
  before(:all) do
    @array_data = [0, 1, 2, ["string", DataConverter, :symbol, 0.1]]
    @hash_data  = { :foo => ["bar", "baz"], :hoge => { :fuga => :symbol }, :const => DataConverter, :float => 0.1 }
  end

  it "should support array." do
    actual_html = DataConverter.parse(@array_data)
    expect(actual_html).to have_tag('ul') do
      with_tag 'li', :text => 0
      with_tag 'li', :text => 1
      with_tag 'li', :text => 2
      with_tag 'li > ul'
      with_tag 'li > ul li', :text => "string"
      with_tag 'li > ul li', :text => "DataConverter"
      with_tag 'li > ul li', :text => "symbol"
      with_tag 'li > ul li', :text => "0.1"
    end
  end

  it "should support hash." do
    actual_html = DataConverter.parse(@hash_data)
    expect(actual_html).to have_tag('dl') do
      with_tag 'dt', :text => 'foo'
      with_tag 'dt', :text => 'hoge'
      with_tag 'dt', :text => 'const'
      with_tag 'dt', :text => 'float'
      with_tag 'dd > ul'
      with_tag 'dd > ul > li', :text => 'bar'
      with_tag 'dd > ul > li', :text => 'baz'
      with_tag 'dd > dl'
      with_tag 'dd > dl > dt', :text => 'fuga'
      with_tag 'dd > dl > dd', :text => 'symbol'
      with_tag 'dd', :text => "DataConverter"
      with_tag 'dd', :text => '0.1'
    end
  end
end
