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
      Dir.glob("#{@config.dir}/**/*").select do |e|
        relative_path = Pathname.new(e).relative_path_from(@config.dir)
        @config.exclude.none? { |e| e.match?(relative_path) }
      end
    end
  end
end
