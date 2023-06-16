class ClashMeta < Formula
  desc "ClashMeta"
  homepage "https://github.com/MetaCubeX/Clash.Meta"
  version "1.14.5"
  url "https://github.com/MetaCubeX/Clash.Meta/releases/download/v#{version}/clash.meta-darwin-arm64-v#{version}.gz"
  sha256 "3925a11a94408eb390321c5c907878f03f5c690d41f22318d3bdd96bd4dc402d"

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

