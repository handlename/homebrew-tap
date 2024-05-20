class Ssmwrap < Formula
  desc 'Exec command with environment variables loaded from AWS SSM.'
  version '2.1.0'
  homepage 'https://github.com/handlename/ssmwrap'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/handlename/ssmwrap/releases/download/v2.1.0/ssmwrap_2.1.0_darwin_arm64.tar.gz'
      sha256 '7f857eb6c91d23905ebf1affe4dfa7cb93c83bf4c5c36b39c29b4ffe77bf7950'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/ssmwrap/releases/download/v2.1.0/ssmwrap_2.1.0_darwin_amd64.tar.gz'
      sha256 '676d57191b314ca503e7ecefddcd635e500c158dec2c810f240b81eacb2decc4'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/handlename/ssmwrap/releases/download/v2.1.0/ssmwrap_2.1.0_linux_arm64.tar.gz'
      sha256 'e1379d1eda76e7bcc007fe751a0ea012abc0355cb30445024cb227d013da15cf'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/ssmwrap/releases/download/v2.1.0/ssmwrap_2.1.0_linux_amd64.tar.gz'
      sha256 '3d7c61f40a383f96b9d8ac2a7b41711ebff2923634248a356a8a4d09089d41b0'
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
