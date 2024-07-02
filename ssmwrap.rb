class Ssmwrap < Formula
  desc 'Execute command with environment variables or/and files loaded from AWS SSM.'
  version '2.2.0'
  homepage 'https://github.com/handlename/ssmwrap'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/handlename/ssmwrap/releases/download/v2.2.0/ssmwrap_2.2.0_darwin_arm64.tar.gz'
      sha256 'ff46c74a773dca234217abab237e8945dbbdad41418b520fec0dcbed25ac79d3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/ssmwrap/releases/download/v2.2.0/ssmwrap_2.2.0_darwin_amd64.tar.gz'
      sha256 '3bc21e33abd2e6ea4c631de2f3520fccb4813cc2a2a223b5c030f17ace579193'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/handlename/ssmwrap/releases/download/v2.2.0/ssmwrap_2.2.0_linux_arm64.tar.gz'
      sha256 'a9717422da51ce262c9ddd6543c480f76f58cfb99e66a2d30377516f36e79dfd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/ssmwrap/releases/download/v2.2.0/ssmwrap_2.2.0_linux_amd64.tar.gz'
      sha256 'bce235287302c18a0c58a38fde7b793d2a183cccfe87ff35c7a55eefc79a5386'
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
