class Gist < Formula
  homepage 'https://github.com/b4b4r07/gist'
  version '0.1.5'

  if Hardware::CPU.is_64_bit?
    url 'https://github.com/b4b4r07/gist/releases/download/0.1.5/darwin_amd64_gist'
    sha256 'bf3a57b076ca79c16a6ba1838f4633521292fd6531ce29b3bf87f77baff33470'
  else
    url 'https://github.com/b4b4r07/gist/releases/download/0.1.5/darwin_amd64_gist'
    sha256 'bf3a57b076ca79c16a6ba1838f4633521292fd6531ce29b3bf87f77baff33470'
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
      bin.install 'build/gist'
    else
      bin.install 'gist'
    end
  end

  test do
    system 'gist', '--version'
  end
end
