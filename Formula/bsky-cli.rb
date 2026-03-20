class BskyCli < Formula
  desc "A command-line client for Bluesky"
  homepage "https://github.com/harveyrandall/bsky-cli"
  version "1.6.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/harveyrandall/bsky-cli/releases/download/v#{version}/bsky-macos-arm64.tar.gz"
      sha256 "7c9effa2fe3231d40d0fb853b76cb2400d1b2789a94f4eb0e0aea6465b040a44"
    else
      url "https://github.com/harveyrandall/bsky-cli/releases/download/v#{version}/bsky-macos-x64.tar.gz"
      sha256 "d263d48328e8d3cd00ace09944b4f5285a85c4aef7f7d30d46872f416fabeab7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/harveyrandall/bsky-cli/releases/download/v#{version}/bsky-linux-arm64.tar.gz"
      sha256 "0203aed41eeb499f6bc92466a88acca0cde63b68bbf2fb1ba2c079cf4a2cd4ec"
    else
      url "https://github.com/harveyrandall/bsky-cli/releases/download/v#{version}/bsky-linux-x64.tar.gz"
      sha256 "df630c9063f7fc1618fb6b8ddf401359ca39864d45d40bd3bacb5e8b0a28e54a"
    end
  end

  def install
    bin.install "bsky"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bsky --version")
  end
end
