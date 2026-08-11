class Ztx < Formula
  desc 'PTY-proxy wrapper that makes AI agent CLIs for Zed.'
  version '0.1.2'
  homepage 'https://github.com/handlename/ztx'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/handlename/ztx/releases/download/v0.1.2/ztx_0.1.2_darwin_arm64.tar.gz'
      sha256 'cba6ffdb4118a5cd8655c3cf49f9a90015cb058cc51eec8627a95c2d1e265efc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/ztx/releases/download/v0.1.2/ztx_0.1.2_darwin_amd64.tar.gz'
      sha256 '8324a30f05e2bc51bdffb52b802b1d578badcd8b52e6683fb6c9e3380f4cea3f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/handlename/ztx/releases/download/v0.1.2/ztx_0.1.2_linux_arm64.tar.gz'
      sha256 'ec46db8f3413cbe90d30ba4ff4e144b61cc92e475353bc78827692bab2f5add7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/ztx/releases/download/v0.1.2/ztx_0.1.2_linux_amd64.tar.gz'
      sha256 '92e4f01a8ac1e134a12d3490d5d35cd63b63a3d77d864d7cb5a6ad65bb8fa342'
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
