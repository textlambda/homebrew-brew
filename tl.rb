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
    sha256 "4f589366310f3ee834912a0a86b0fff852e80fc653224b9df31e64fb1871207d"
  else
    if Hardware::CPU.arm?
      url "https://textlambda.com/download/tl-v1.0.0-macos-arm-64.zip"
      sha256 "a1450e8f3948a93b515400e813db5954120b700063654d5ffa8f11087d24b696"
    else
      url "https://textlambda.com/download/tl-v1.0.0-macos-x86-64.zip"
      sha256 "dd5209413a3dcc7a84cd87295c36453c66a94022537fe76f77a411a352f5def6"
    end
  end

  def install
    bin.install "tl"

    if OS.linux?
      prefix.install "libtltui.so"
    else
      prefix.install "libtltui.dylib"
    end
  end

  test do
    system "#{bin}/tl version"
  end
end
