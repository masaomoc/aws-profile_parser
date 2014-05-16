require "aws/profile_parser/version"

module AWS
  class ProfileParser

    def initialize
      @file = ENV['AWS_CONFIG_FILE'] || ENV['HOME'] + "/.aws/config"
      @credentials = nil
    end

    # returns hash of AWS credential
    def get(profile='default')
      raise 'Config File does not exist' unless File.exists?(@file)

      @credentials = parse if @credentials.nil?
      raise 'The profile is not specified in the config file' unless @credentials.has_key?(profile)

      @credentials[profile]
    end

    def parse
      section = {}
      current = {}
      s = StringScanner.new(File.read(@file))

      while !s.eos?
        case
        when s.scan(/\s+/)
        when s.scan(/^#.*/)
          # do nothing
        when s.scan(/\[(profile\s+)?(.+?)\]/)
          # strip 'profile' from each profile key and set to section key
          section[s[2]] = current = {}
        when s.scan(/(\w+)\s*=\s*([^\n]+)/)
          # strip 'aws_' from each key
          current[s[1].sub(/^aws_/, '').to_sym] = s[2]
        else
          raise "Parse Error. I guess config file syntax is something wrong."
        end
      end

      @credentials = section
    end
  end
end
