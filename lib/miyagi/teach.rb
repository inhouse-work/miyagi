# frozen_string_literal: true

module Miyagi
  class Teach
    def self.call(...) = new(...).call

    def initialize
      @memory = Miyagi::Memory.new
    end

    def call
      Pathname.glob("content/**/*.md").shuffle.each do |path|
        timestamp = @memory.read(path.to_s)

        if review?(timestamp)
          @memory.write(path.to_s)
          return TTY::Markdown.parse_file(path, width: 80)
        end
      end

      nil
    end

    private

    def review?(timestamp)
      return true if timestamp.nil?

      # Check if the content is older than 1 days
      Time.parse(timestamp.timestamp) < (Time.now - (1 * 24 * 60 * 60))
    rescue ArgumentError
      # If the timestamp is invalid, we consider it for review
      true
    end
  end
end
