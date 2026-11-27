class Bouncer < Formula
  desc "Game library wrangler that keeps your shopping sprees in check"
  homepage "https://github.com/jeffdt/bouncer"
  url "https://github.com/jeffdt/bouncer/releases/download/v0.9.0/bouncer-aarch64-apple-darwin"
  sha256 "3f1d57d8b9a29ea2a8d5672fc0b80ca79ce548464751a64e95744bddd0aa6225"
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
