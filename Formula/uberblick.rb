class Uberblick < Formula
  desc "Local-first collaborative documents for people and agents"
  homepage "https://github.com/uberblick-ai/uberblick-2"
  url "https://github.com/uberblick-ai/homebrew-tap/releases/download/v0.4.17/uberblick-0.4.17.tar.gz"
  version "0.4.17"
  sha256 "1fc0f516f459acc6679f3fb178a0f5275d545119c348ce11663af6f9cfb04dde"
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
