# Redis 8 Docker Setup

A Docker Compose setup for Redis 8 (including Modules) with RedisInsight for development and experimentation.

## Overview

This project provides a complete Redis 8 environment with:

- Redis 8 server with persistence and modules
- RedisInsight for visual database management
- Host networking for easy local development
- Persistent data storage

## Features

- **Redis 8**: Latest Redis version with advanced features
- **Redis Modules**: Pre-loaded with RedisBloom and RediSearch modules
- **RedisInsight**: Web-based Redis GUI for database management
- **Persistence**: Data persistence with AOF (Append Only File)
- **Host Networking**: Direct access via localhost
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
- **Access**: `localhost:6379`
- **Password**: Set via environment variable

### RedisInsight

- **Container**: `redisinsight`
- **Image**: `redislabs/redisinsight:latest`
- **Port**: `8001` (default)
- **Access**: `http://localhost:8001`

## Configuration

### Redis Configuration

The Redis server uses a custom configuration file located at `config/redis.conf`. Key settings include:

- Append-only file persistence enabled
- Password authentication (if configured)
- RedisBloom and RediSearch modules loaded

### Environment Variables

- `REDIS_PASSWORD`: Sets the password for the default Redis user (optional)

### Using RedisInsight

1. Open `http://localhost:8001` in your browser
2. Add a new database connection:
   - **Host**: `localhost`
   - **Port**: `6379`
   - **Password**: Enter your password if configured

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

This setup includes the following Redis modules:

- **RediSearch**: Full-text search and secondary indexing.
- **RedisJSON**: Native JSON data type support for storing, indexing, and querying JSON documents.
- **RedisBloom**: Probabilistic data structures for scalable set membership, counting, and top-k queries.
- **RedisTimeSeries**: Time series data management, including ingestion, querying, and aggregation.

## Data Persistence

- **AOF (Append Only File)**: Enabled for durability
- **Data Directory**: `./data/` (mounted as volume)
- **Logs Directory**: `./logs/` (mounted as volume)

## Troubleshooting

### Cannot Connect to Redis

1. Check if containers are running: `docker-compose ps`
2. Check Redis logs: `docker-compose logs redis`
3. Verify port 6379 is not used by another service
4. Ensure password is correct if authentication is enabled

### RedisInsight Not Accessible

1. Check if container is running: `docker-compose ps`
2. Check RedisInsight logs: `docker-compose logs redisinsight`
3. Try accessing `http://localhost:8001`
4. Verify port 8001 is not used by another service

### Permission Issues

- Ensure Docker has permission to mount volumes
- Check that the `data/` and `logs/` directories are writable

## License

See the [LICENSE](LICENSE) file for details.

## Contributing

Feel free to submit issues and pull requests to improve this setup.
