class SecretsManager < Formula
  desc "A tool to manage secrets and configurations and working with aws secrets-manager, inspired by https://github.com/ThePrimeagen/projector"
  homepage "https://github.com/giallojoe/secrets-manager"
  version "0.1.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/giallojoe/secrets-manager.git/releases/download/0.1.1/secrets-manager-aarch64-apple-darwin.tar.xz"
      sha256 "2685e4b80f34db43e7fe1783bcd2f8c2f694370a23d703d597c4d66b12929168"
    end
    if Hardware::CPU.intel?
      url "https://github.com/giallojoe/secrets-manager.git/releases/download/0.1.1/secrets-manager-x86_64-apple-darwin.tar.xz"
      sha256 "4d9b97178399c706c01c05d2fc4061dcba74b0b18bd0ba2f3e5ef71caa1467e7"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/giallojoe/secrets-manager.git/releases/download/0.1.1/secrets-manager-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "e793955d66b91238698d1820a71bc4c9800bd00b295becd377f6fc62bfe9be8b"
    end
  end
  license "MIT"

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "secrets-manager"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "secrets-manager"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "secrets-manager"
    end

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
