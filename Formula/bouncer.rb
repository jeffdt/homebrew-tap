class Bouncer < Formula
  desc "Game library wrangler that keeps your shopping sprees in check"
  homepage "https://github.com/jeffdt/bouncer"
  url "https://github.com/jeffdt/bouncer/releases/download/v0.7.0/bouncer-aarch64-apple-darwin"
  sha256 "64ddc89ebc8e967eb146aed326e3263e77339faef6c495d84bb259186f6ae6e0"
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
