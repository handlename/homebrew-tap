class Reviewer < Formula
  version '0.0.1'
  homepage 'https://github.com/handlename/reviewer'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/handlename/reviewer/releases/download/v0.0.1/reviewer_0.0.1_darwin_arm64.tar.gz'
      sha256 '5f424a1abdbb0a4a565a726df2f4d7157fd45f9c3252ce559712d29992008d07'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/reviewer/releases/download/v0.0.1/reviewer_0.0.1_darwin_amd64.tar.gz'
      sha256 '80429c4ac8cca2df891437d43b0da2e6c67f7bed5e8ee1273b09221388e582e4'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/handlename/reviewer/releases/download/v0.0.1/reviewer_0.0.1_linux_arm64.tar.gz'
      sha256 '5f537df7426705643697607ccf4b8da057f3738f024e32ed26d4a9ddf6f57246'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/reviewer/releases/download/v0.0.1/reviewer_0.0.1_linux_amd64.tar.gz'
      sha256 '8627e4fdb25b95920a26589dcc3bcf301325fec81b818372bcafa8f48cb367bf'
    end
  end

  head do
    url 'https://github.com/handlename/reviewer.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'reviewer'
  end

  test do
    system "#{bin}/reviewer", '-h'
  end
end
