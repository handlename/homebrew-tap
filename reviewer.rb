class Reviewer < Formula
  version '0.8.0'
  homepage 'https://github.com/handlename/reviewer'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/handlename/reviewer/releases/download/v0.8.0/reviewer_0.8.0_darwin_arm64.tar.gz'
      sha256 'edcef1dfc10aafea67a2850e8e816ed6bba3a15f55171c94724f508424c24be0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/reviewer/releases/download/v0.8.0/reviewer_0.8.0_darwin_amd64.tar.gz'
      sha256 'badce7618c2502845436d82496ae31543552e59be5c711951c7b8497e6a3d373'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/handlename/reviewer/releases/download/v0.8.0/reviewer_0.8.0_linux_arm64.tar.gz'
      sha256 'bbd7cb3fca62edbc8eef6c56c8f4bd3353fe43164314c58491f141f4aa8fd749'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/reviewer/releases/download/v0.8.0/reviewer_0.8.0_linux_amd64.tar.gz'
      sha256 '8e06c426d0b11b6be68a35b47df5338dcff4a9d1b960cf8b85539ab2aa608811'
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
