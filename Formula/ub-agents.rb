class UbAgents < Formula
  include Language::Python::Virtualenv

  desc "Run coding agents in a GitHub-driven engineering loop"
  homepage "https://github.com/uberblick-ai/ub-agents"
  url "https://github.com/uberblick-ai/ub-agents/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "ff868c70289323e89602b71ee0d5f0828116007bd7901c6ea3ffbb44a7c9a03e"
  license "MIT"
  head "https://github.com/uberblick-ai/ub-agents.git", branch: "main"

  depends_on "gh"
  depends_on "libyaml"
  depends_on "python@3.14"

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2/pyyaml-6.0.3.tar.gz"
    sha256 "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "ub-agent #{version}", shell_output("#{bin}/ub-agent --version")
    system bin/"ub-agent", "init", "--repository", "example/project"
    assert_match "Valid configuration: example/project", shell_output("#{bin}/ub-agent check")
  end
end
