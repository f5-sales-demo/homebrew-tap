class Herdr < Formula
  desc "Agent multiplexer for your terminal (f5-sales-demo fork: resume args + xcsh agent)"
  homepage "https://github.com/f5-sales-demo/herdr"
  url "https://github.com/f5-sales-demo/herdr/archive/refs/tags/v0.7.5-xcsh2.tar.gz"
  sha256 "e724080aab0650e23acde7d46aaaaf1438f2c496c8c6d811da56cbca57e22a24"
  license "AGPL-3.0-or-later"
  version "0.7.5"
  revision 1

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
