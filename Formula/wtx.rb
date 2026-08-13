class Wtx < Formula
  desc "wtx microVMs with isolated Docker runtimes for parallel coding agents"
  homepage "https://github.com/rakutek/wtx"
  url "https://github.com/rakutek/wtx/releases/download/v0.12.0/wtx-0.12.0-aarch64-apple-darwin.tar.gz"
  sha256 "6afdbcd6363eebe383ba6964b14ebaffff589a9b93f4ed4d60d90144356c898b"
  license "MIT"

  depends_on "lima"
  depends_on :macos

  def install
    odie "wtx requires Apple Silicon" unless Hardware::CPU.arm?
    bin.install "wtx"
    generate_completions_from_executable(bin/"wtx", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wtx --version")
  end
end
