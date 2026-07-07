class Rolomux < Formula
  desc "Fast tmux session picker with pinned sessions and a window tree"
  homepage "https://github.com/jeffdt/rolomux"
  url "https://github.com/jeffdt/rolomux/releases/download/v0.17.0/rolomux-aarch64-apple-darwin"
  sha256 "25627b471fcb6438637f8a129273c9aad709f0240c9f00ea6c154669320651ce"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "rolomux-aarch64-apple-darwin" => "rolomux"
  end

  def caveats
    <<~EOS
      Add a keybind to your ~/.tmux.conf, e.g.:
        bind s display-popup -E -B -w 84 -h 60% "exec rolomux"

      Then reload tmux and press prefix + s.
    EOS
  end

  test do
    assert_match "rolomux #{version}", shell_output("#{bin}/rolomux --version")
  end
end
