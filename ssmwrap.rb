class Ssmwrap < Formula
  desc 'Execute command with environment variables or/and files loaded from AWS SSM.'
  version '2.2.5'
  homepage 'https://github.com/handlename/ssmwrap'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/handlename/ssmwrap/releases/download/v2.2.5/ssmwrap_2.2.5_darwin_arm64.tar.gz'
      sha256 'b9029de3edc141dc794fdb7fc96e04ed1c459bd6aca11209e8d3bb1437fb4d01'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/ssmwrap/releases/download/v2.2.5/ssmwrap_2.2.5_darwin_amd64.tar.gz'
      sha256 '98cfe3f17fc6532fbd3d84b6d290a58b83a021a1760e87817f3b102b332411b9'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/handlename/ssmwrap/releases/download/v2.2.5/ssmwrap_2.2.5_linux_arm64.tar.gz'
      sha256 'cda1616c1b5b12db3db93a9dda5572bdd443233062aae479f0f7910587b1b343'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/ssmwrap/releases/download/v2.2.5/ssmwrap_2.2.5_linux_amd64.tar.gz'
      sha256 '6f32c17b7882aa6b76e23deb78d3102e1fe1c31ae6331cece759345d0b148dae'
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
