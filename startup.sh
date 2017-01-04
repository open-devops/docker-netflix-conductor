#!/bin/bash

if [ ! -z "$http_proxy_host" ]; then
cat <<EOT >> gradle.properties
systemProp.http.proxyHost=$http_proxy_host
systemProp.http.proxyPort=$http_proxy_port
systemProp.http.noProxyHosts=$no_proxy
systemProp.https.proxyHost=$http_proxy_host
systemProp.https.proxyPort=$https_proxy_port
systemProp.https.noProxyHosts=$no_proxy
EOT
fi

cd /netflix/conductor/test-harness
../gradlew server &

cd /netflix/conductor/ui
npm install
npm run watch
