class Ztx < Formula
  desc 'PTY-proxy wrapper that makes AI agent CLIs for Zed.'
  version '0.2.1'
  homepage 'https://github.com/handlename/ztx'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/handlename/ztx/releases/download/v0.2.1/ztx_0.2.1_darwin_arm64.tar.gz'
      sha256 '2a2200312a29459d2db0a5a666b4c08a6c87697cbba03a2647f155e41ebf8712'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/ztx/releases/download/v0.2.1/ztx_0.2.1_darwin_amd64.tar.gz'
      sha256 'f87c2560d09d42dd73ed47781366c8944620e2d81dc803991bfc6474c6b2ec0d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/handlename/ztx/releases/download/v0.2.1/ztx_0.2.1_linux_arm64.tar.gz'
      sha256 '316f648e518fa0c7da1e33d8ffa06b86cf5426900960f19acf8a10f0b7812753'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/ztx/releases/download/v0.2.1/ztx_0.2.1_linux_amd64.tar.gz'
      sha256 '5971d8c46495d8596b1828bd60046841cb163756957c56ae90af1b19522c78dc'
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
