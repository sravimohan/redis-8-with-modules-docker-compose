# Redis 8 Docker Setup

A Docker Compose setup for Redis 8 (including Modules) with RedisInsight for development and experimentation.

## Overview

This project provides a complete Redis 8 environment with:

- Redis 8 server with persistence and modules
- RedisInsight for visual database management
- Volume-based configuration
- Persistent data storage

## Features

- **Redis 8**: Latest Redis version with advanced features
- **Redis Modules**: Pre-loaded with RedisBloom, RediSearch, RedisJSON, and RedisTimeSeries modules
- **RedisInsight**: Web-based Redis GUI for database management with auto-configured connection
- **Persistence**: Data persistence with AOF (Append Only File)
- **Volume Mounts**: Persistent data, logs, and configuration

## Prerequisites

- Docker
- Docker Compose

## Quick Start

1. Clone or download this project
2. Navigate to the project directory
3. Start the services:

```pwsh
docker-compose up -d
```

## Services

### Redis Server

- **Container**: `redis-server`
- **Image**: `redis:8`
- **Port**: `6379`
- **Access**: `redis://redis:6379` (from RedisInsight) or `redis://localhost:6379` (from host)
- **Configuration**: Uses `redis.conf` mounted from `./redis.conf`

### RedisInsight

- **Container**: `redisinsight`
- **Image**: `redislabs/redisinsight:latest`
- **Port**: `5540`
- **Access**: `http://localhost:5540`
- **Auto-configured**: Automatically connects to Redis server

### Using RedisInsight

RedisInsight should automatically connect to your Redis server when you open `http://localhost:5540`. If you need to manually add a connection:

1. Open `http://localhost:5540` in your browser
2. Add a new database connection:
   - **Host**: `redis-server` (container name for connecting from redis insight) or `localhost` (from host)
   - **Port**: `6379`
   - **Username**: `default` (or leave empty)
   - **Password**: Leave empty (unless configured)

## Managing the Stack

### Start Services

```pwsh
docker-compose up -d
```

### Stop Services

```pwsh
docker-compose down
```

### Restart Services

```pwsh
docker-compose restart
```

## Redis Modules

This setup includes the following Redis modules (built into Redis 8):

- **RedisBloom**: Probabilistic data structures for scalable set membership, counting, and top-k queries
- **RediSearch**: Full-text search and secondary indexing
- **RedisJSON**: Native JSON data type support for storing, indexing, and querying JSON documents
- **RedisTimeSeries**: Time series data management, including ingestion, querying, and aggregation
- **VectorSet**: Vector similarity search capabilities

## Troubleshooting

### Cannot Connect to Redis

1. Check if containers are running: `docker-compose ps`
2. Check Redis logs: `docker-compose logs redis`
3. Verify port 6379 is not used by another service
4. Ensure password is correct if authentication is enabled

### RedisInsight Not Accessible

1. Check if container is running: `docker-compose ps`
2. Check RedisInsight logs: `docker-compose logs redisinsight`
3. Try accessing `http://localhost:5540`
4. Verify port 5540 is not used by another service

### Permission Issues

- Ensure Docker has permission to mount volumes
- Check that the `data/` and `logs/` directories are writable

## License

See the [LICENSE](MIT LICENSE) file for details.

## Contributing

Feel free to submit issues and pull requests to improve this setup.
