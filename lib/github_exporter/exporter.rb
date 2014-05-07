#!/usr/bin/env ruby
require "uri"
require "agile_utils"
require_relative "../github_exporter"
module GithubExporter
  # The temporary directory
  TMP_DIR = "github_exporter_tmp"

  class Exporter
    attr_reader :url,
                :exts,
                :non_exts,
                :theme
    attr_reader :base_dir,
                :repo_name,
                :output_path
    # Constructor for Executor
    #
    # @param [String] url the input URL like
    #        https://github.com/opal/opal.git or just the immediat folder name
    # @param [Hash<Symbol,Object>] opts the option hash
    #
    # @option opts [Array<String>] :exts the list of file extension to be used
    # @option opts [Array<String>] :non_exts the list of file without extension to be used
    # @option opts [String]        :theme the theme to use for `vim_printer`
    def initialize(url, opts = {})
      @url         = url
      @base_dir    = Dir.pwd
      @exts        = opts[:exts]     || []
      @non_exts    = opts[:non_exts] || []
      @theme       = opts[:theme]    || "default"
      @repo_name   = project_name(url)
      @output_path = File.expand_path([base_dir, repo_name].join(File::SEPARATOR))
    end

    # Print and export the source from a given URL to a pdf
    def export
      clone
      puts "FYI: list of extensions: #{all_extensions}"
      puts "FYI: list of all files : #{all_files}"
      files2htmls
      htmls2pdfs
      pdfs2pdf
      cleanup
    end

    def to_s
      <<-EOT
      url         : #{url}
      base_dir    : #{base_dir}
      exts        : #{exts}
      non_exts    : #{non_exts}
      repo_name   : #{repo_name}
      theme       : #{theme}
      output_path : #{output_path}
     EOT
    end

  private

    def clone
      if File.exist?(output_path)
        puts "The project #{output_path} already exist, no git clone needed!"
        return
      end
      GithubExporter.clone_repository(url, repo_name, base_dir)
    end

    # List all extensions
    def all_extensions
      all_exts = GithubExporter.list_extensions(output_path)
      # Strip off the '.' in the output if any.
      all_exts.map! { |e| e.gsub(/^\./, "") }
      all_exts
    end

    # List all files base on simple criteria
    def all_files
      files = []
      if input_available?
        files = GithubExporter.list_files base_dir:  output_path,
                                          exts:      exts,
                                          non_exts:  non_exts,
                                          recursive: true

      end
      files
    end

    # Convert files to htmls
    def files2htmls
      if input_available?
        GithubExporter.files_to_htmls base_dir: output_path,
                                      exts:     exts,
                                      non_exts: non_exts,
                                      theme:    theme
      end
    end

    # Convert list of html to list of pdf files
    def htmls2pdfs
      input_file = File.expand_path("#{output_path}/vim_printer_#{repo_name}.tar.gz")
      if File.exist?(input_file)
        FileUtils.mkdir_p output_dir
        # input_file = File.expand_path("#{output_path}/vim_printer_#{repo_name}.tar.gz")
        AgileUtils::FileUtil.gunzip input_file, output_dir
        GithubExporter.htmls_to_pdfs(base_dir: output_dir)
      end
    end

    # Merge/join multiple pdf files into single pdf
    def pdfs2pdf
      input_file = File.expand_path("#{output_dir}/html2pdf_#{repo_name}.tar.gz")
      if File.exist?(input_file)
        AgileUtils::FileUtil.gunzip input_file, output_dir
        GithubExporter.pdfs_to_pdf base_dir: output_dir,
                                   recursive: true
      end
    end

    def cleanup
      generated_file = "#{output_dir}/pdfs2pdf_#{repo_name}.pdf"
      if File.exist?(generated_file)
        destination_file = File.expand_path(File.dirname(output_dir) + "../../#{repo_name}.pdf")
        FileUtils.mv generated_file, destination_file
        puts "Your final output is #{File.expand_path(destination_file)}"

        # Now cleanup the generated files
        FileUtils.rm_rf File.expand_path(File.dirname(output_dir) + "../../#{GithubExporter::TMP_DIR}")

        # Also remove the 'vim_printer_#{repo_name}.tar.gz' if we have one
        FileUtils.rm_rf File.expand_path(File.dirname(output_dir) + "../../#{repo_name}/vim_printer_#{repo_name}.tar.gz")
      end
    end

  private

    def output_dir
      File.expand_path("#{base_dir}/#{GithubExporter::TMP_DIR}/#{repo_name}")
    end

    def input_available?
      (exts && !exts.empty?) || (non_exts && !non_exts.empty?)
    end

    # Extract project name from a given URL
    #
    # @param [String] uri input uri
    #
    # example:
    #
    #  project_name('https://github.com/erikhuda/thor.git') #=> 'thor'
    #  project_name('https://github.com/erikhuda/thor')     #=> 'thor'
    def project_name(uri)
      if uri
        name = URI(uri).path.split(File::SEPARATOR).last
        # strip the '.' if any
        File.basename(name, ".*") if name
      end
    end
  end
end
