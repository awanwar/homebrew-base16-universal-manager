class Base16UniversalManager < Formula
  desc "Set base16 themes for any supported application"
  homepage "https://github.com/pinpox/base16-universal-manager"
  url "https://github.com/pinpox/base16-universal-manager/archive/refs/tags/v1.0.tar.gz"
  sha256 "f61ef4b1726f0a4fc00c11d8773e8e9f070a78b65ab67f3301f9d4c259361243"
  license "MIT"
  head "https://github.com/pinpox/base16-universal-manager.git", branch: "master"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    path = buildpath/"src/github.com/pinpox/base16-universal-manager"
    path.install Dir["*"]
    cd path do
      system "go", "build", "-o", "#{bin}/base16-universal-manager"
    end
  end

  test do
    assert_match(/\d+.\d+.\d+/, shell_output("#{bin}/base16-universal-manager --version 2>&1"))
  end
end
