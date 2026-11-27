class Bouncer < Formula
  desc "Game library wrangler that keeps your shopping sprees in check"
  homepage "https://github.com/jeffdt/bouncer"
  url "https://github.com/jeffdt/bouncer/releases/download/v0.6.0/bouncer-aarch64-apple-darwin"
  sha256 "bc88da5aa29432d47429901e133df7934e06f4c425311793c5a28a8d8fee75c3"
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
