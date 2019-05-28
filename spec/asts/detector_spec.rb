RSpec.describe Asts::Detector do
  describe 'spec/examples' do
    let(:detector) { Asts::Detector.new(config) }
    let(:config) { Asts::Config.new }
    let(:base_dir) { File.expand_path('../example', __dir__) }

    before do
      config.dir = base_dir
      config.exclude << ->(file_info) {
        file_info.relative_path.start_with?('vendor')
      }
    end

    it do
      expect(detector.target_files.map(&:relative_path)).to contain_exactly('main.rb', 'lib/foo.rb')
    end
  end
end
