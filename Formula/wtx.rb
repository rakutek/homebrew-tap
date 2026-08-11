class Wtx < Formula
  desc "Per-worktree microVMs with isolated Docker runtimes for parallel coding agents"
  homepage "https://github.com/rakutek/wtx"
  url "https://github.com/rakutek/wtx/releases/download/v0.10.0/wtx-0.10.0-aarch64-apple-darwin.tar.gz"
  sha256 "51a23e78d37197d76127c73893e0b15951e7e5b111c39242563b6b7e9f33692f"
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
