#!/bin/sh
set -e

# env vars are injected by docker-compose (env_file: .env)
: "${VPN_USER:?VPN_USER missing}"
: "${VPN_PASS:?VPN_PASS missing}"
: "${MFA_SECRET:?MFA_SECRET missing}"

CODE=$(oathtool -b --totp "$MFA_SECRET")

tinyproxy -c /etc/tinyproxy/tinyproxy.conf

exec openconnect --protocol=anyconnect --useragent=AnyConnect \
  --form-entry "main:username=$VPN_USER" \
  --form-entry "main:password=$VPN_PASS" \
  --form-entry "challenge:answer=$CODE" \
  --non-inter \
  vpn.epfl.ch
