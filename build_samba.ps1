foreach($arch in $("armhf","armv7","aarch64","amd64","i386"))
{
    $target = "addons/" + $arch + "_samba:latest"
    $BUILD_FROM = "ghcr.io/hassio-addons/base/"+ $arch + ":stable"
    docker build --pull --rm -f "samba/Dockerfile" -t $target --build-arg BUILD_FROM=$BUILD_FROM "samba"
    $destination = "ghcr.io/d-grund/" + $target
    docker tag $target $destination
    docker push $destination
}