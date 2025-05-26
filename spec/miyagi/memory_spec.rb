# frozen_string_literal: true

RSpec.describe Miyagi::Memory do
  it "writes and reads memory" do
    subject.write("something")

    expect(subject.read("something")).to be_a Miyagi::Memory::Timestamp
  end
end
