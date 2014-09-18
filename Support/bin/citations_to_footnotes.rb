#!/usr/bin/env ruby

figure_encountered = false
last_caption = ''
footnotes = {}

STDIN.each_line do |line|
  # Note that the dashes in this regex are NOT hyphens, they are en dashes!
  # Replace superscripted numbers with dashes and commas (which should be citations, as footnotes)
  # with superscripted dashes and commas and the numbers as footnotes,
  line.gsub!(/\[!!(\d+(–\d+)?(,\d+(–\d+)?)*)!!\]/) do |s| 
    # except when the footnote was already used, in which case escape the footnote.
    # none of pandoc, kramdown and multimarkdown recognize repeated footnotes.
    # this is fixed later when converting to HTML (for Jekyll) with the KramdownExtended plugin
    $1.gsub(/\D+/, '^\0^').gsub(/\d+/) { |t| "[#{footnotes[t] = footnotes[t] ? '\\' : ''}^#{t}]" }
  end
  line.sub!(/^\[@@(\d+)@@\]:\s+/, '[^\1]: ')
  
  # Bonus feature: ensure figures are captioned and classed correctly
  if figure_encountered && line == "\n"
    line = "#{last_caption}\n{: .figure}\n\n"
  else
    figure_encountered = line =~ /^!\[([^\]]+)\]\([^)]+\)\s*$/
    last_caption = $1
  end
  puts line
end