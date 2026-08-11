class Wtx < Formula
  desc "One Lima microVM with a dedicated dockerd per git worktree"
  homepage "https://github.com/rakutek/wtx"
  url "https://github.com/rakutek/wtx/releases/download/v0.7.0/wtx-0.7.0-aarch64-apple-darwin.tar.gz"
  sha256 "d24188eadccccccbca470060a29696defaceab06d4fe1c474fe76d81bba0cd50"
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
