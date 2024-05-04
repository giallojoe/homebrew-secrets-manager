class SecretsManager < Formula
  desc "A tool to manage secrets and configurations and working with aws secrets-manager, inspired by https://github.com/ThePrimeagen/projector"
  homepage "https://github.com/giallojoe/secrets-manager"
  version "1.0.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/giallojoe/secrets-manager/releases/download/v1.0.0/secrets-manager-aarch64-apple-darwin.tar.xz"
      sha256 "dc41879bfa72f0547620d1900ab381b6780ac955819ff47ae766b6d460da2108"
    end
    if Hardware::CPU.intel?
      url "https://github.com/giallojoe/secrets-manager/releases/download/v1.0.0/secrets-manager-x86_64-apple-darwin.tar.xz"
      sha256 "45212cff85c048ab075f6cd74a2198fdb3e9731a5c5aaf19aee9a136ff925969"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/giallojoe/secrets-manager/releases/download/v1.0.0/secrets-manager-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "b874691c92f55335130f5882637a17fd0c8f3b3edfe78f18317c0fcfe6e2fa72"
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
