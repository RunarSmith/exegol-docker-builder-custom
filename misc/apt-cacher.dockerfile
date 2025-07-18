# Build : 
# docker build -t custom-apt-cacher-ng --file .\apt-cacher.dockerfile .

# Run:
# docker run -d -p 127.0.0.1:3142:3142 --name apt-cacher-ng custom-apt-cacher-ng
#
# Get its IP address :
# docker inspect apt-cacher-ng

FROM ubuntu:24.10

# Expose the cache directory for volume binding
# VOLUME ["/var/cache/apt-cacher-ng"]

# Update apt-get cache
RUN apt-get update -y && \
        # Install apt-cacher-ng package
        apt-get install apt-cacher-ng -y && \
        # Clean up
        rm -rf /var/lib/apt/lists/*

# Expose the apt-cacher-ng port to be binded
EXPOSE 3142

# Set cache directory permissions
CMD chmod 777 /var/cache/apt-cacher-ng && \
        # Append PassThroughPattern config for SSL/TLS proxying (optional)
        echo "PassThroughPattern: .*" >> /etc/apt-cacher-ng/acng.conf && \
        # Start the service
        /etc/init.d/apt-cacher-ng start && \
        # Output all logs of apt-cacher-ng
        tail -f /var/log/apt-cacher-ng/*
