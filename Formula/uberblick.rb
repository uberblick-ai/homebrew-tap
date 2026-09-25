class Uberblick < Formula
  desc "Local-first collaborative documents for people and agents"
  homepage "https://github.com/uberblick-ai/uberblick-2"
  url "https://github.com/uberblick-ai/homebrew-tap/releases/download/v0.1.1/uberblick-0.1.1.tar.gz"
  version "0.1.1"
  sha256 "0208caeff7a9bf48e3ee4b331a2e45f494c96d41521d167935528e59b1bffa35"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    inreplace libexec/"bin/ub", "#!/usr/bin/env node", "#!#{formula_opt_bin("node")}/node"
    bin.install_symlink libexec/"bin/ub"
    bin.install_symlink libexec/"bin/uberblick"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/ub --version").strip
    assert_equal version.to_s, shell_output("#{bin}/uberblick --version").strip
  end
end
