class Awsc < Formula
  version '0.2.2'
  homepage 'https://github.com/handlename/awsc'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/handlename/awsc/releases/download/v0.2.2/awsc_0.2.2_darwin_arm64.tar.gz'
      sha256 '26466cc62d16d28dd78cf7ea26f2ae2ec3815575c7f9d54fed1b364eba978017'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/awsc/releases/download/v0.2.2/awsc_0.2.2_darwin_amd64.tar.gz'
      sha256 'f5d356f8f51d0a778b8d8517346317e2dcec17df2bfcbc47a3df18676443cd90'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/handlename/awsc/releases/download/v0.2.2/awsc_0.2.2_linux_arm64.tar.gz'
      sha256 '5135ad8b2e54e1552d2984c167ca77dc1c7a47a2cb34a359bdeede3fb998bb5b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/awsc/releases/download/v0.2.2/awsc_0.2.2_linux_amd64.tar.gz'
      sha256 'f6947e873c71deba8765ab1a50a3e1688f282b1fa736c661981ba7c20a80b457'
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
