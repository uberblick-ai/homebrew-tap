class UbAgents < Formula
  include Language::Python::Virtualenv

  desc "Run coding agents in a GitHub-driven engineering loop"
  homepage "https://github.com/uberblick-ai/ub-agents"
  url "https://github.com/uberblick-ai/ub-agents/archive/a2aeb5f1a4da63b6d97e572c4d2eaf5d2a949658.tar.gz"
  version "0.1.10"
  revision 1
  sha256 "e8b6bea5c6c623773ad43088e0538949dd9219ff203aa9713454fe74900bbd88"
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
    venv = virtualenv_create(libexec, Formula["python@3.14"].opt_bin/"python3.14")
    venv.pip_install resources
    venv.pip_install buildpath
    # Export only the base command; the opt-in package owns the view entrypoint.
    bin.install_symlink libexec/"bin/ub-agents"
  end

  test do
    assert_match "ub-agents #{version}", shell_output("#{bin}/ub-agents --version")
    system bin/"ub-agents", "init", "--repository", "example/project"
    assert_match "Valid configuration: example/project", shell_output("#{bin}/ub-agents check")
  end
end
