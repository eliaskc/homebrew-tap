class Kajji < Formula
  desc "Terminal UI for Jujutsu: the rudder for your jj"
  homepage "https://github.com/eliaskc/kajji"
  version "0.15.0"
  license "MIT"

  def caveats
    "kajji requires `jj` to be available on your PATH."
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eliaskc/kajji/releases/download/v#{version}/kajji-darwin-arm64.zip"
      sha256 "b9628fc3c2728b5608a5ffdaeab5bfb3e10b65cbf9b0cd1f4402047c4b4850a7"
    else
      url "https://github.com/eliaskc/kajji/releases/download/v#{version}/kajji-darwin-x64.zip"
      sha256 "107716a6988482c81a439351d3f139ffe30ae6728123c01c0e246fe1f3a34359"
    end
  end

  # Linuxbrew is x86_64-only upstream, so we ship a single Linux bottle.
  on_linux do
    url "https://github.com/eliaskc/kajji/releases/download/v#{version}/kajji-linux-x64.tar.gz"
    sha256 "e9a08feb538c0ec65b5c8a0838b69ef3514567511b80724877e265b404bff69f"
  end

  def install
    bin.install "kajji"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kajji --version")
  end
end
