class Ssmwrap < Formula
  desc 'Execute command with environment variables or/and files loaded from AWS SSM.'
  version '2.2.2'
  homepage 'https://github.com/handlename/ssmwrap'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/handlename/ssmwrap/releases/download/v2.2.2/ssmwrap_2.2.2_darwin_arm64.tar.gz'
      sha256 '3056b15a9d45bf9411b8a0fc2cef445a98978131dd0c7a248db8314bc2eea9ef'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/ssmwrap/releases/download/v2.2.2/ssmwrap_2.2.2_darwin_amd64.tar.gz'
      sha256 '8f06fd1a949b7093684f846cca1669d1188a6993a466116f344cda6d5864b496'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/handlename/ssmwrap/releases/download/v2.2.2/ssmwrap_2.2.2_linux_arm64.tar.gz'
      sha256 '3fc1aac9ad14ff2e4506673c7fc7a3e079c6d6d52997a02ada5eea1d834055f6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/ssmwrap/releases/download/v2.2.2/ssmwrap_2.2.2_linux_amd64.tar.gz'
      sha256 'ef8296a763828e8abb7ccb98644c9d2bb91590237d8ae350df86baa935a165ce'
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
