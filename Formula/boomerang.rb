class Boomerang < Formula
  desc "Tmux-popup TUI for browsing, searching, creating, editing, and closing GitHub issues"
  homepage "https://github.com/jeffdt/boomerang"
  url "https://github.com/jeffdt/boomerang/releases/download/v0.1.0/boomerang-aarch64-apple-darwin"
  sha256 "46d3d9ce83338cbd41f074e30cc7c44b7b30253d37a2ba3a291508166fb1cadb"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "boomerang-aarch64-apple-darwin" => "boomerang"
  end

  def caveats
    <<~EOS
      Add a keybind to your ~/.tmux.conf, e.g.:
        bind i display-popup -E -B -d "#{pane_current_path}" -w 84 -h 60% "exec boomerang"

      Then reload tmux and press prefix + i.
    EOS
  end

  test do
    assert_match "boomerang #{version}", shell_output("#{bin}/boomerang --version")
  end
end
