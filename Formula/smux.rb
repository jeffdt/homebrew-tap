class Smux < Formula
  desc "Fast tmux session picker with pinned sessions and a window tree"
  homepage "https://github.com/jeffdt/smux"
  url "https://github.com/jeffdt/smux/releases/download/v0.6.0/smux-aarch64-apple-darwin"
  sha256 "5d117ce34162ea3e54d0962a09d633d7e75e47a13689ce93574fd04e37a524b2"
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
