class Awsc < Formula
  version '0.1.0'
  homepage 'https://github.com/handlename/awsc'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/handlename/awsc/releases/download/v0.1.0/awsc_0.1.0_darwin_arm64.tar.gz'
      sha256 '4e4ff42449ad1d401fa4600638ee87e8b17ff7b829985883c6c846cae79f77f8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/awsc/releases/download/v0.1.0/awsc_0.1.0_darwin_amd64.tar.gz'
      sha256 '80a932fc679e76af102f7d3f0db9e9c1e2a8ef3ec9f39c26f24a80a94ebceee8'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/handlename/awsc/releases/download/v0.1.0/awsc_0.1.0_linux_arm64.tar.gz'
      sha256 '1c7212706b2b387d368144902284ed975e2b25d1c71a64c1bbf18914bdc7d867'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/awsc/releases/download/v0.1.0/awsc_0.1.0_linux_amd64.tar.gz'
      sha256 'db5afe1a60864237cd11caef8dd8084b82f7fa5b43323cc0c50e7766dd5c971a'
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
