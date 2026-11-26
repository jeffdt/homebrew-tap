class Bouncer < Formula
  desc "Game library wrangler that keeps your shopping sprees in check"
  homepage "https://github.com/jeffdt/bouncer"
  url "https://github.com/jeffdt/bouncer/releases/download/v0.3.0/bouncer-aarch64-apple-darwin"
  sha256 "44d590af68b0c99eb5558d2d0e1ec257cb407479edc281c41e731ec5ecfb8f31"
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
