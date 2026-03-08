class BskyCli < Formula
  desc "A command-line client for Bluesky"
  homepage "https://github.com/harveyrandall/bsky-cli"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/harveyrandall/bsky-cli/releases/download/v#{version}/bsky-macos-arm64.tar.gz"
      sha256 "5ba87ef265132658692ece58a1abbf1c44a92889db0160ac9420f9b4ea0036b7"
    else
      url "https://github.com/harveyrandall/bsky-cli/releases/download/v#{version}/bsky-macos-x64.tar.gz"
      sha256 "6c53b512dc0042a2e5927d46ea472b511899f0257e9d9532b1796a2a7af67d6b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/harveyrandall/bsky-cli/releases/download/v#{version}/bsky-linux-arm64.tar.gz"
      sha256 "d633d2838bfaa40a020842ac98822392fc0305fabf13775a5d8fe09d07943ff8"
    else
      url "https://github.com/harveyrandall/bsky-cli/releases/download/v#{version}/bsky-linux-x64.tar.gz"
      sha256 "a8be6e12d9962d8d49f3235fd0403d1d99c2e534c5f1a24b1931ce19882b4cc7"
    end
  end

  def install
    bin.install "bsky"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bsky --version")
  end
end
