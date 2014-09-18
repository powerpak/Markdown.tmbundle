# Markdown.tmbundle

My Markdown settings for use with TextMate 2 on Mac OS X.

## What's different?

Note this is a delta bundle, based off of [the original](https://github.com/textmate/markdown.tmbundle). Why not release a whole bundle?  I'd rather just add my commands and changes to the most current Markdown bundle. Once this breaks miserably, I'll fork.

I prefer [Pandoc](http://johnmacfarlane.net/pandoc/) as my Markdown engine and the bundle contains commands for specifically using Pandoc's features.  However, Pandoc has some features like [title blocks](http://johnmacfarlane.net/pandoc/README.html#extension-pandoc_title_block) that clash with Jekyll's way of doing things, so this bundle also contains some code for automagically converting between the two.  For example, you can pipe a Markdown file meant for Jekyll through Pandoc, automatically converting the YAML front matter into a Pandoc title block.

## Requirements

This bundle will not work unless you also use my [pandoc-dotfiles](https://github.com/powerpak/pandoc-dotfiles) templates, or provide similar templates on your own.

You will also need pcregrep.  You can `brew install pcre` or `sudo port install pcre`.

## Usage

1. Close TextMate 2.
2. Checkout into `~/Library/Application Support/Avian/Bundles`.
3. Double click on the Markdown.tmbundle that was made to open it in Textmate 2.
4. Textmate will complain that the bundle is in delta format.  No matter; it will still work.  You can verify this by going to Bundles > Edit Bundles... and checking that the Markdown bundle has `Convert To LaTeX (pandoc)` and other various Menu Actions.