class Uberblick < Formula
  desc "Local-first collaborative documents for people and agents"
  homepage "https://github.com/uberblick-ai/uberblick-2"
  url "https://github.com/uberblick-ai/homebrew-tap/releases/download/v0.4.18/uberblick-0.4.18.tar.gz"
  version "0.4.18"
  sha256 "061d857ad61024a92f1a23d4335f902a2cec1a511e3180390ba1150c3bc5eec6"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    inreplace libexec/"bin/ub", "#!/usr/bin/env node", "#!#{formula_opt_bin("node")}/node"
    bin.install_symlink libexec/"bin/ub"
    bin.install_symlink libexec/"bin/uberblick"
  end

  def caveats
    <<~EOS
      Uberblick keeps workspaces in ~/.local/share/uberblick and logins in ~/.config/uberblick.
      brew uninstall leaves them in place; run ub uninstall to remove Uberblick and choose whether to delete them.
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/ub --version").strip
    assert_equal version.to_s, shell_output("#{bin}/uberblick --version").strip
  end
end
