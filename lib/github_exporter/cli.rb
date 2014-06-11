require "thor"
require "vim_printer"
require "html2pdf"
require "pdfs2pdf"
require_relative "github_exporter"
module GithubExporter
  class CLI < Thor
    desc "export", "Export a given Github project or a local project to a single pdf file"
    method_option "url",
                  aliases:  "-u",
                  desc:     "The full url of the github project to be cloned or local project directory (mandatory)",
                  required: true
    method_option "exts",
                  type:     :array,
                  aliases:  "-e",
                  desc:     "The list of file extension to be exported (mandatory)",
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
    method_option "output_name",
                  type:     :string,
                  aliases:  "-o",
                  desc:     "The output filename (optional)"
    def export
      exporter = GithubExporter::Exporter.new options[:url],
                                              exts:        options[:exts],
                                              non_exts:    options[:non_exts],
                                              theme:       options[:theme],
                                              output_name: options[:output_name]

      exporter.export
    end

    desc "usage", "Display help screen"
    def usage
      puts <<-EOS
Usage:

  $github_exporter -u, --url=URL \
                   -e, --exts=EXT1 EXT2 EXT3 \
                   -t, --theme=theme_name \
                   -o, --output-name=output_file.pdf

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

      EOS
    end

    default_task :usage
  end
end
