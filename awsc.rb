class Awsc < Formula
  version '0.2.1'
  homepage 'https://github.com/handlename/awsc'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/handlename/awsc/releases/download/v0.2.1/awsc_0.2.1_darwin_arm64.tar.gz'
      sha256 '19082b41f89dbb6d06e534ade235ce9c85ee5f2b1ac46409bde16c2f4c0313e6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/awsc/releases/download/v0.2.1/awsc_0.2.1_darwin_amd64.tar.gz'
      sha256 '238be7a24341ab8a370b4c5c9b5f129fbb45a001a5d3d2f709f1b6496e021b1c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/handlename/awsc/releases/download/v0.2.1/awsc_0.2.1_linux_arm64.tar.gz'
      sha256 '945a11b84eaccdf13ca0da5a6eb51e3154e5773d0698401dc63a75023451b182'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/awsc/releases/download/v0.2.1/awsc_0.2.1_linux_amd64.tar.gz'
      sha256 '85ce1475164cf111cb1290002d22654c890b6a0c540656d08228e0ea514a4ee4'
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
