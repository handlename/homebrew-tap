class Reviewer < Formula
  version '0.0.3'
  homepage 'https://github.com/handlename/reviewer'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/handlename/reviewer/releases/download/v0.0.3/reviewer_0.0.3_darwin_arm64.tar.gz'
      sha256 '162066e08077a8055e3f0cb9aa60fec43f0737595a410b5b35387cc3590a7b73'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/reviewer/releases/download/v0.0.3/reviewer_0.0.3_darwin_amd64.tar.gz'
      sha256 '7f0acd007d3fba2d091e16deeabc3ee8a217a1fa4a2e0c9663af28ac3f942411'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/handlename/reviewer/releases/download/v0.0.3/reviewer_0.0.3_linux_arm64.tar.gz'
      sha256 '604be2e8bbb7be6bc88059b43c9ab3aa0e926723123f5a0c7526911357a80792'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/reviewer/releases/download/v0.0.3/reviewer_0.0.3_linux_amd64.tar.gz'
      sha256 '957699f8c5e45c75e531f0e9b669ebfcbc70825f1b24daf6d1ed773b43979ff0'
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
