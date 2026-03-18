class BskyCli < Formula
  desc "A command-line client for Bluesky"
  homepage "https://github.com/harveyrandall/bsky-cli"
  version "1.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/harveyrandall/bsky-cli/releases/download/v#{version}/bsky-macos-arm64.tar.gz"
      sha256 "06bc94e9d5a73a29e11a5799d4c403748253c145d179c865a5ece19ee0e15a49"
    else
      url "https://github.com/harveyrandall/bsky-cli/releases/download/v#{version}/bsky-macos-x64.tar.gz"
      sha256 "1adac3c35b03d59f24292e7efecb31f0c2d46c5f489f64d41aab8483f37ac448"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/harveyrandall/bsky-cli/releases/download/v#{version}/bsky-linux-arm64.tar.gz"
      sha256 "be14ba95c76e62066bcce354e7bb8603232e66a3b01b78bd8da89740b50edf26"
    else
      url "https://github.com/harveyrandall/bsky-cli/releases/download/v#{version}/bsky-linux-x64.tar.gz"
      sha256 "0267d8bc64881b7c7adc46b99eaf1bc9cd53490fc7e7dbc18cc6faf82146849f"
    end
  end

  def install
    bin.install "bsky"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bsky --version")
  end
end
