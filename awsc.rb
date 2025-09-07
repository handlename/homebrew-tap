class Awsc < Formula
  version '0.3.0'
  homepage 'https://github.com/handlename/awsc'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/handlename/awsc/releases/download/v0.3.0/awsc_0.3.0_darwin_arm64.tar.gz'
      sha256 'aa324f9c00c2b1abfe158d98d4db360c6ce3a660ff3d108d175fff59b1eff38e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/awsc/releases/download/v0.3.0/awsc_0.3.0_darwin_amd64.tar.gz'
      sha256 '8939efb1eefbf8d30163c4a49b0e0447478bfe937c620061ab2f30a5251dd28a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/handlename/awsc/releases/download/v0.3.0/awsc_0.3.0_linux_arm64.tar.gz'
      sha256 '36c70a51eb6c545ac597ec57a9317b0b82aca5b4de73c46458d895a078ec9423'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/awsc/releases/download/v0.3.0/awsc_0.3.0_linux_amd64.tar.gz'
      sha256 'c3fc7881a9ed3de9a3918510d609a9fd407a46ec425e757213aae2ec9bc6de5b'
    end
  end

  head do
    url 'https://github.com/handlename/awsc.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'awsc'
  end
end
