require 'yaml'
require 'date'

# Normalizes between the Pandoc and Jekyll conventions for Markdown files and their metadata.
# Pandoc likes title blocks with percent signs, and can't handle liquid tags.
# Jekyll likes YAML "front matter" but *will* process liquid tags.
class NormalizedMarkdown
  
  attr_accessor :data
  attr_reader :input_format
  attr_accessor :content
  
  def initialize(content)
    @data_separator = "--- \n"
    @data = {}
    @content = content
    extract_front_matter
  end
  
  def output(format=nil)
    format ||= @input_format || :pandoc
    if format == :pandoc
      strip_liquid_tags
      pandoc_title_block + @content
    else #format == :jekyll
      @data.to_yaml + @data_separator + @content
    end
  end
  
  def template_vars
    if @data.key? "pandoc"
      @data["pandoc"] unless @data["pandoc"].is_a? Hash
      @data["pandoc"].map{|k, v| "-V#{k}=#{v === false ? '' : v}".gsub(/\s/, '_') }.join(" ")
    else
      ""
    end
  end
  
  private
  
  def extract_front_matter
    if @content =~ /\A(---\s*\n.*?\n?)^(---\s*$\n?)/m
      # We have a markdown document with Jekyll front matter
      @input_format = :jekyll
      @data = YAML.load($1)
      @data_separator = $2
      @content = $'
    elsif @content =~ /\A%[ \t]*([^\n]*(\n[ \t]+[^\n]*)*)(\n%[ \t]*([^\n]*(\n[ \t]+[^\n]*)*))?(\n%[ \t]*([^\n]*(\n[ \t]+[^\n]*)*))?/m
      # We have a markdown document with a Pandoc title block
      @input_format = :pandoc
      match_data = $~
      @content = match_data.post_match
      @data = {"title" => match_data[1].gsub(/\n\s+/, ' ')}
      match_data[4] && @data["author"] = match_data[4].gsub(/\n\s+/, ' ')
      match_data[7] && @data["date"] = match_data[7].gsub(/\n\s+/, ' ')
    end
  end
  
  def pandoc_title_block
    # Convert front matter data to Pandoc title block
    # For more information: http://johnmacfarlane.net/pandoc/README.html#title-block
    date = @data['date'] ? "% #{@data['date']}\n" : ""
    "% #{@data['title']}\n% #{@data['author']}\n#{date}"
  end
  
  def strip_liquid_tags
    @content.gsub!(/\{%[^%]+%\}/, '')
  end
  
end