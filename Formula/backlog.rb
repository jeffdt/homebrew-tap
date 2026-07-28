class Backlog < Formula
  desc "Fuzzy game-library search across Steam, Epic, GOG, and Amazon"
  homepage "https://github.com/jeffdt/backlog"
  url "https://github.com/jeffdt/backlog/releases/download/v0.2.0/backlog-aarch64-apple-darwin"
  sha256 "87655200fad1e7a15074f9894a324d5e73b09074684be4f460b3625140e9b7f0"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "backlog-aarch64-apple-darwin" => "backlog"
  end

  def caveats
    <<~EOS
      Fetch your libraries before searching:
        backlog setup   # Steam API key + profile (optional, for Steam)
        backlog sync    # pull from configured sources

      Then run `backlog` for the interactive picker, or `backlog <query>`.
    EOS
  end

  test do
    system bin/"backlog", "--help"
  end
end
