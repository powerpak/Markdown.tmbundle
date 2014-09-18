#!/usr/bin/env ruby
require ENV["TM_BUNDLE_SUPPORT"] + '/lib/normalized_markdown'

puts NormalizedMarkdown.new(ARGF.read).template_vars
