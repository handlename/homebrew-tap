class Reviewer < Formula
  version '0.1.0'
  homepage 'https://github.com/handlename/reviewer'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/handlename/reviewer/releases/download/v0.1.0/reviewer_0.1.0_darwin_arm64.tar.gz'
      sha256 '0bd3353e387a04313e353676d3f577abb1b87ca23cc09703eac27d8ddc702392'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/reviewer/releases/download/v0.1.0/reviewer_0.1.0_darwin_amd64.tar.gz'
      sha256 '06936583df817b61e1e32525aed3aa9d12a4e24984011d1797af36d1f4c260d4'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/handlename/reviewer/releases/download/v0.1.0/reviewer_0.1.0_linux_arm64.tar.gz'
      sha256 '5281c1d7b2b0d53b33267b6128742c54f0b751957f309d873a17e4501c1f2d42'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/reviewer/releases/download/v0.1.0/reviewer_0.1.0_linux_amd64.tar.gz'
      sha256 '313ddfd492d898a492a6ffd45c47f30683a3d7019c26c18981ebad2b1d00dd09'
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
