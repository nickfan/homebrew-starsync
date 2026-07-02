class Starsync < Formula
  desc "Local-first GitHub starred repository knowledge sync"
  homepage "https://github.com/nickfan/starsync"
  url "https://github.com/nickfan/starsync/releases/download/v0.1.2/starsync-v0.1.2-vendored-source.tar.gz"
  sha256 "51b5742d395977d490eb99744a9a149032bfb0ec40b8876d1568a37feac03335"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--offline", "--path", ".", "--root", prefix
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/starsync --version")
    assert_match "Local-first", shell_output("#{bin}/starsync --help")
  end
end
