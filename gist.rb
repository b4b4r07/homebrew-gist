class Gist < Formula
  homepage 'https://github.com/b4b4r07/gist'
  version '0.1.5'

  if Hardware::CPU.is_64_bit?
    url 'https://github.com/b4b4r07/gist/releases/download/0.1.5/gist-0.1.5-darwin-amd64.tar.gz'
    sha256 'ac1c67781b5283aba2694584da32dafdbed2bec33fdafc7c42bfd16481821fc6'
  else
    url 'https://github.com/b4b4r07/gist/releases/download/0.1.5/gist-0.1.5-darwin-386.tar.gz'
    sha256 '793d0e7df8790c64ea9f77e0ae8c7b5f09c2680edd02b56c95215d96c7b43379'
  end

  head do
    url 'https://github.com/b4b4r07/gist.git'
    depends_on 'go' => :build
    depends_on 'git' => :build
    depends_on 'mercurial' => :build
  end

  def install
    if build.head?
      ENV['GOPATH'] = buildpath/'.go'
      mkdir_p buildpath/'.go/src/github.com/b4b4r07'
      ln_s buildpath, buildpath/'.go/src/github.com/b4b4r07/gist'
      system 'make', 'build'
      bin.install 'bin/gist'
    else
      bin.install 'gist'
    end
  end

  test do
    system 'gist', '--version'
  end
end
