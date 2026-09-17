class Herdr < Formula
  desc "Agent multiplexer for your terminal (f5-sales-demo fork)"
  homepage "https://github.com/f5-sales-demo/herdr"
  version "0.16.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/herdr/releases/download/v#{version}/herdr-macos-aarch64", using: :nounzip
      sha256 "04db973fa25bd188fad4e94da4de867cbf2d4d272970f2a517f8c04b9b7a06af"
    else
      url "https://github.com/f5-sales-demo/herdr/releases/download/v#{version}/herdr-macos-x86_64", using: :nounzip
      sha256 "814117efc0a06074b20ec2a966f8df90421d4d1db045b0727ea12f35fe46a104"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/f5-sales-demo/herdr/releases/download/v#{version}/herdr-linux-aarch64", using: :nounzip
      sha256 "a41bf1b7a02dd5d46aae622edfb6435a7109762e80436263687835562244dfb5"
    else
      url "https://github.com/f5-sales-demo/herdr/releases/download/v#{version}/herdr-linux-x86_64", using: :nounzip
      sha256 "e73b6c16c9ae36848e0d3047e016202cafc8213a89acbc38d58c7e2e3ed4d3c7"
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
