require "asts/version"
require 'asts/config'

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
      Dir.glob("#{config.dir}/**/*.rb").each_with_object({}) do |f, h|
        h[f] = RubyVM::AbstractSyntaxTree.parse_file(f)
      end
    end
  end
end
