class ClashMeta < Formula
  desc "ClashMeta"
  homepage "https://github.com/MetaCubeX/Clash.Meta"
  version "1.14.4"
  url "https://github.com/MetaCubeX/Clash.Meta/releases/download/v#{version}/clash.meta-darwin-arm64-v#{version}.gz"
  sha256 "735fb8a2fda2eb9abde5d68cd3c79f6c9fa49abd9caf91326ea399afed0ad105"

  def install
    system "gunzip", "-c", "clash.meta-darwin-arm64-v#{version}.gz" > "clash.meta-darwin-arm64-v#{version}"
    bin.install "clash.meta-darwin-arm64-v#{version}" => "clash.meta"
  end

  service do
    run opt_bin/"clash.meta"
    keep_alive true
    error_log_path var/"log/clash.meta.log"
    log_path var/"log/clash.meta.log"
  end
end

