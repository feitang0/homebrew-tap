class ClashMeta < Formula
  desc "ClashMeta"
  homepage "https://github.com/MetaCubeX/Clash.Meta"
  version "1.14.4"
  url "https://github.com/MetaCubeX/Clash.Meta/releases/download/v#{version}/clash.meta-darwin-arm64-v#{version}.gz"
  sha256 "735fb8a2fda2eb9abde5d68cd3c79f6c9fa49abd9caf91326ea399afed0ad105"

  def install
    bin.install Dir.glob("clash.meta*")[0] => "clash.meta"
  end

  def post_install
    (var/"log/clash.meta").mkpath
    chmod 0755, var/"log/clash.meta"
  end

  service do
    run opt_bin/"clash.meta"
    keep_alive true
    error_log_path var/"log/clash.meta.log"
    log_path var/"log/clash.meta.log"
  end

  test do
    system "#{bin}/clash.meta", "-h"
  end
end

