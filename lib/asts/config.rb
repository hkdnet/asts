module Asts
  class Config
    attr_accessor :dir, :exts

    def initialize
      @exts = ['.rb']
    end
  end
end
