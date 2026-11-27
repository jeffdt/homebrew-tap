class Bouncer < Formula
  desc "Game library wrangler that keeps your shopping sprees in check"
  homepage "https://github.com/jeffdt/bouncer"
  url "https://github.com/jeffdt/bouncer/releases/download/v0.4.0/bouncer-aarch64-apple-darwin"
  sha256 "1d1686a1f9675f025f2d1a2aeea7e6a2fdd1a1256ba49611cdbe31d519a8021f"
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
