require "thor"
require "vim_printer"
require "html2pdf"
require "pdfs2pdf"
require_relative "github_exporter"
module GithubExporter
  class CLI < Thor
    desc "export", "Export a given URL or project to a single pdf file"
    method_option "url",
                  aliases:  "-u",
                  desc:     "The full url of the github project to be cloned",
                  required: true
    method_option "exts",
                  type:     :array,
                  aliases:  "-e",
                  desc:     "The list of file extension to be exported",
                  required: true
    method_option "non_exts",
                  type:     :array,
                  aliases:  "-f",
                  desc:     "The list of file without extension to be exported",
                  default: []
    method_option "theme",
                  type:     :string,
                  aliases:  "-t",
                  desc:     "The theme to be used with vim_printer",
                  default:  "default"
    def export
      exporter = GithubExporter::Exporter.new options[:url],
                                              exts:     options[:exts],
                                              non_exts: options[:non_exts],
                                              theme:    options[:theme]
      exporter.export
    end

    desc "usage", "Display help screen"
    def usage
      puts <<-EOS
Usage:

  $github_exporter -e, --exts=EXT1 EXT2 EXT3 -u, --url=URL -theme=theme_name

Example:

  # Export the *.rb from the given repository

  $github_exporter -e rb -u https://github.com/agilecreativity/filename_cleaner.git

  # Export the *.rb and also 'Gemfile' from a given directory 'filename_cleaner'
  # Note: must be one directory directly relative to current directory

  $github_exporter -e rb -f Gemfile -u filename_cleaner

  # Export the *.rb and also 'Gemfile' from a given directory 'filename_cleaner'
  # using 'solarized' theme
  # Note: must be one directory directly relative to current directory

  $github_exporter -e rb -f Gemfile -u filename_cleaner -t solarized

Options:

  -u, --url=URL                   # The full url of the github project to be cloned

  -e, --exts=EXT1 EXT2 EXT3 ..    # The list of extension names to be exported
                                  # e.g. -e md rb java

  -f, [--non-exts=one two three]  # The list of file without extension to be exported
                                  # e.g. -f Gemfile LICENSE

  -t, [--theme=theme_name]        # The theme to be used with vim_printer see :h :colorscheme from Vim
                                  # default: 'default'
                                  # e.g. -t solarized

Export a given URL or project to a single pdf file

      EOS
    end

    default_task :usage
  end
end
