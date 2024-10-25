class Awsc < Formula
  version '0.2.0'
  homepage 'https://github.com/handlename/awsc'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/handlename/awsc/releases/download/v0.2.0/awsc_0.2.0_darwin_arm64.tar.gz'
      sha256 '3f7427c143991670486a832676b2bdd7d42eaf4984711e47065396300f88883e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/awsc/releases/download/v0.2.0/awsc_0.2.0_darwin_amd64.tar.gz'
      sha256 '5fd00ec40b3c9f36b082d96bfb7b1fd0c40a29d2b19b80da6ad88e415d806571'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/handlename/awsc/releases/download/v0.2.0/awsc_0.2.0_linux_arm64.tar.gz'
      sha256 'c57c494b88923c9f455b23fb8e937be18fef29c19ac3857666ad63376a2875f4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/awsc/releases/download/v0.2.0/awsc_0.2.0_linux_amd64.tar.gz'
      sha256 '36fe9b9bcb524ec9f62851a9453e9d25ac5199eecc4d2c6877fbcf188f34c13b'
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
