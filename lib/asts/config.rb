module Asts
  class Config
    attr_accessor :dir, :exts, :exclude

    def initialize
      @exts = ['.rb']
      @exclude = []
    end
  end
end
