ARG NEXUS_VERSION=3.23.0

FROM sonatype/nexus3:$NEXUS_VERSION

ENV GOOGLE_APPLICATION_CREDENTIALS=/opt/sonatype/service-account.json

ARG PLUGIN_VERSION=0.13.0
ARG BUNDLE_NAME=nexus-blobstore-google-cloud-${PLUGIN_VERSION}.kar
ARG KAR_URL=https://repository.sonatype.org/service/local/repositories/releases/content/org/sonatype/nexus/plugins/nexus-blobstore-google-cloud/${PLUGIN_VERSION}/${BUNDLE_NAME}
ADD --chown=nexus:nexus ${KAR_URL} /opt/sonatype/nexus/deploy

COPY service-account.json /opt/sonatype

USER nexus