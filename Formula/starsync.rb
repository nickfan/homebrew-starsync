class Starsync < Formula
  desc "Local-first GitHub starred repository knowledge sync"
  homepage "https://github.com/nickfan/starsync"
  url "https://github.com/nickfan/starsync/releases/download/v0.1.0/starsync-v0.1.0-vendored-source.tar.gz"
  sha256 "915399d2e0b542b183f69cda920acd085bd884ffcf0090c5a6a161542b544a6f"
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
