class Reviewer < Formula
  version '0.2.0'
  homepage 'https://github.com/handlename/reviewer'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/handlename/reviewer/releases/download/v0.2.0/reviewer_0.2.0_darwin_arm64.tar.gz'
      sha256 '3cffcb15ad0dfd1b22880b82874a3be5b6553d687d7e4ed78867f51835465c2d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/reviewer/releases/download/v0.2.0/reviewer_0.2.0_darwin_amd64.tar.gz'
      sha256 'a334c48ddea35551cee1ff8639599f16c6f17813057cc4051322f292af04c151'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/handlename/reviewer/releases/download/v0.2.0/reviewer_0.2.0_linux_arm64.tar.gz'
      sha256 '680b01e7eeef62eff254d3afda9150e51cff8d2dc4531164d38492161c9eafb4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/reviewer/releases/download/v0.2.0/reviewer_0.2.0_linux_amd64.tar.gz'
      sha256 'f124a670e048aca6681561dd8b184ea73879eac92a80c2acd2b7b2aaab61d8e3'
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
