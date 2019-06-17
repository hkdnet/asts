module Asts
  class Parser
    def initialize(config)
      @config = config
    end

    # @return [Array<RubyVM::AbstractSyntaxTree::Node>]
    def parse(file_info)
      [
        RubyVM::AbstractSyntaxTree.parse_file(file_info.absolute_path)
      ]
    end
  end
end
