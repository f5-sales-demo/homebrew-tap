class Herdr < Formula
  desc "Agent multiplexer for your terminal (f5-sales-demo fork)"
  homepage "https://github.com/f5-sales-demo/herdr"
  version "0.15.7"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/herdr/releases/download/v#{version}/herdr-macos-aarch64", using: :nounzip
      sha256 "89ce889fa1d6bf043e876c9979086a3cd98d470c83f7a33584dc84c70df0a744"
    else
      url "https://github.com/f5-sales-demo/herdr/releases/download/v#{version}/herdr-macos-x86_64", using: :nounzip
      sha256 "900ac4bac1c66d252372449cae79b834b32f7cf7fcc173b2373b51434a3b3419"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/herdr/releases/download/v#{version}/herdr-linux-aarch64", using: :nounzip
      sha256 "c777cdfe03db3a9914d3706fcf7d3b42548aaddc0746bb04f93d316c5350b433"
    else
      url "https://github.com/f5-sales-demo/herdr/releases/download/v#{version}/herdr-linux-x86_64", using: :nounzip
      sha256 "f327d536f922e1b074f89577ee3946e6032619d839547fab02237ca39d802687"
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
