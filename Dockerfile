FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/zhangjiayin/caddy-geoip2 \
    --with github.com/caddy-dns/alidns \
    --with github.com/caddy-dns/acmedns

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy