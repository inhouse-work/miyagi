# frozen_string_literal: true

module Miyagi
  class Memory
    Timestamp = Data.define(:timestamp, :content_path)

    def initialize(
      path = Miyagi.config.memory_path,
      files: Miyagi.config.file_system
    )
      @files = files
      @path = path
    end

    def reset
      @files.write(@path, "")
    end

    def write(content_path, timestamp = Time.now)
      @files.append(@path, "#{timestamp.iso8601} #{content_path}\n")
    end

    def read(content_path)
      return nil unless @files.exist?(@path)

      timestamps.find do |timestamp|
        timestamp.content_path == content_path
      end
    end

    private

    def timestamps
      lines.filter_map do |line|
        timestamp, content_path = line.strip.split
        next unless timestamp && content_path

        Timestamp.new(timestamp:, content_path:)
      end
    end

    def lines
      @files.read(@path).split("\n")
    end
  end
end
