class Tl < Formula
  desc "Text λ cli"
  homepage "https://textlambda.com"
  version "1.0.1"
  license ""

  depends_on "libsodium"
  depends_on "cdk"
  depends_on "sqlite"

  uses_from_macos "ncurses"

  on_linux do
    depends_on "ncurses"
  end

  if OS.linux?
    url "https://textlambda.com/download/tl-v1.0.1-linux-x86-64.zip"
    sha256 "6d6dc52d5822214ded679cb0ed43ad015ec7dcc9c268f4490921e15e1c5b6543"
  else
    if Hardware::CPU.arm?
      url "https://textlambda.com/download/tl-v1.0.1-macos-arm-64.zip"
      sha256 "f8990358ca3adb86b5d3f48094f172460373305187c9589029c81d1ec52eed10"
    else
      url "https://textlambda.com/download/tl-v1.0.1-macos-x86-64.zip"
      sha256 "254ce6d1086e5a0749c72a5a34b507f8eba0e9816682a1b920217d3bc734e555"
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
