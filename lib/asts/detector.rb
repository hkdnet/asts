module Asts
  class Detector
    FileInfo = Struct.new(:absolute_path, :relative_path, :ast, keyword_init: true)
    def initialize(config)
      @config = config
    end

    # @return [Array<Asts::Detector::FileInfo>]
    def target_files
      relative_paths = Dir.glob("#{@config.dir}/**/*").map do |e|
        relative_path = Pathname.new(e).relative_path_from(@config.dir).to_s
        FileInfo.new(
          absolute_path: e,
          relative_path: relative_path,
        )
      end
      relative_paths.select do |file_info|
        File.file?(file_info.absolute_path) &&
          !exclude?(file_info) && target?(file_info)
      end
    end

    private

    def exclude?(file_info)
      @config.exclude.any? { |filter| filter === file_info }
    end

    def target?(file_info)
      ext = File.extname(file_info.relative_path)
      @config.exts.any? { |e| ext === e }
    end
  end
end
