class Mdqi < Formula
  version '0.0.3'
  homepage 'https://github.com/handlename/mdqi'
  url "https://github.com/handlename/mdqi/releases/download/v0.0.3/mdqi-v0.0.3-darwin-amd64"
  sha256 'd1c36ea573eb65add734ed5927effb32af8d5f8cb21b27d38c58aeead86ca8a1'
  head 'https://github.com/handlename/mdqi.git'

  head do
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'mdqi'
  end
end
