class Tp < Formula
  desc "Directory teleportation with worktree-aware bookmarks"
  homepage "https://github.com/jeffdt/teleport"
  url "https://github.com/jeffdt/teleport/releases/download/v0.2.0/tp-core-aarch64-apple-darwin"
  sha256 "76a172128190504f670ea275613bcb6989d877fd75855da97eefdbb10cc7e50b"
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
