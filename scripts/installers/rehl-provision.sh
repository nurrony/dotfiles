#!/usr/bin/env bash
echo "Setting up the system..." \
  && sudo dnf update --assumeyes \
  && sudo dnf upgrade --assumeyes \
  && sudo subscription-manager repos --enable codeready-builder-for-rhel-9-$(arch)-rpms \
  && sudo dnf install --assumeyes --nogpgcheck https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm \
  && sudo dnf groupinstall --assumeyes "Development Tools" \
  && sudo dnf install --assumeyes zip unzip htop tree curl wget tree fzf \
  && sudo dnf remove podman buildah \
  && sudo dnf install --assumeyes yum-utils device-mapper-persistent-data lvm2 \
  && sudo yum-config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo \
  && sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin \
  && sudo usermod -aG docker $USER \
  && sudo systemctl start docker \
  && sudo systemctl enable docker \
  && sudo systemctl enable docker.service \
  && sudo systemctl enable containerd.service \
