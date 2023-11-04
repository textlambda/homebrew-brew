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
    sha256 "ee58c23bc9c2172c2e11366d31ef4028e9a2d901408d9ceb73f53984363fc9fb"
  else
    if Hardware::CPU.arm?
      url "https://textlambda.com/download/tl-v1.0.0-macos-arm-64.zip"
      sha256 "7506e37fd86514be162a8da7b9932a39f143a9a529480278a55acfb426d83e77"
    else
      url "https://textlambda.com/download/tl-v1.0.0-macos-x86-64.zip"
      sha256 "fa49faa6fa7e64ffd6c6695713ef0b1d8533332a2d14698627721ec10cbc4773"
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
