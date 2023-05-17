class ClashMeta < Formula
  desc "ClashMeta"
  homepage "https://github.com/MetaCubeX/Clash.Meta"
  url "https://github.com/MetaCubeX/Clash.Meta/releases/download/v1.14.4/clash.meta-darwin-arm64-v1.14.4.gz"
  sha256 "735fb8a2fda2eb9abde5d68cd3c79f6c9fa49abd9caf91326ea399afed0ad105"

  def install
    bin.install "clash.meta-darwin-arm64-v1.14.4" => "clash.meta"
  end

  service do
    run opt_bin/"clash.meta"
    keep_alive true
    error_log_path var/"log/clash.meta.log"
    log_path var/"log/clash.meta.log"
  end
end

