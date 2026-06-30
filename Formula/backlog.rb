class Backlog < Formula
  desc "Fuzzy game-library search across Steam, Epic, GOG, and Amazon"
  homepage "https://github.com/jeffdt/backlog"
  url "https://github.com/jeffdt/backlog/releases/download/v0.1.0/backlog-aarch64-apple-darwin"
  sha256 "767310c747695673052d34189f6cb832905e3a728156cd894d8311f1a03b25d8"
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
