class SecretsManager < Formula
  desc "A tool to manage secrets and configurations and working with aws secrets-manager, inspired by https://github.com/ThePrimeagen/projector"
  homepage "https://github.com/giallojoe/secrets-manager"
  version "0.1.3"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/giallojoe/secrets-manager/releases/download/0.1.3/secrets-manager-aarch64-apple-darwin.tar.xz"
      sha256 "39ada0073d155bc9cb61a3faf3bc9d620452a69c79b115e11d0bbe269e866cc6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/giallojoe/secrets-manager/releases/download/0.1.3/secrets-manager-x86_64-apple-darwin.tar.xz"
      sha256 "7ea6f69c6c2da49b2e9a8a87935bbfcdeb9db537360d0e93403c0ec35dd41997"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/giallojoe/secrets-manager/releases/download/0.1.3/secrets-manager-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "c77fdfee5dd22e5dc70f3c346a1086fd1fe74a81abdc5fd0d8ff8dbe553a4caf"
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
