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
      detector.target_files.each_with_object({}) do |f, h|
        f.ast = RubyVM::AbstractSyntaxTree.parse_file(f.absolute_path)
        h[f.relative_path] = f
      end
    end
  end
end
