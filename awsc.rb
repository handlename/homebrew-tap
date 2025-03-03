class Awsc < Formula
  version '0.2.3'
  homepage 'https://github.com/handlename/awsc'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/handlename/awsc/releases/download/v0.2.3/awsc_0.2.3_darwin_arm64.tar.gz'
      sha256 '5dcb0c9d943f144c00a31ab16c3c4b73ee35e8e1b9086bbb663fc46fc8354d44'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/awsc/releases/download/v0.2.3/awsc_0.2.3_darwin_amd64.tar.gz'
      sha256 '256bf471e8295de018a139ab61b54c91a9172694955e0b1a2923a9157cc0172c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/handlename/awsc/releases/download/v0.2.3/awsc_0.2.3_linux_arm64.tar.gz'
      sha256 'c6e7929143f718b0be176fb2bcca765b22eda8e07fe7aad1098f6b8840896d1c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/awsc/releases/download/v0.2.3/awsc_0.2.3_linux_amd64.tar.gz'
      sha256 'ec41b897cf4717bec383e2d1ba2bc60cbc13f626e98a53eb79a6c178811389ab'
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
