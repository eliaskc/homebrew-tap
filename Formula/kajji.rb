class Kajji < Formula
  desc "Terminal UI for Jujutsu: the rudder for your jj"
  homepage "https://github.com/eliaskc/kajji"
  version "0.17.0"
  license "MIT"

  def caveats
    "kajji requires `jj` to be available on your PATH."
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eliaskc/kajji/releases/download/v#{version}/kajji-darwin-arm64.zip"
      sha256 "88518dd36e8a349c58844c279827986589d0ef89e36ca3b7d7a68c91d3c159f7"
    else
      url "https://github.com/eliaskc/kajji/releases/download/v#{version}/kajji-darwin-x64.zip"
      sha256 "89548cbed536ac2e0c1f9f3f7c2a8b9f4f7f8566ea6428095f04a2fd142e3ddb"
    end
  end

  # Linuxbrew is x86_64-only upstream, so we ship a single Linux bottle.
  on_linux do
    url "https://github.com/eliaskc/kajji/releases/download/v#{version}/kajji-linux-x64.tar.gz"
    sha256 "ead2f8dfd450c34cd3142a15678eacb6b12d85016a3484fc2249326bb79e1f63"
  end

  def install
    bin.install "kajji"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kajji --version")
  end
end
