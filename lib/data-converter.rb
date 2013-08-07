class DataConverter
  attr_reader :data

  ESCAPE_VALUES = {
    "&" => "&amp;",
    "<" => "&lt;",
    ">" => "&gt;",
    '"' => "&quot;"
  }

  ESCAPE_REGEXP = Regexp.union(*ESCAPE_VALUES.keys)

  def initialize(data)
    @data = data
  end

  def self.parse(data)
    constructor = self.new(data)
    constructor.convert
  end
  
  def convert(data = nil)
    data = @data unless data

    case data
    when Array
      tag(:ul, convert_to_li(data), :escaped => true)
    when Hash
      tag(:dl, convert_to_dl_childs(data), :escaped => true)
    else
      data
    end
  end

  private

  def check_data?(data)
    data.is_a?(Array) or data.is_a?(Hash)
  end
  
  def convert_to_li(data)
    data.map do |caption|
      if check_data?(caption)
        tag(:li, convert(caption), :escaped => true)
      else
        tag(:li, caption)
      end
    end.join("\n")
  end

  def convert_to_dl_childs(data)
    childs = []
    data.each_pair do | key, value |
      childs << tag(:dt, key)
      if check_data?(value)
        childs << tag(:dd, convert(value), :escaped => true)
      else
        childs << tag(:dd, value)
      end
    end
    childs.join("\n")
  end

  def tag(name, caption, options = {})
    caption = caption.to_s
    "<#{name}>#{options[:escaped] ? caption : escape_html(caption)}</#{name}>"
  end

  def escape_html(str)
    str.to_s.gsub(ESCAPE_REGEXP) { |char| ESCAPE_VALUES[char] }
  end
end
