class Tp < Formula
  desc "Directory teleportation with worktree-aware bookmarks"
  homepage "https://github.com/jeffdt/teleport"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jeffdt/teleport/releases/download/v#{version}/tp-core-aarch64-apple-darwin"
      sha256 "3040921da87dcde276d3e7049e12020d1444b1c70a9b8914f2db84d5256694a3"
    end
  end

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
