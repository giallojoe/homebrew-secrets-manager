class SecretsManager < Formula
  desc "A tool to manage secrets and configurations and working with aws secrets-manager, inspired by https://github.com/ThePrimeagen/projector"
  homepage "https://github.com/giallojoe/secrets-manager"
  version "0.1.2"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/giallojoe/secrets-manager/releases/download/0.1.2/secrets-manager-aarch64-apple-darwin.tar.xz"
      sha256 "0615ce5f1c701715d7dd5297c6c5f0b307b69f02052737e710964bc0c4bfc4c0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/giallojoe/secrets-manager/releases/download/0.1.2/secrets-manager-x86_64-apple-darwin.tar.xz"
      sha256 "3108a1a60fa0802273c608fcbc5faf51091face2606ee400da0dc3f745a938d0"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/giallojoe/secrets-manager/releases/download/0.1.2/secrets-manager-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "288beb4331567198cf4e312d5cf74d3c22e6c92619d360becc80ae97a16650bc"
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
