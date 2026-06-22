class Smux < Formula
  desc "Fast tmux session picker with pinned sessions and a window tree"
  homepage "https://github.com/jeffdt/smux"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jeffdt/smux/releases/download/v#{version}/smux-aarch64-apple-darwin"
      sha256 "d8367b81c34c20fdd5b255df49a3267e3311b3fd8b31ec2fba623303ae3870c4"
    end
  end

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
