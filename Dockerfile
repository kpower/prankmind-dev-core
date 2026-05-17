# see https://releases.ubuntu.com/ for Ubuntu Releases (jammy)
# see https://hub.docker.com/_/swift for Docker supported Swift images
FROM swift:6.3.2-jammy

COPY . /container
WORKDIR /container

CMD ["swift", "test", "-c", "release"]
