class Herdr < Formula
  desc "Agent multiplexer for your terminal (f5-sales-demo fork: per-agent resume args)"
  homepage "https://github.com/f5-sales-demo/herdr"
  url "https://github.com/f5-sales-demo/herdr/archive/refs/tags/v0.7.5-xcsh1.tar.gz"
  sha256 "4b14a1ff3465e4a72b00eb419785dab562be5e07203973d4d9cd519f4295a05e"
  license "AGPL-3.0-or-later"
  version "0.7.5"

  depends_on "rust" => :build
  depends_on "zig@0.15" => :build # upstream issue, https://github.com/ogulcancelik/herdr/issues/285

  def install
    ENV.prepend_path "PATH", formula_opt_bin("zig@0.15")
    system "cargo", "install", *std_cargo_args
    generate_completions_from_executable(bin/"herdr", "completion")
  end

  service do
    run [opt_bin/"herdr", "server"]
    keep_alive true
    log_path var/"log/herdr.log"
    error_log_path var/"log/herdr.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herdr --version")
  end
end
