class BskyCli < Formula
  desc "A command-line client for Bluesky"
  homepage "https://github.com/harveyrandall/bsky-cli"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/harveyrandall/bsky-cli/releases/download/v#{version}/bsky-macos-arm64.tar.gz"
      sha256 "7b92a4ef0e074cafa7216dbe5aa39edb4bf08316f1507d3368327e10779a4b5b"
    else
      url "https://github.com/harveyrandall/bsky-cli/releases/download/v#{version}/bsky-macos-x64.tar.gz"
      sha256 "81ff0313ef644a4c9a532bb520694731fe0e90237afbc59efa3eba1e977058ce"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/harveyrandall/bsky-cli/releases/download/v#{version}/bsky-linux-arm64.tar.gz"
      sha256 "7d4c1e24742aa77a5b28d02f60a0ebf07dc784bb53d3585a9d4f0def663641e2"
    else
      url "https://github.com/harveyrandall/bsky-cli/releases/download/v#{version}/bsky-linux-x64.tar.gz"
      sha256 "e0c5253f6ca0d7aaee4343adf045327ec9a67442dfb8547ec3548557a0b4f506"
    end
  end

  def install
    bin.install "bsky"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bsky --version")
  end
end
