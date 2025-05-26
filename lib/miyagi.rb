# frozen_string_literal: true

require "time"

require "dry-files"
require "dry-configurable"
require "tty-markdown"

require_relative "miyagi/version"

module Miyagi
  extend Dry::Configurable

  class Error < StandardError; end

  autoload :Memory, "miyagi/memory"
  autoload :Teach, "miyagi/teach"

  setting :memory_path,
    default: Pathname.new(Dir.home).join(".miyagi", "memory.txt")
  setting :file_system, default: Dry::Files.new

  def self.reset_memory
    Memory.new.reset
  end

  def self.teach
    Teach.call
  end
end
