## github_exporter

DEPRECATED: please use [source2pdf][] or [source2epub][] for maximum awesome!!!

Export/print content of a given github repository (or local project directory) to single pdf for quick review offline.

## Requirements

- Valid installation of [Ghostscript][] required by [pdfs2pdf][] gem
- Valid installation of [Wkhtmltopdf][] required by [html2pdf][] gem
- Valid installation of [Vim][] required by [vim_printer][] gem

## Installation

```
gem install github_exporter
```

## Synopsis/Usage

```shell

Usage:

  $github_exporter -e, --exts=EXT1 EXT2 EXT3 -u, --url=URL -theme=theme_name --output-name=output_file.pdf

Example:

  # Export the *.rb from the given repository

  $github_exporter -e rb -u https://github.com/agilecreativity/github_exporter.git

  # Export the *.rb and also 'Gemfile' from a 'github_exporter' directory
  # Note: this directory must be directly below the current directory

  $github_exporter -e rb -f Gemfile -u github_exporter

  # Same as previous command with the 'solarized' instead of 'default' colorscheme
  $github_exporter -e rb -f Gemfile -u filename_cleaner -t solarized

Options:

  -u, --url=URL                   # The full url of the github project to be cloned OR local directory name

  -e, --exts=EXT1 EXT2 EXT3 ..    # The list of extension names to be exported
                                  # e.g. -e md rb java

  -f, [--non-exts=one two three]  # The list of file without extension to be exported
                                  # e.g. -f Gemfile LICENSE

  -t, [--theme=theme_name]        # The theme/colorscheme to be used with vim_printer see :help :colorscheme from inside Vim
                                  # default: 'default'
                                  # e.g. -t solarized

  -o, [--output-name=output.pdf]  # The output pdf filename (will default to 'repository_name'.pdf)
                                  # e.g. -o repository_name.pdf

Export a given Github project or a local project directory to a single pdf file

```

### Sample Usage:

```shell
github_exporter -u https://github.com/agilecreativity/github_exporter.git -e rb
```

Should result in something similar to this in the console

```
git clone https://github.com/agilecreativity/github_exporter.git ./github_exporter
FYI: list of extensions: ["gemspec", "md", "pdf", "png", "rb"]
FYI: list of all files : ["./lib/github_exporter.rb", "./lib/github_exporter/cli.rb", "./lib/github_exporter/exporter.rb", "./lib/github_exporter/github_exporter.rb", "./lib/github_exporter/logger.rb", "./lib/github_exporter/version.rb", "./test/lib/github_exporter/test_github_exporter.rb", "./test/test_helper.rb"]
Your input options for VimPrinter : ["print", "--base-dir", "./github_exporter", "--exts", ["rb"], "--theme", "default", "--recursive"]
FYI: process file 1 of 8 : ./lib/github_exporter.rb
FYI: process file 2 of 8 : ./lib/github_exporter/cli.rb
FYI: process file 3 of 8 : ./lib/github_exporter/exporter.rb
FYI: process file 4 of 8 : ./lib/github_exporter/github_exporter.rb
FYI: process file 5 of 8 : ./lib/github_exporter/logger.rb
FYI: process file 6 of 8 : ./lib/github_exporter/version.rb
FYI: process file 7 of 8 : ./test/lib/github_exporter/test_github_exporter.rb
FYI: process file 8 of 8 : ./test/test_helper.rb
Your output file is './github_exporter/vim_printer_github_exporter.tar.gz'
Convert file 1 of 9 : ./index.html
Convert file 2 of 9 : ./lib/github_exporter.rb.xhtml
Convert file 3 of 9 : ./lib/github_exporter/cli.rb.xhtml
Convert file 4 of 9 : ./lib/github_exporter/exporter.rb.xhtml
Convert file 5 of 9 : ./lib/github_exporter/github_exporter.rb.xhtml
Convert file 6 of 9 : ./lib/github_exporter/logger.rb.xhtml
Convert file 7 of 9 : ./lib/github_exporter/version.rb.xhtml
Convert file 8 of 9 : ./test/lib/github_exporter/test_github_exporter.rb.xhtml
Convert file 9 of 9 : ./test/test_helper.rb.xhtml
Convert files to pdfs took 2.324978936 ms
Your final output is './github_exporter_tmp/github_exporter/html2pdf_github_exporter.tar.gz'
Create pdfmarks took 0.027517634 ms
Combine pdf files took 0.763918867 ms
Your combined pdf is available at ./github_exporter_tmp/github_exporter/pdfs2pdf_github_exporter.pdf
Your final output is ./github_exporter.pdf
```

### Sample Output

#### Using the 'default' theme/colorscheme for Vim

```shell
github_exporter -u https://github.com/agilecreativity/github_exporter.git --exts rb
```

Which generated the following [pdf output file](https://github.com/agilecreativity/github_exporter/raw/master/samples/github_exporter_default_colorscheme.pdf)

The example screenshot:

![](https://github.com/agilecreativity/github_exporter/raw/master/samples/github_exporter_default_colorscheme.png)

#### Use non-default colorscheme/theme for Vim

Use [seoul256][] colorscheme

```shell
github_exporter -u https://github.com/agilecreativity/github_exporter.git --exts rb --theme seoul256
```

Which generated the following [pdf output file](https://github.com/agilecreativity/github_exporter/raw/master/samples/github_exporter_seoul256_colorscheme.pdf)

The example screenshot:

![](https://github.com/agilecreativity/github_exporter/raw/master/samples/github_exporter_seoul256_colorscheme.png)

### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[thor]: https://github.com/erikhuda/thor
[minitest]: https://github.com/seattlerb/minitest
[yard]: https://github.com/lsegal/yard
[pry]: https://github.com/pry/pry
[rubocop]: https://github.com/bbatsov/rubocop
[grit]: https://github.com/mojombo/grit
[Ghostscript]: http://ghostscript.com/doc/current/Install.htm
[Wkhtmltopdf]: https://github.com/pdfkit/pdfkit/wiki/Installing-WKHTMLTOPDF
[Vim]: http://www.vim.org
[vim_printer]: https://github.com/agilecreativity/vim_printer
[pdfs2pdf]: https://github.com/agilecreativity/pdfs2pdf
[html2pdf]: https://github.com/agilecreativity/html2pdf
[monokai]: https://github.com/lsdr/monokai
[seoul256]: https://github.com/junegunn/seoul256.vim
[source2epub]: https://github.com/agilecreativity/source2epub
[source2pdf]: https://github.com/agilecreativity/source2pdf
