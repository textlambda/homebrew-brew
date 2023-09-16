class Tl < Formula
  desc "Text λ cli"
  homepage "https://textlambda.com"
  version "1.0.0"
  license ""

  depends_on "libsodium"
  depends_on "cdk"
  depends_on "sqlite"

  uses_from_macos "ncurses"

  on_linux do
    depends_on "ncurses"
  end

  if OS.linux?
    url "https://textlambda.com/download/tl-v1.0.0-linux-x86-64.zip"
    sha256 "5c2b1a79aefc5865505868b8cf2fb9680e04d49693fee13c74cc455a80a2d851"
  else
    if Hardware::CPU.arm?
      url "https://textlambda.com/download/tl-v1.0.0-macos-arm-64.zip"
      sha256 "3a32eb2a928e51d5b5e34091efc79628c8ca2f713249a3cb306a46d4f85eefed"
    else
      url "https://textlambda.com/download/tl-v1.0.0-macos-x86-64.zip"
      sha256 "3200f37488ed63d66cb1ebe2a9641f0bf725159962e93e575357dcee52bfca92"
    end
  end

  def install
    bin.install "tl"

    if OS.linux?
      lib.install "libtltui.so"
    else
      lib.install "libtltui.dylib"
    end
  end

  test do
    system "#{bin}/tl version"
  end
end
