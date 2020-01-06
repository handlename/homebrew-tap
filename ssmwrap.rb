class Ssmwrap < Formula
  version '1.0.2'
  homepage 'https://github.com/handlename/ssmwrap'
  url "https://github.com/handlename/ssmwrap/releases/download/v1.0.2/ssmwrap_v1.0.2_darwin_amd64.zip"
  sha256 'c15eaaa891d76e87c238e537efcfea2f61037d40f2443995b50398b7da0163de'
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
