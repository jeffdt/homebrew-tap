class Backlog < Formula
  desc "Fuzzy game-library search across Steam, Epic, GOG, and Amazon"
  homepage "https://github.com/jeffdt/backlog"
  url "https://github.com/jeffdt/backlog/releases/download/v0.2.1/backlog-aarch64-apple-darwin"
  sha256 "44d590af68b0c99eb5558d2d0e1ec257cb407479edc281c41e731ec5ecfb8f31"
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
