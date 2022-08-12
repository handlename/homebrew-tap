class Ssmwrap < Formula
  version '1.2.0'
  homepage 'https://github.com/handlename/ssmwrap'
  if OS.mac?
    url "https://github.com/handlename/ssmwrap/releases/download/v1.2.0/ssmwrap_v1.2.0_darwin_amd64.zip"
    sha256 '265759c96e9c18121d7c6658754a9dd7e6e81807667e9fd0aa82542519c26b12'
  end
  if OS.linux?
    url "https://github.com/handlename/ssmwrap/releases/download/v1.2.0/ssmwrap_v1.2.0_linux_amd64.tar.gz"
    sha256 'da014425d03028674de73af02f64ee4b50865645267d178b108e2b93d4e4089a'
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
