class Starsync < Formula
  desc "Local-first GitHub starred repository knowledge sync"
  homepage "https://github.com/nickfan/starsync"
  url "https://github.com/nickfan/starsync/releases/download/v0.1.1/starsync-v0.1.1-vendored-source.tar.gz"
  sha256 "d4aecb03f3d239882d07a4748ee44e54d15d41749651782dd6746bec66398180"
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
