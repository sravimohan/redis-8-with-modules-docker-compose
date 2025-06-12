FROM redis:8
COPY config/redis.conf /etc/redis/redis.conf
COPY config/redis.conf /etc/redis/redis-full.conf
CMD [ "redis-server", "/etc/redis/redis-full.conf" ]
