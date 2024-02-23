# Be careful about the upstream server info in conf/http.conf

serverName="nginx-lb"

docker rm -f ${serverName}


if [ "$(uname)" != "Darwin" ]; then
    echo "This script is only supported on MacOS."
    exit 1
fi

# ip=`ipconfig getifaddr en0`
# host='mebusys-imac'
# echo "ip: ${ip}", "host: ${host}"
 
NET_CONFIG="--net=host"                
if [ `uname` == "Darwin" ] ; then
    NET_CONFIG="-p 80:80 -p 3443:443"
    echo ${NET_CONFIG}
fi

mkdir -p logs
# add-host  let nginx container can resolve the host name
# --add-host="${host}:${ip}" \
docker run --restart unless-stopped -d --name ${serverName} ${NET_CONFIG} \
    -v `pwd`/conf/:/etc/nginx/conf.d/  \
    -v `pwd`/logs/:/var/log/nginx/  \
    nginx-lb


