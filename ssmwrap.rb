class Ssmwrap < Formula
  desc 'Execute command with environment variables or/and files loaded from AWS SSM.'
  version '2.2.4'
  homepage 'https://github.com/handlename/ssmwrap'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/handlename/ssmwrap/releases/download/v2.2.4/ssmwrap_2.2.4_darwin_arm64.tar.gz'
      sha256 'dcd567640c7bd563b5a25442baed1bf35974132803e5dfe3fec02205bdf5c6ec'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/ssmwrap/releases/download/v2.2.4/ssmwrap_2.2.4_darwin_amd64.tar.gz'
      sha256 'd43f0a857817ac66d8c2f0d861944d20ee04c8995f8e4143919041f7a05fa8b1'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/handlename/ssmwrap/releases/download/v2.2.4/ssmwrap_2.2.4_linux_arm64.tar.gz'
      sha256 '69b63cc36a1b68e4cfd28d5896cface1e287653962bb6484dc553bc9cd2b7ed6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/ssmwrap/releases/download/v2.2.4/ssmwrap_2.2.4_linux_amd64.tar.gz'
      sha256 '90b2e5e2755ca304d45f995ba86e1b0a2cb0c0afdc225e35cf0503ebcae81a92'
    end
  end

  head do
    url 'https://github.com/handlename/ssmwrap.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'ssmwrap'
  end
end
