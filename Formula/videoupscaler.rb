class Videoupscaler < Formula
  desc "Official CLI for VideoUpscaler (https://videoupscaler.co) — AI video upscaling to 1080p, 2K, and 4K"
  homepage "https://videoupscaler.co"
  url "https://github.com/arkyu2077/videoupscaler-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "5996ec92fddaec768a9011a1e9cdac9f7bf7d555ee8a9d1dcc28d3fc349b2846"
  license "MIT"
  head "https://github.com/arkyu2077/videoupscaler-cli.git", branch: "main"

  depends_on "python@3.12"

  def install
    libexec.install "src/videoupscaler"
    python3 = Formula["python@3.12"].opt_bin/"python3.12"
    (bin/"videoupscaler").write <<~EOS
      #!/bin/bash
      export PYTHONPATH="#{libexec}${PYTHONPATH:+:$PYTHONPATH}"
      exec "#{python3}" -m videoupscaler "$@"
    EOS
    chmod 0755, bin/"videoupscaler"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/videoupscaler --version")
    assert_match "videoupscaler", shell_output("#{bin}/videoupscaler --help")
  end
end
