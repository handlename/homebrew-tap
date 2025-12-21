class Awsc < Formula
  version '0.3.4'
  homepage 'https://github.com/handlename/awsc'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/handlename/awsc/releases/download/v0.3.4/awsc_0.3.4_darwin_arm64.tar.gz'
      sha256 '7bd52ab52e1170bb8c6c82c06e7a2af957f3df9c509e7b83ca4eef939e2102eb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/awsc/releases/download/v0.3.4/awsc_0.3.4_darwin_amd64.tar.gz'
      sha256 '0f30228605139912629dbfd79e8dbe5a1af3bdcb0c85f4e1b609b99d98bcf8c4'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/handlename/awsc/releases/download/v0.3.4/awsc_0.3.4_linux_arm64.tar.gz'
      sha256 '808e4267c05437c65ff23e3dd3b35ad842289ae3094ce0a28a40f542a8c8306f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/awsc/releases/download/v0.3.4/awsc_0.3.4_linux_amd64.tar.gz'
      sha256 '33d251afb45202ff2b99c111471ee684e810ab55bd7a2071fed08571eae3b502'
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
