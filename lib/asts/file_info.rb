module Asts
  FileInfo = Struct.new(:absolute_path, :relative_path, :ast, keyword_init: true)
end
