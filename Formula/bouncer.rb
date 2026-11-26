class Bouncer < Formula
  desc "Game library wrangler that keeps your shopping sprees in check"
  homepage "https://github.com/jeffdt/bouncer"
  url "https://github.com/jeffdt/bouncer/releases/download/v0.3.0/bouncer-aarch64-apple-darwin"
  sha256 "f712811ac3c4de66e82db6ccb2d545095f68beb5deff2bdd15b067c6b221fc80"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "bouncer-aarch64-apple-darwin" => "bouncer"
  end

  def caveats
    <<~EOS
      Fetch your libraries before searching:
        bouncer setup   # Steam API key + profile (optional, for Steam)
        bouncer sync    # pull from configured sources

      Then run `bouncer` for the interactive picker, or `bouncer <query>`.
    EOS
  end

  test do
    system bin/"bouncer", "--help"
  end
end
