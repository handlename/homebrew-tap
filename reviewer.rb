class Reviewer < Formula
  version '0.4.0'
  homepage 'https://github.com/handlename/reviewer'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/handlename/reviewer/releases/download/v0.4.0/reviewer_0.4.0_darwin_arm64.tar.gz'
      sha256 '7c18edec9830f490080fade723c2ca682130964e151b85663b7fb4646b7d2a62'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/reviewer/releases/download/v0.4.0/reviewer_0.4.0_darwin_amd64.tar.gz'
      sha256 '6cfe98620039a2d2033a9c38259e4df289835b82d7010002591c8638892293d1'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/handlename/reviewer/releases/download/v0.4.0/reviewer_0.4.0_linux_arm64.tar.gz'
      sha256 'e2fda2a6d3209559a9c30c1c59bf9bf43cfffd3d062386bd5e291a8424568ac0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/reviewer/releases/download/v0.4.0/reviewer_0.4.0_linux_amd64.tar.gz'
      sha256 'df3ec410b3d56caee6f6279c5126c242ce20ac112625a7b9a33f9d48af6b0c14'
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
