class Kajji < Formula
  desc "Terminal UI for Jujutsu: the rudder for your jj"
  homepage "https://github.com/eliaskc/kajji"
  version "0.18.0"
  license "MIT"

  def caveats
    "kajji requires `jj` to be available on your PATH."
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eliaskc/kajji/releases/download/v#{version}/kajji-darwin-arm64.zip"
      sha256 "bc44fddd459c9f581b656d210f48201a161ce336380ee063bb9a57fd8c3e6c50"
    else
      url "https://github.com/eliaskc/kajji/releases/download/v#{version}/kajji-darwin-x64.zip"
      sha256 "30aeca303a6feb6c7d6d3ae34b8d281c46c90e17870c71596d86e9b4959b233f"
    end
  end

  # Linuxbrew is x86_64-only upstream, so we ship a single Linux bottle.
  on_linux do
    url "https://github.com/eliaskc/kajji/releases/download/v#{version}/kajji-linux-x64.tar.gz"
    sha256 "5f99d1bd434b6e23a0a24124245515f128ac81e98a069722077425e33c7b78ec"
  end

  def install
    bin.install "kajji"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kajji --version")
  end
end
