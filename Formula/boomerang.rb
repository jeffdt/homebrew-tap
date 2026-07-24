class Boomerang < Formula
  desc "Tmux-popup TUI for browsing and managing GitHub issues"
  homepage "https://github.com/jeffdt/boomerang"
  url "https://github.com/jeffdt/boomerang/releases/download/v0.3.16/boomerang-aarch64-apple-darwin"
  sha256 "131bd3edaf035394ad70b4bfb417a95c55bc9158b479db3a3c06653a9a23a649"
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
