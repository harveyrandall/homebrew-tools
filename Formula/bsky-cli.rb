class BskyCli < Formula
  desc "A command-line client for Bluesky"
  homepage "https://github.com/harveyrandall/bsky-cli"
  version "1.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/harveyrandall/bsky-cli/releases/download/v#{version}/bsky-macos-arm64.tar.gz"
      sha256 "69f2650b785bfaecaa3254e0d57ecc0739a456e34600b5e88b47b73afd1fad4e"
    else
      url "https://github.com/harveyrandall/bsky-cli/releases/download/v#{version}/bsky-macos-x64.tar.gz"
      sha256 "b0323b84c2372a5dd5ed60e9f0625ea96668ae01300f65b41127a7bc101a6230"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/harveyrandall/bsky-cli/releases/download/v#{version}/bsky-linux-arm64.tar.gz"
      sha256 "f43eae66d8b9a567506fa4006587fae0e2e8db4c3e68adf067c3a8f3f052c2a9"
    else
      url "https://github.com/harveyrandall/bsky-cli/releases/download/v#{version}/bsky-linux-x64.tar.gz"
      sha256 "cb53365fe3adc95c9b0567191b8fa8dba674b2e6dda100c5fc5cb0a5bec054e6"
    end
  end

  def install
    bin.install "bsky"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bsky --version")
  end
end
