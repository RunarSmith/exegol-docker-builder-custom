# Author: The Exegol Project

FROM archlinux

ARG TAG="local"
ARG VERSION="local"
ARG BUILD_DATE="n/a"

LABEL org.exegol.tag="${TAG}"
LABEL org.exegol.version="${VERSION}"
LABEL org.exegol.build_date="${BUILD_DATE}"
LABEL org.exegol.app="Exegol"
LABEL org.exegol.src_repository="https://github.com/ThePorgs/Exegol-images"

COPY ansible /root/sources/

WORKDIR /root/sources

RUN echo "${TAG}-${VERSION}" > /opt/.exegol_version && \
    chmod +x ./bootstrap-ansible.sh && \
    ./bootstrap-ansible.sh && \
    ./bootstrap-ansible.sh playbook-base.yml

WORKDIR /workspace

# Dradis web UI
EXPOSE 3000/tcp

ENTRYPOINT ["/.exegol/entrypoint.sh"]
