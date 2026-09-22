class Herdr < Formula
  desc "Agent multiplexer for your terminal (f5-sales-demo fork)"
  homepage "https://github.com/f5-sales-demo/herdr"
  version "0.17.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/herdr/releases/download/v#{version}/herdr-macos-aarch64", using: :nounzip
      sha256 "5f9f9e52db19755e85635f79e7bf328cfd823a872cea366f8a381b3a98081a7b"
    else
      url "https://github.com/f5-sales-demo/herdr/releases/download/v#{version}/herdr-macos-x86_64", using: :nounzip
      sha256 "fe1000b628a70439d8bae943cda8bb34a4df08ef381a68088a2da6b931015ed3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/herdr/releases/download/v#{version}/herdr-linux-aarch64", using: :nounzip
      sha256 "368b39be6e736070eff359f4e6a7c6db555cae4e038d46075b7aa275827005b6"
    else
      url "https://github.com/f5-sales-demo/herdr/releases/download/v#{version}/herdr-linux-x86_64", using: :nounzip
      sha256 "65b111c151b3aa975e22dc4d183e731027cadf77190fad224ad5f9f3e5f04675"
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
