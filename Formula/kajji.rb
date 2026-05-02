class Kajji < Formula
  desc "Terminal UI for Jujutsu: the rudder for your jj"
  homepage "https://github.com/eliaskc/kajji"
  version "0.11.1"
  license "MIT"

  depends_on "jj"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eliaskc/kajji/releases/download/v#{version}/kajji-darwin-arm64.zip"
      sha256 "5736f3c4b780eaf8c88cb74fa84ed2e92b389d4ddeef7e63c8e408ffc83f108b"
    else
      url "https://github.com/eliaskc/kajji/releases/download/v#{version}/kajji-darwin-x64.zip"
      sha256 "fde742e750ded26fbebac7ec72daabf549917af3b84c95fdc3f98d67a161476e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eliaskc/kajji/releases/download/v#{version}/kajji-linux-arm64.tar.gz"
      sha256 "0765b01dc87d7d9d8f8da5bb64c7f7fa64072206500bfbadde320507cca0612d"
    else
      url "https://github.com/eliaskc/kajji/releases/download/v#{version}/kajji-linux-x64.tar.gz"
      sha256 "f4f12bb0e5ba05e216899965ffa5e4d207f0265181288d661ced3c7d022ad1ab"
    end
  end

  def install
    bin.install "kajji"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kajji --version")
  end
end
