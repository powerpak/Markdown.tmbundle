# Markdown.tmbundle

These are my Markdown bundle customizations for use with TextMate 2 on Mac OS X.

## What's different?

Note this is a delta bundle, based off of [the original](https://github.com/textmate/markdown.tmbundle). Why not release a whole bundle?  I'd rather just add my commands and changes to the most current Markdown bundle. Once this breaks miserably, I'll fork.

I prefer [Pandoc][pandoc] as my Markdown engine and the bundle contains commands for specifically using Pandoc's features.  However, Pandoc has some features like [title blocks](http://johnmacfarlane.net/pandoc/README.html#extension-pandoc_title_block) that clash with Jekyll's way of doing things, so this bundle also contains some code for automagically converting between the two.  For example, you can pipe a Markdown file meant for Jekyll through Pandoc, automatically converting the YAML front matter into a Pandoc title block.

If you get all this set up, you should be able to write a Markdown document and then:

- hit ^⌥⌘P to view (or print) a fairly good looking HTML version
- hit ^⌥⌘C to create a fairly good looking LaTeX version
- hit ^⌥⌘L to convert to LaTeX, if you want to customize it a bit more before typesetting

[pandoc]: http://johnmacfarlane.net/pandoc/

## Requirements

You will need pandoc, so `brew install pandoc pandoc-citeproc` or visit its [website][pandoc] first.

This bundle will not work unless you also use my [pandoc-dotfiles](https://github.com/powerpak/pandoc-dotfiles) templates, or provide similar templates on your own.

You will also need [pcregrep](http://unixhelp.ed.ac.uk/CGI/man-cgi?pcregrep).  You can `brew install pcre` or `sudo port install pcre`.

If you want to convert to PDF (which goes through LaTeX), you will need [MacTeX](https://tug.org/mactex/).

Finally, you'll need to configure at least two variables within Textmate.  Go to TextMate > Preferences... and head to the Variables tab.

- Make sure `PATH` is checked and includes all of the binaries mentioned above.
- Set `TM_PANDOC_BIB` to the full path of your BibLaTeX file.  If you don't have one, just point it to an empty file, but it must be set.

## Usage

1. Close TextMate 2.
2. Checkout into `~/Library/Application Support/Avian/Bundles`.
3. Double click on the Markdown.tmbundle that was made to open it in Textmate 2.
4. Textmate will complain that the bundle is in delta format.  No matter; it will still work.  You can verify this by going to Bundles > Edit Bundles... and checking that the Markdown bundle has `Convert To LaTeX (pandoc)` and other various new Menu Actions.