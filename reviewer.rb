class Reviewer < Formula
  version '0.3.0'
  homepage 'https://github.com/handlename/reviewer'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/handlename/reviewer/releases/download/v0.3.0/reviewer_0.3.0_darwin_arm64.tar.gz'
      sha256 'ee8b085b1c65b898854628e0b159f63d6eeb90f9350f41399e7f9603ba08a679'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/reviewer/releases/download/v0.3.0/reviewer_0.3.0_darwin_amd64.tar.gz'
      sha256 '5df766389d16a381bcbc5afdd93440a5c10e1851154b422463a8db473e92ec7b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/handlename/reviewer/releases/download/v0.3.0/reviewer_0.3.0_linux_arm64.tar.gz'
      sha256 'ba4abc35fd76132c94820eee563c822eda985a79f48635fe3d9827d98bffe727'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/reviewer/releases/download/v0.3.0/reviewer_0.3.0_linux_amd64.tar.gz'
      sha256 '29096084682bfa321b303922d3a3b2451df0d7c813476af1e4176df0302084be'
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
