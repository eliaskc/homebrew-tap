class Kajji < Formula
  desc "Terminal UI for Jujutsu: the rudder for your jj"
  homepage "https://github.com/eliaskc/kajji"
  version "0.13.0"
  license "MIT"

  depends_on "jj"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eliaskc/kajji/releases/download/v#{version}/kajji-darwin-arm64.zip"
      sha256 "58eb173ca0213e7d157f7b7c6a9439a73bebac21e5533625125c8863ec3a7e22"
    else
      url "https://github.com/eliaskc/kajji/releases/download/v#{version}/kajji-darwin-x64.zip"
      sha256 "4b45cfa2ae9891a942b66de8a32043b9f5629e8c5ca833f27afffc0e8d64bd1b"
    end
  end

  # Linuxbrew is x86_64-only upstream, so we ship a single Linux bottle.
  on_linux do
    url "https://github.com/eliaskc/kajji/releases/download/v#{version}/kajji-linux-x64.tar.gz"
    sha256 "34a466467692baf33c62d6ef453d2c0abca6bf73b4b28652f13a8944e49085d0"
  end

  def install
    bin.install "kajji"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kajji --version")
  end
end
