class Herdr < Formula
  desc "Agent multiplexer for your terminal (f5-sales-demo fork)"
  homepage "https://github.com/f5-sales-demo/herdr"
  version "0.16.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/herdr/releases/download/v#{version}/herdr-macos-aarch64", using: :nounzip
      sha256 "f21919e2f6456b8b1c1ed42add0f042559ac293405c07412615955db6ce42232"
    else
      url "https://github.com/f5-sales-demo/herdr/releases/download/v#{version}/herdr-macos-x86_64", using: :nounzip
      sha256 "e46d3e92f730f59fd4a46050cf64e961f90f5e6b30d6b62deb2b030ba866ea87"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/herdr/releases/download/v#{version}/herdr-linux-aarch64", using: :nounzip
      sha256 "13c45a3b404e96cb05cf839cac63208191efc134a3e339490d88b3efa78fc443"
    else
      url "https://github.com/f5-sales-demo/herdr/releases/download/v#{version}/herdr-linux-x86_64", using: :nounzip
      sha256 "927dbff4c1aa1995f1ed43955ad12b454ea08f64860e47b2fe0319d1512ab3ad"
    end
  end

  def install
    bin.install Dir["herdr-*"].fetch(0) => "herdr"
    (bin/"herdr").chmod 0755
    generate_completions_from_executable(bin/"herdr", "completion")
  end

  service do
    run [opt_bin/"herdr", "server"]
    keep_alive true
    log_path var/"log/herdr.log"
    error_log_path var/"log/herdr.log"
  end

  test do
    assert_match "herdr #{version}", shell_output("#{bin}/herdr --version")
  end
end
