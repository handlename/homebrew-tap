class Reviewer < Formula
  version '0.5.0'
  homepage 'https://github.com/handlename/reviewer'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/handlename/reviewer/releases/download/v0.5.0/reviewer_0.5.0_darwin_arm64.tar.gz'
      sha256 'eaa24c85a8300fe4c2154b5cdb1dcab58e81c3b02d4bc23d3f7e1210ca215798'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/reviewer/releases/download/v0.5.0/reviewer_0.5.0_darwin_amd64.tar.gz'
      sha256 '223800c7b24b53d85b8e07034978f5196a49a00e351219d0068f1da247341427'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/handlename/reviewer/releases/download/v0.5.0/reviewer_0.5.0_linux_arm64.tar.gz'
      sha256 'b050fbda5ef14856c543e96cbc9ea4ccf021ddc6d9d6f2830d731aca877e08d1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/reviewer/releases/download/v0.5.0/reviewer_0.5.0_linux_amd64.tar.gz'
      sha256 'b1ad5cd700b8a528f5ab8383ed2eac6216bffac93a4c2517cdf96fe73351b19a'
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
