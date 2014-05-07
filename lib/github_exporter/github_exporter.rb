module GithubExporter
  CustomError = Class.new(StandardError)
  # creat the main logic if applicable
  class << self
    # main helper method
    def helper
      puts 'FYI: GithubExporter::helper()'
    end
  end
end
