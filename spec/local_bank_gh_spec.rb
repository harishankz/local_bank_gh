require 'rails_helper'

describe LocalBankGh do
  it 'has a version number' do
    expect(LocalBankGh::VERSION).not_to be nil
  end

  describe ".root" do
    it "returns a Pathname" do
      expect(LocalBankGh.root).to be_a Pathname
    end

    it "returns the top-level directory" do
      expected_path = Pathname.new(File.dirname(__FILE__)).join("..")
      expect(LocalBankGh.root).to eq Pathname.new(expected_path)
    end
  end
end
