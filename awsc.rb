class Awsc < Formula
  version '0.3.2'
  homepage 'https://github.com/handlename/awsc'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/handlename/awsc/releases/download/v0.3.2/awsc_0.3.2_darwin_arm64.tar.gz'
      sha256 '8a9016332921c9e770cda57f9b3e342b6874d2cfa9d80d16178459fa23c95eb9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/awsc/releases/download/v0.3.2/awsc_0.3.2_darwin_amd64.tar.gz'
      sha256 '6e1f060b70bc90f04e4ea3066f870b08bb1efe133d623bb1cd5f93dee5b1c4c3'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/handlename/awsc/releases/download/v0.3.2/awsc_0.3.2_linux_arm64.tar.gz'
      sha256 'd3c1d6d695d6524be41945ba830a776fa6f6d9a4b377e6c58f567d4598a10434'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/awsc/releases/download/v0.3.2/awsc_0.3.2_linux_amd64.tar.gz'
      sha256 '489b5e056d5b2412ba4cbb9b6d5550a79f8627c6a6736908d353f45ff3f84c7b'
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
