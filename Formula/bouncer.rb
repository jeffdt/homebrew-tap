class Bouncer < Formula
  desc "Game library wrangler that keeps your shopping sprees in check"
  homepage "https://github.com/jeffdt/bouncer"
  url "https://github.com/jeffdt/bouncer/releases/download/v0.11.0/bouncer-aarch64-apple-darwin"
  sha256 "4488e5984812e5549e8f2ca4efbe6093e9abf6b4aaf224f51f8cdd6d77a85a32"
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
      `bouncer cart` judges your Steam cart against your library and price
      history; see `bouncer cart --help` for the token it needs.
    EOS
  end

  test do
    system bin/"bouncer", "--help"
  end
end
