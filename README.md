# Calibre-Web Docker Image

[![Docker Pulls](https://img.shields.io/docker/pulls/datahearth/calibre-web)](https://hub.docker.com/r/datahearth/calibre-web)
[![Docker Image Size](https://img.shields.io/docker/image-size/datahearth/calibre-web/latest)](https://hub.docker.com/r/datahearth/calibre-web)
[![Docker Image Version](https://img.shields.io/docker/v/datahearth/calibre-web/latest)](https://hub.docker.com/r/datahearth/calibre-web)

This repository contains the Dockerfile and related resources to build and deploy a Docker image for Calibre-Web, a web app providing a clean interface for browsing, reading and downloading eBooks using an existing Calibre database.

## Features

- Based on the official Calibre-Web release
- Includes Calibre binary for metadata extraction and eBook conversion
- ImageMagick integration for image processing
- Automated builds triggered by new Calibre-Web releases

## Quick Start

```bash
docker run -d \
  --name calibre-web \
  -p 8083:8083 \
  -v /path/to/calibre/library:/books \
  -v /path/to/config:/config \
  datahearth/calibre-web:latest
```

### Environment variables

| Variable | Default | Description |
|----------|---------|-------------|
| `PUID` | `1000` | User ID for file permissions |
| `PGID` | `1000` | Group ID for file permissions |
| `TZ` | `UTC` | Timezone setting |

### Volumes

| Path | Description |
|------|-------------|
| `/books` | Location of your Calibre library |
| `/config` | Configuration files and database |

## Building Locally

```bash
docker build -t calibre-web .
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## Automatic Updates

This image is automatically rebuilt when:
- A new version of Calibre-Web is released

## Technical Details

- Base Image: python:3-slim (Bookworm)
- Calibre-Web Version: `0.6.24`
- Exposed Port: 8083
- Required Dependencies:
  - Calibre
  - ImageMagick
  - Python 3

## Support

- [Issue Tracker](https://github.com/yourusername/calibre-web-docker/issues)
- [Docker Hub](https://hub.docker.com/r/datahearth/calibre-web)

## Credits

- [Calibre-Web Project](https://github.com/janeczku/calibre-web)
- [Calibre](https://calibre-ebook.com/)
