FROM --platform=$BUILDPLATFORM composer as download

ADD . /cs-fix
WORKDIR /cs-fix
RUN composer install --no-dev --no-interaction --no-progress --no-suggest --optimize-autoloader
RUN echo 'memory_limit = -1' > /php.ini

FROM scratch

LABEL org.opencontainers.image.authors="FriendsOfShopware" \
      org.opencontainers.image.url="https://github.com/FriendsOfShopware/code-style" \
      org.opencontainers.image.source="https://github.com/FriendsOfShopware/code-style" \
      org.opencontainers.image.vendor="FriendsOfShopware" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.title="PHP-CS-Fixer"
COPY rootfs/ /

COPY --from=download /cs-fix /cs-fix
COPY --from=download /php.ini /etc/php/8.2/cli/conf.d/99-memory-limit.ini
ENTRYPOINT ["/usr/bin/php", "/cs-fix/bin/frosh-cs", "fix"]