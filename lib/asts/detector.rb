module Asts
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
end
