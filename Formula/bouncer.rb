class Bouncer < Formula
  desc "Game library wrangler that keeps your shopping sprees in check"
  homepage "https://github.com/jeffdt/bouncer"
  url "https://github.com/jeffdt/bouncer/releases/download/v0.10.0/bouncer-aarch64-apple-darwin"
  sha256 "535e34a2ad96c90767edf0b5fa2dbbac2722cc55896011ad59650ffffcfc0b9b"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "bouncer-aarch64-apple-darwin" => "bouncer"
  end

  def caveats
    <<~EOS
      Fetch your libraries before searching:
        bouncer setup   # Steam API key + profile, IsThereAnyDeal key (all optional)
        bouncer sync    # pull from configured sources

      Then run `bouncer` for the interactive picker, or `bouncer <query>`.
      `bouncer price <game>` checks prices (needs the IsThereAnyDeal key).
    EOS
  end

  test do
    system bin/"bouncer", "--help"
  end
end
