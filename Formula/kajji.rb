class Kajji < Formula
  desc "Terminal UI for Jujutsu: the rudder for your jj"
  homepage "https://github.com/eliaskc/kajji"
  version "0.20.0"
  license "MIT"

  def caveats
    "kajji requires `jj` to be available on your PATH."
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eliaskc/kajji/releases/download/v#{version}/kajji-darwin-arm64.zip"
      sha256 "515200aa8f56a840fe66b41b43c81aee3dcb5737a22492847d8b7fe1b7da9ca1"
    else
      url "https://github.com/eliaskc/kajji/releases/download/v#{version}/kajji-darwin-x64.zip"
      sha256 "5a26c696cc29cdaba7da863d9aaca21230cf7cdce9523dcc3a064aa666a56db4"
    end
  end

  # Linuxbrew is x86_64-only upstream, so we ship a single Linux bottle.
  on_linux do
    url "https://github.com/eliaskc/kajji/releases/download/v#{version}/kajji-linux-x64.tar.gz"
    sha256 "cf095ce5539e2796c553a527143775fe83f1ab7504d9e91b0ee283c36e818854"
  end

  def install
    bin.install "kajji"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kajji --version")
  end
end
