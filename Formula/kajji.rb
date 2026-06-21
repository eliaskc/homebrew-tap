class Kajji < Formula
  desc "Terminal UI for Jujutsu: the rudder for your jj"
  homepage "https://github.com/eliaskc/kajji"
  version "0.14.1"
  license "MIT"

  def caveats
    "kajji requires `jj` to be available on your PATH."
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eliaskc/kajji/releases/download/v#{version}/kajji-darwin-arm64.zip"
      sha256 "f303d025a56c10a2cba6381db64a7b9ddbd97500aa7579eb86f51772a294cacd"
    else
      url "https://github.com/eliaskc/kajji/releases/download/v#{version}/kajji-darwin-x64.zip"
      sha256 "242bc694a17eb46e364d7bb5809cc7b78c832be09e3ab16f9d362e1d09e43b2f"
    end
  end

  # Linuxbrew is x86_64-only upstream, so we ship a single Linux bottle.
  on_linux do
    url "https://github.com/eliaskc/kajji/releases/download/v#{version}/kajji-linux-x64.tar.gz"
    sha256 "cf0f83c7d95a130a9cedbedaa0c37dc57a71e9ed656c73931e8954792f06344a"
  end

  def install
    bin.install "kajji"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kajji --version")
  end
end
