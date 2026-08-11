class Wtx < Formula
  desc "Per-worktree microVMs with isolated Docker runtimes for parallel coding agents"
  homepage "https://github.com/rakutek/wtx"
  url "https://github.com/rakutek/wtx/releases/download/v0.9.0/wtx-0.9.0-aarch64-apple-darwin.tar.gz"
  sha256 "cf1e64048109cae2b8745872ce2166e84bbea452e0b1ff90b748bd8108647cce"
  license any_of: ["MIT", "Apache-2.0"]

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
