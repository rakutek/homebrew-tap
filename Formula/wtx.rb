class Wtx < Formula
  desc "Per-worktree microVMs with isolated Docker runtimes for parallel coding agents"
  homepage "https://github.com/rakutek/wtx"
  url "https://github.com/rakutek/wtx/releases/download/v0.11.0/wtx-0.11.0-aarch64-apple-darwin.tar.gz"
  sha256 "e3edf9f706cdd8c7c2461f5371e204666d666e5754d4f7af787cce66cf87d495"
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
