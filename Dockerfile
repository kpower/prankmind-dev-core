# see https://releases.ubuntu.com/ for Ubuntu Releases (jammy)
# see https://hub.docker.com/_/swift for Docker supported Swift images
FROM swift:6.3.2-jammy

COPY Package.swift /container/
COPY Package.resolved /container/
COPY Sources/ /container/Sources/
COPY Tests/ /container/Tests/
COPY .build/checkouts/ /container/.build/checkouts/
COPY .build/repositories/ /container/.build/repositories/
WORKDIR /container

RUN swift build -c release

CMD ["swift", "test", "-c", "release"]
