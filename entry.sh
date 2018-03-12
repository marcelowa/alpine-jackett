#!/bin/sh

cert-sync /etc/ssl/certs/ca-certificates.crt

mkdir -p /app/Jackett
jack_tag=$(curl -sX GET "https://api.github.com/repos/Jackett/Jackett/releases/latest" | awk '/tag_name/{print $4;exit}' FS='[""]')
curl -o /tmp/jacket.tar.gz -L https://github.com/Jackett/Jackett/releases/download/$jack_tag/Jackett.Binaries.Mono.tar.gz
tar xf /tmp/jacket.tar.gz -C /app/Jackett --strip-components=1

mono /app/Jackett/JackettConsole.exe --NoUpdates