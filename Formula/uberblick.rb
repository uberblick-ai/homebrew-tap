class Uberblick < Formula
  desc "Local-first collaborative documents for people and agents"
  homepage "https://github.com/uberblick-ai/uberblick-2"
  url "https://github.com/uberblick-ai/homebrew-tap/releases/download/v0.4.9/uberblick-0.4.9.tar.gz"
  version "0.4.9"
  sha256 "009ff76d601d50232476cea926453cdfd588ec1c05abae711636fe97259014d7"
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
