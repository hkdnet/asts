require "asts/version"
require 'asts/config'

module Asts
  class Error < StandardError
  end

  class Detector
    def initialize(config)
      @config = config
    end

    def target?(filename)
      ext = File.extname(filename)
      @config.exts.any? { |e| ext === e }
    end

    def all_files
      Dir.glob("#{@config.dir}/**/*")
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
      detector.all_files.each_with_object({}) do |f, h|
        if detector.target?(f)
          h[f] = RubyVM::AbstractSyntaxTree.parse_file(f)
        end
      end
    end
  end
end
