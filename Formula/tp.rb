class Tp < Formula
  desc "Directory teleportation with worktree-aware bookmarks"
  homepage "https://github.com/jeffdt/teleport"
  url "https://github.com/jeffdt/teleport/releases/download/v0.4.0/tp-core-aarch64-apple-darwin"
  sha256 "3ace1aa627dfb98e4b427ce4542b9bd8272f3479ceb45c730b1aec77ac6fa76b"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "tp-core-aarch64-apple-darwin" => "tp-core"
  end

  def caveats
    <<~EOS
      Add the following to your ~/.zshrc to enable the tp shell function:
        eval "$(tp-core --init zsh)"
    EOS
  end

  test do
    system bin/"tp-core", "--version"
  end
end
