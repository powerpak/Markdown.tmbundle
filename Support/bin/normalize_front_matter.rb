#!/usr/bin/env ruby
require ENV["TM_BUNDLE_SUPPORT"] + '/lib/normalized_markdown'

md = NormalizedMarkdown.new(STDIN.read)

if ARGV.length > 0
  # We will base header block data and format off of the first argument, if provided
  open(ARGV[0]) do |f|
    template = NormalizedMarkdown.new(f.read)
    md.data = template.data
    puts md.output(template.input_format)
  end
else
  puts md.output(:pandoc)
end
