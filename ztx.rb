class Ztx < Formula
  desc 'PTY-proxy wrapper that makes AI agent CLIs for Zed.'
  version '0.2.0'
  homepage 'https://github.com/handlename/ztx'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/handlename/ztx/releases/download/v0.2.0/ztx_0.2.0_darwin_arm64.tar.gz'
      sha256 '2e6725068dba1d7b36e0d5948503f051f8d9e0ee822c1cac642b5a632d3a869a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/ztx/releases/download/v0.2.0/ztx_0.2.0_darwin_amd64.tar.gz'
      sha256 '0192630fbf22635a224c5ccbb52216a1909354895bfaec250f19aa825c649ab1'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/handlename/ztx/releases/download/v0.2.0/ztx_0.2.0_linux_arm64.tar.gz'
      sha256 '3f86bd0805b13a2372149ed4cbb0ff8ba3c33ea028352000725e6c5adc320ac6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/ztx/releases/download/v0.2.0/ztx_0.2.0_linux_amd64.tar.gz'
      sha256 'd667f85f9ad6cee0d2b1f83fc83499e699289d3319480b09727f999f1481db61'
    end
  end

  head do
    url 'https://github.com/handlename/ztx.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'ztx'
  end

  test do
    system "#{bin}/ztx", '-h'
  end
end
