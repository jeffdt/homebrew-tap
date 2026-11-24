class Boomerang < Formula
  desc "Tmux-popup TUI for browsing and managing GitHub issues"
  homepage "https://github.com/jeffdt/boomerang"
  url "https://github.com/jeffdt/boomerang/releases/download/v0.5.2/boomerang-aarch64-apple-darwin"
  sha256 "16f0bf9e4abbc73baaca18b2a4d4286118b35806254732d69a5ec73a0dfacdfe"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "boomerang-aarch64-apple-darwin" => "boomerang"
  end

  def caveats
    <<~EOS
      Add a keybind to your ~/.tmux.conf, e.g.:
        bind i display-popup -E -B -d "\#{pane_current_path}" -w 84 -h 60% "exec boomerang"

      Then reload tmux and press prefix + i.
    EOS
  end

  test do
    assert_match "boomerang #{version}", shell_output("#{bin}/boomerang --version")
  end
end
