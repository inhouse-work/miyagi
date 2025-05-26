# frozen_string_literal: true

require "tty-markdown"

require_relative "miyagi/version"

module Miyagi
  class Error < StandardError; end

  def self.teach
    file = Pathname.glob("content/**/*.md").sample
    TTY::Markdown.parse_file(file.to_s, width: 80)
  end
end
