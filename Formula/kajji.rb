class Kajji < Formula
  desc "Terminal UI for Jujutsu: the rudder for your jj"
  homepage "https://github.com/eliaskc/kajji"
  version "0.11.1"
  license "MIT"

  depends_on "jj"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eliaskc/kajji/releases/download/v#{version}/kajji-darwin-arm64.zip"
      sha256 "b45fda10b4d8d44df61edc7d11c177e3c873cf7984973bf09c514bda05bfabe0"
    else
      url "https://github.com/eliaskc/kajji/releases/download/v#{version}/kajji-darwin-x64.zip"
      sha256 "0022c838f045346a511c4ab87ba1ed5743d6006da91e4431ed02582d7cf0bf02"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eliaskc/kajji/releases/download/v#{version}/kajji-linux-arm64.tar.gz"
      sha256 "99831d13d420846420a9f73eb56bceda7122c3e73ccc4a3c750a8b05f5cd4231"
    else
      url "https://github.com/eliaskc/kajji/releases/download/v#{version}/kajji-linux-x64.tar.gz"
      sha256 "a74efb4e1c636e88e1e211751c6afa2f8c496dc0499a0b44fcddd7e1ab2262ab"
    end
  end

  def install
    bin.install "kajji"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kajji --version")
  end
end
