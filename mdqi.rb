class Mdqi < Formula
  desc 'command line interface for mdq like mysql cli.'
  version '0.0.3'
  homepage 'https://github.com/handlename/mdqi'

  on_macos do
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/mdqi/releases/download/v0.0.3/mdqi-v0.0.3-darwin-amd64'
      sha256 'd1c36ea573eb65add734ed5927effb32af8d5f8cb21b27d38c58aeead86ca8a1'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/handlename/mdqi/releases/download/v0.0.3/mdqi-v0.0.3-linux-amd64'
      sha256 '290cb36857d0e0e2d3bd91494f276340151839ddbe05244428ba96ef7e44c827'
    end
  end

  head do
    url 'https://github.com/handlename/mdqi.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'mdqi'
  end
end
