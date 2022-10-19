class Ssmwrap < Formula
  version '1.2.1'
  homepage 'https://github.com/handlename/ssmwrap'
  if OS.mac?
    url "https://github.com/handlename/ssmwrap/releases/download/v1.2.1/ssmwrap_v1.2.1_darwin_amd64.zip"
    sha256 '2644d40f21d9ca62b49ec128a6e6f242d3183fe93bcafb5e440c2d72d38a363c'
  end
  if OS.linux?
    url "https://github.com/handlename/ssmwrap/releases/download/v1.2.1/ssmwrap_v1.2.1_linux_amd64.tar.gz"
    sha256 '65f38e8ba154e438eee960f8fabbfbaccdb7d82d42d8f7015f6b4eb7c7f11b39'
  end
  head 'https://github.com/handlename/ssmwrap.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'ssmwrap'
  end
end
