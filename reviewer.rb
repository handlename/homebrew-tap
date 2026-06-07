class Reviewer < Formula
  version '0.0.2'
  homepage 'https://github.com/handlename/reviewer'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/handlename/reviewer/releases/download/v0.0.2/reviewer_0.0.2_darwin_arm64.tar.gz'
      sha256 'a056c8e7e4ea1987b50c074494121052aae10ff4c293ed2861072fe70687d52e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/reviewer/releases/download/v0.0.2/reviewer_0.0.2_darwin_amd64.tar.gz'
      sha256 '2fe67d8e0e6be670e893915db1d51738d0499828b3f8b10e4e04643c5a6c8099'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/handlename/reviewer/releases/download/v0.0.2/reviewer_0.0.2_linux_arm64.tar.gz'
      sha256 'a789034a1069579f7507dbfcfee2ed0799df9c064ed4295ae0f866f06dc2e416'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/reviewer/releases/download/v0.0.2/reviewer_0.0.2_linux_amd64.tar.gz'
      sha256 'c7f02a545bd44af5382a11038e5dc6940de7adce91419c89b94a412457366615'
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
