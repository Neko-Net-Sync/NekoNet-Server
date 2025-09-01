# Mare Docker Services Management

This document provides instructions for monitoring and managing the Mare standalone Docker services.

## Prerequisites

- Docker and Docker Compose installed
- Access to the server at `/root/server/Docker/run`

## Service Architecture

The Mare standalone setup consists of four main services:
- `mare-auth` - Authentication service
- `mare-services` - Core services
- `mare-files` - File management service
- `mare-server` - Main server application

## Monitoring Services

### Monitor All Services
To monitor all Mare services simultaneously:

```bash
cd /root/server/Docker/run
docker compose -f compose/mare-standalone.yml -p standalone logs -f mare-auth mare-services mare-files mare-server
```

### Monitor Individual Services
To monitor each service separately:

```bash
cd /root/server/Docker/run

# Monitor authentication service
docker compose -f compose/mare-standalone.yml -p standalone logs -f mare-auth 

# Monitor core services
docker compose -f compose/mare-standalone.yml -p standalone logs -f mare-services 

# Monitor file management service
docker compose -f compose/mare-standalone.yml -p standalone logs -f mare-files 

# Monitor main server
docker compose -f compose/mare-standalone.yml -p standalone logs -f mare-server
```

## Container Management

### Rebuild Individual Containers
To rebuild and recreate specific containers without affecting dependencies:

```bash
# Rebuild authentication service
docker compose -f compose/mare-standalone.yml -p standalone up -d --no-deps --force-recreate mare-auth

# Rebuild core services
docker compose -f compose/mare-standalone.yml -p standalone up -d --no-deps --force-recreate mare-services

# Rebuild file management service
docker compose -f compose/mare-standalone.yml -p standalone up -d --no-deps --force-recreate mare-files

# Rebuild main server
docker compose -f compose/mare-standalone.yml -p standalone up -d --no-deps --force-recreate mare-server
```

### Rebuild All Containers
To recreate all containers at once:

```bash
cd /root/server/Docker/run
docker compose -f compose/mare-standalone.yml -p standalone up -d --no-deps --force-recreate
```

## Command Flags Explanation

- `-f compose/mare-standalone.yml` - Specifies the Docker Compose file
- `-p standalone` - Sets the project name to "standalone"
- `logs -f` - Shows logs and follows them in real-time
- `--no-deps` - Don't recreate services that this service depends on
- `--force-recreate` - Force recreation of containers even if configuration hasn't changed
- `-d` - Run containers in detached mode (in the background)

## Troubleshooting

### Check Service Status
```bash
cd /root/server/Docker/run
docker compose -f compose/mare-standalone.yml -p standalone ps
```

### Stop All Services
```bash
cd /root/server/Docker/run
docker compose -f compose/mare-standalone.yml -p standalone down
```

### Start All Services
```bash
cd /root/server/Docker/run
docker compose -f compose/mare-standalone.yml -p standalone up -d
```

## Quick Reference

| Action | Command |
|--------|---------|
| View all logs | `docker compose -f compose/mare-standalone.yml -p standalone logs -f mare-auth mare-services mare-files mare-server` |
| Rebuild all | `docker compose -f compose/mare-standalone.yml -p standalone up -d --no-deps --force-recreate` |
| Check status | `docker compose -f compose/mare-standalone.yml -p standalone ps` |
| Stop services | `docker compose -f compose/mare-standalone.yml -p standalone down` |
| Start services | `docker compose -f compose/mare-standalone.yml -p standalone up -d` |
