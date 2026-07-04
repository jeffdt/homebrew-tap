class Smux < Formula
  desc "Fast tmux session picker with pinned sessions and a window tree"
  homepage "https://github.com/jeffdt/smux"
  url "https://github.com/jeffdt/smux/releases/download/v0.11.0/smux-aarch64-apple-darwin"
  sha256 "2207ca8e4e734ff894a0f06c1d709aa5ed811fb5afcb636541cb3a43b88a8010"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "smux-aarch64-apple-darwin" => "smux"
  end

  def caveats
    <<~EOS
      Add a keybind to your ~/.tmux.conf, e.g.:
        bind S display-popup -E -B -w 84 -h 60% "exec smux"

      Then reload tmux and press prefix + Shift+S.
    EOS
  end

  test do
    assert_match "smux #{version}", shell_output("#{bin}/smux --version")
  end
end
