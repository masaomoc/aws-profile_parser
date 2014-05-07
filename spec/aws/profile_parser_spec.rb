require 'spec_helper'

describe AWS::ProfileParser do

  it 'has a version number' do
    expect(AWS::ProfileParser::VERSION).not_to be nil
  end

end

describe "ProfileParser" do

  before :all do
    ENV['AWS_CONFIG_FILE'] = File.dirname(__FILE__) + "/../data/awsconfig.sample"
    @parser = AWS::ProfileParser.new
  end

  it 'should have the default config file' do
    expect(File.exists?(ENV['AWS_CONFIG_FILE'])).to be_true
  end

  it 'should return Hash' do
    expect(@parser.get('default')).to be_a(Hash)
  end

  it 'should have keys' do
    option = @parser.get('default')
    expect(option).to have_key(:access_key_id)
    expect(option).to have_key(:secret_access_key)
    expect(option).to have_key(:region)
  end

end
