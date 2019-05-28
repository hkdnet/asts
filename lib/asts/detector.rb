module Asts
  class Detector
    FileInfo = Struct.new(:absolute_path, :relative_path, :ast, keyword_init: true)

    def initialize(config)
      @config = config
    end

    # @return [Array<Asts::Detector::FileInfo>]
    def target_files
      file_infos = Dir.glob("#{@config.dir}/**/*").map do |e|
        relative_path = Pathname.new(e).relative_path_from(@config.dir).to_s
        FileInfo.new(
          absolute_path: e,
          relative_path: relative_path,
        )
      end
      file_infos.select { |file_info| target?(file_info) }
    end

    private

    def target?(file_info)
      file?(file_info) && !exclude?(file_info) && extname?(file_info)
    end

    def file?(file_info)
      File.file?(file_info.absolute_path)
    end

    def exclude?(file_info)
      @config.exclude.any? { |filter| filter === file_info }
    end

    def extname?(file_info)
      ext = File.extname(file_info.relative_path)
      @config.exts.any? { |e| ext === e }
    end
  end
end
