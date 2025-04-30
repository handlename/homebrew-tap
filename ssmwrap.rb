class Ssmwrap < Formula
  desc 'Execute command with environment variables or/and files loaded from AWS SSM.'
  version '2.2.3'
  homepage 'https://github.com/handlename/ssmwrap'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/handlename/ssmwrap/releases/download/v2.2.3/ssmwrap_2.2.3_darwin_arm64.tar.gz'
      sha256 '7702121822dcffa5b5878a4691891e092b962c9182ac35e544d8e29e6c417591'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/ssmwrap/releases/download/v2.2.3/ssmwrap_2.2.3_darwin_amd64.tar.gz'
      sha256 'd4c835887d12a93dfce92c95150d9e9db2fdf810f4aa180fc3c36700642fbed0'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/handlename/ssmwrap/releases/download/v2.2.3/ssmwrap_2.2.3_linux_arm64.tar.gz'
      sha256 'b84a668774696f22ef8f4aafabbf97afc309334a5b7847588633e4ae3c3ee28f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/ssmwrap/releases/download/v2.2.3/ssmwrap_2.2.3_linux_amd64.tar.gz'
      sha256 '3d0602498028285d116a0a835271c47de08403e65a0bc220367c42bf9b121bba'
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
