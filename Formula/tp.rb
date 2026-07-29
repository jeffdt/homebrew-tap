class Tp < Formula
  desc "Directory teleportation with worktree-aware bookmarks"
  homepage "https://github.com/jeffdt/teleport"
  url "https://github.com/jeffdt/teleport/releases/download/v0.5.0/tp-core-aarch64-apple-darwin"
  sha256 "cbfa927c20ec8e2fead1b55dfe88f44198603c0c097d8abbff83d6119ea0c746"
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
