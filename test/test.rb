require 'test/unit'
require File.expand_path('../../lib/data-converter', __FILE__)

class Test_DataConverter < Test::Unit::TestCase
  HASH_RESULT = <<-EOS
<dl>
<dt>a</dt>
<dd><dl>
<dt>b</dt>
<dd><dl>
<dt>c</dt>
<dd><ul>
<li>0</li>
<li>1</li>
<li>2</li>
<li>3</li>
</ul>
</dd>
</dl>
</dd>
</dl>
</dd>
</dl>
  EOS

  ARRAY_RESULT = <<-EOS
<ul>
<li><dl>
<dt>f</dt>
<dd><ul>
<li>4</li>
<li>5</li>
<li>6</li>
<li>7</li>
</ul>
</dd>
</dl>
</li>
</ul>
  EOS

  def setup
    @hash_data = { :a => { :b => { :c => [0, 1, 2, 3] } } }
    @array_data = [{ :f => [4, 5, 6, 7] }]
    @class = DataConverter
  end
 
  def test_array_parse
    assert_equal(ARRAY_RESULT, @class.parse(@array_data))
  end
 
  def test_hash_parse
    assert_equal(HASH_RESULT, @class.parse(@hash_data))
  end
 
  def test_other_approach
    assert_equal(HASH_RESULT, DataConverter.new(@hash_data).convert)
  end  
end