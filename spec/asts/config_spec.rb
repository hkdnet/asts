RSpec.describe Asts::Config do
  it do
    Asts.configure do |config|
      config.dir = 'path/to/your/project'
    end

    config = Asts.config

    expect(config.dir).to eq 'path/to/your/project'
  end
end
