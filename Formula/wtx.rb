class Wtx < Formula
  desc "One Lima microVM with a dedicated dockerd per git worktree"
  homepage "https://github.com/rakutek/wtx"
  url "https://github.com/rakutek/wtx/releases/download/v0.6.0/wtx-0.6.0-aarch64-apple-darwin.tar.gz"
  version "0.6.0"
  sha256 "7953111ff691e01efa7cfb0a816fe5983f0d3b58c6d86130bdb5a99f20df8136"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on :macos
  depends_on "lima"

  def install
    odie "wtx requires Apple Silicon" unless Hardware::CPU.arm?
    bin.install "wtx"
    generate_completions_from_executable(bin/"wtx", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wtx --version")
  end
end
