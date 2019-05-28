require "asts/version"
require 'asts/config'
require 'asts/detector'
require 'asts/parser'

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
      detector = Asts::Detector.new(config)
      parser = Asts::Parser.new(config)
      detector.target_files.each_with_object({}) do |f, h|
        f.ast = parser.parse(f)
        h[f.relative_path] = f
      end
    end
  end
end
