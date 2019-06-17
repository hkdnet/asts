module Asts
  FileInfo = Struct.new(:absolute_path, :relative_path, :asts, keyword_init: true)
end
