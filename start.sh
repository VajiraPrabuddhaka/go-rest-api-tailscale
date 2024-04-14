#!/bin/sh

echo "before tailscaled"
/app/tailscaled --tun=userspace-networking --socks5-server=localhost:1055 --outbound-http-proxy-listen=localhost:1055 & /app/tailscale up --authkey=$TS_AUTH_KEY
echo "after tailscale up"
ALL_PROXY=socks5://localhost:1055/ HTTP_PROXY=http://localhost:1055/ http_proxy=http://localhost:1055/ /go/bin/app

# Go service is started after tailscale is up
