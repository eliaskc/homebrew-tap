class Kajji < Formula
  desc "Terminal UI for Jujutsu: the rudder for your jj"
  homepage "https://github.com/eliaskc/kajji"
  version "0.14.0"
  license "MIT"

  depends_on "jj"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eliaskc/kajji/releases/download/v#{version}/kajji-darwin-arm64.zip"
      sha256 "c55a4902d74bc8c6379d07cb95955c3aa59cad91cf403661e21e2ad53521410c"
    else
      url "https://github.com/eliaskc/kajji/releases/download/v#{version}/kajji-darwin-x64.zip"
      sha256 "4cbe7c0100e4d3aad99dfadd73bd87f1ded4456b903086d3f12abd5a64555b88"
    end
  end

  # Linuxbrew is x86_64-only upstream, so we ship a single Linux bottle.
  on_linux do
    url "https://github.com/eliaskc/kajji/releases/download/v#{version}/kajji-linux-x64.tar.gz"
    sha256 "68b3474aafdaed69222376dea91d6378c7a1f007368389c8cc9cc1263d340772"
  end

  def install
    bin.install "kajji"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kajji --version")
  end
end
