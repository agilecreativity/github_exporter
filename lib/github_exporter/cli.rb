require 'thor'
module GithubExporter
  class CLI < Thor
    desc 'execute', 'Execute the main program'
    method_option 'version',
                  aliases: '-v',
                  desc: 'Display version number'
    def execute
      opts = options.symbolize_keys
      if opts[:version]
        puts "You are using GithubExporter version #{GithubExporter::VERSION}"
        exit
      end
      # TODO: use the opts in your
      puts "Your options #{opts}"
      process(opts)
    end

    desc 'usage', 'Display help screen'
    def usage
      puts <<-EOS
TODO: add you simple usage here!
      EOS
    end

    default_task :usage

    private

    def process(opts = {})
      puts "FYI: your options #{opts}"
    end
  end
end