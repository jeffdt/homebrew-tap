class Tp < Formula
  desc "Directory teleportation with worktree-aware bookmarks"
  homepage "https://github.com/jeffdt/teleport"
  url "https://github.com/jeffdt/teleport/releases/download/v0.6.0/tp-core-aarch64-apple-darwin"
  sha256 "0f79e93215a4a589ea39ec11f669a672350379a591d20d0745ead7652d141f05"
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
