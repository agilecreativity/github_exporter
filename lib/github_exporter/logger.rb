require "logger"
module GithubExporter
  class << self
    attr_writer :logger
    # @return [Logger] the logger for the project
    def logger
      @logger ||= Logger.new STDOUT
    end
  end
end
