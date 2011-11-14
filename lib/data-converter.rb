class String
  def escapeHTML
    self.gsub(/&/n, '&amp;').gsub(/\"/n, '&quot;').gsub(/>/n, '&gt;').gsub(/</n, '&lt;').gsub(/'/, '&#039;')
  end
end

class DataConverter
  attr_reader :data

  ARRAY = "Array"
  HASH = "Hash"

  def initialize(data)
    @data = data
  end

  def self.parse(data)
    constructor = self.new(data)
    constructor.convert(constructor.data)
  end
  
  def convert(data = @data)
    case data.class.to_s
    when ARRAY
      list = <<-UL
<ul>
#{ convert_to_li(data).join("\n") }
</ul>
      UL
    when HASH
      list = <<-DL
<dl>
#{ convert_to_dl_childs(data) }</dl>
      DL
    else
      return data
    end
    list
  end

  private

  def check_data?(data)
    data.is_a?(Array) or data.is_a?(Hash)
  end
  
  def convert_to_li(data)
    data.map! do | e |
      if check_data?(e)
        "<li>#{ convert(e) }</li>"
      else
        "<li>#{ e.to_s.escapeHTML }</li>"
      end
    end
  end

  def convert_to_dl_childs(data)
    childs = ""
    data.each_pair do | key, value |
      childs += "<dt>#{ key.to_s.escapeHTML }</dt>\n"
      if check_data?(value)
        childs += "<dd>#{ convert(value) }</dd>\n"
      else
        childs += "<dd>#{ value.to_s.escapeHTML }</dd>\n"
      end
    end
    childs
  end
end
