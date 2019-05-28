module Asts
  class Parser
    def initialize(config)
      @config = config
    end

    def parse(file_info)
      RubyVM::AbstractSyntaxTree.parse_file(file_info.absolute_path)
    end
  end
end
