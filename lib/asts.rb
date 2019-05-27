require "asts/version"
require 'asts/config'
require 'asts/detector'

module Asts
  class Error < StandardError
  end

  class << self
    def config
      @config ||= Asts::Config.new
    end

    def configure
      yield config
    end

    def extract
      detector = Detector.new(config)
      detector.all_files.each_with_object({}) do |f, h|
        if detector.target?(f)
          h[f] = RubyVM::AbstractSyntaxTree.parse_file(f)
        end
      end
    end
  end
end
