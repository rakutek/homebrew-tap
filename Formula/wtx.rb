class Wtx < Formula
  desc "Per-worktree microVMs with isolated Docker runtimes for parallel coding agents"
  homepage "https://github.com/rakutek/wtx"
  url "https://github.com/rakutek/wtx/releases/download/v0.11.1/wtx-0.11.1-aarch64-apple-darwin.tar.gz"
  sha256 "c92a74475df5db632e571a4619bb642be3ad2ffc63218906e2f0c42dd2f58413"
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
