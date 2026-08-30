class Reviewer < Formula
  version '0.7.0'
  homepage 'https://github.com/handlename/reviewer'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/handlename/reviewer/releases/download/v0.7.0/reviewer_0.7.0_darwin_arm64.tar.gz'
      sha256 '160d2a07efc8cf9d7989bf363322b20688e5bd7addbc7b9329aa54e122ae35d6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/reviewer/releases/download/v0.7.0/reviewer_0.7.0_darwin_amd64.tar.gz'
      sha256 '1495ab700c7b723f31458c8915839e3151a60eaec12cf9b70a7394ceda246b2e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/handlename/reviewer/releases/download/v0.7.0/reviewer_0.7.0_linux_arm64.tar.gz'
      sha256 '6ac8b00ddd28bbd3ba0a052f7b0896ad41463ae9a2837ab4ad3d80e63975a20e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/reviewer/releases/download/v0.7.0/reviewer_0.7.0_linux_amd64.tar.gz'
      sha256 'f1813f5b333a12f5a44e4b934a83985364e322dcf52c661f0c135960e4fc488a'
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
