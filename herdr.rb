class Herdr < Formula
  desc "Agent multiplexer for your terminal (f5-sales-demo fork)"
  homepage "https://github.com/f5-sales-demo/herdr"
  version "0.20.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/herdr/releases/download/v#{version}/herdr-macos-aarch64", using: :nounzip
      sha256 "11802deaf1289fe9dc0fb96b11715fce836500d0749b98503f4e04b7cad05dd2"
    else
      url "https://github.com/f5-sales-demo/herdr/releases/download/v#{version}/herdr-macos-x86_64", using: :nounzip
      sha256 "df3ac73e07bef1823eaa6f15efd5a525e1b3cc0d829fabb670a841da024bf09f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/herdr/releases/download/v#{version}/herdr-linux-aarch64", using: :nounzip
      sha256 "0d1053eff1280aae9bb2fd96c53ca407872cc675ea24c7b4735c7f591ba14af0"
    else
      url "https://github.com/f5-sales-demo/herdr/releases/download/v#{version}/herdr-linux-x86_64", using: :nounzip
      sha256 "f032161571e9e94f3bb5335aeff33cc21a09ad05e6d92955affdc64b11305b12"
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
