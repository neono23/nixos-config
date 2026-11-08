{pkgs, ...}:
{
networking.networkmanager.dns = "systemd-resolved";

services.resolved = {
  enable = true;
  settings.Resolve = {
    DNS = [
      "94.140.14.15#family.adguard-dns.com"
      "94.140.15.16#family.adguard-dns.com"
      "2a10:50c0::bad1:ff#family.adguard-dns.com"
      "2a10:50c0::bad2:ff#family.adguard-dns.com"
    ];
    DNSOverTLS = "true";
    Domains = [ "~." ];
    FallbackDNS = [ "" ];
  };
};
}
