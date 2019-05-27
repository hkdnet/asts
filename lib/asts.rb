require "asts/version"
require 'asts/config'

module Asts
  class Error < StandardError
  end

  class Detector
    def initialize(config)
      @config = config
    end

    def target?(_filename)
      true
    end
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
      Dir.glob("#{config.dir}/**/*.rb").each_with_object({}) do |f, h|
        if detector.target?(f)
          h[f] = RubyVM::AbstractSyntaxTree.parse_file(f)
        end
      end
    end
  end
end
