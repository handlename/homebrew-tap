class Awsc < Formula
  version '0.3.1'
  homepage 'https://github.com/handlename/awsc'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/handlename/awsc/releases/download/v0.3.1/awsc_0.3.1_darwin_arm64.tar.gz'
      sha256 '61d8ce2c604953e49c42ad5a217b9777a77d7a455c5487b3ea71be3cc6545d79'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/awsc/releases/download/v0.3.1/awsc_0.3.1_darwin_amd64.tar.gz'
      sha256 'a9637e1ab49c3e63ed9c82a02cd3edf17e2f817d422e73232c30f4874e30ace0'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/handlename/awsc/releases/download/v0.3.1/awsc_0.3.1_linux_arm64.tar.gz'
      sha256 '77e6fb220b1aebb780a9cbae28b382a63c95dbc700eb22cc094093eca3c316ae'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/awsc/releases/download/v0.3.1/awsc_0.3.1_linux_amd64.tar.gz'
      sha256 'a33b8a447aa60c6326caac54dd4e12aa75cffae992ec47c88a0fa3c6a4de943f'
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
