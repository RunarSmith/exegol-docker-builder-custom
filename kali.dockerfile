# Author: The Exegol Project

FROM kalilinux/kali-rolling

ARG TAG="local"
ARG VERSION="local"
ARG BUILD_DATE="n/a"

LABEL org.exegol.tag="${TAG}"
LABEL org.exegol.version="${VERSION}"
LABEL org.exegol.build_date="${BUILD_DATE}"
LABEL org.exegol.app="Exegol"
LABEL org.exegol.src_repository="https://github.com/ThePorgs/Exegol-images"

COPY ansible /root/sources/

WORKDIR /root/sources/install/ansible

RUN echo "${TAG}-${VERSION}" > /opt/.exegol_version && \
    chmod +x ./bootstrap-ansible.sh && \
    ./bootstrap-ansible.sh && \
    ./bootstrap-ansible.sh localhost -m setup

WORKDIR /workspace

ENTRYPOINT ["/.exegol/entrypoint-kali.sh"]
