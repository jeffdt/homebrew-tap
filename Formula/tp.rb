class Tp < Formula
  desc "Directory teleportation with worktree-aware bookmarks"
  homepage "https://github.com/jeffdt/teleport"
  url "https://github.com/jeffdt/teleport/releases/download/v0.3.0/tp-core-aarch64-apple-darwin"
  sha256 "355e3d81bf50b900c8df6c67b8b45a660cf8f0df1a0bc375b52cec49ea4ce64e"
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
