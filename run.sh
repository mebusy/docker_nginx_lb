serverName="nginx-lb"

docker rm -f ${serverName}

 
NET_CONFIG="--net=host"                
if [ `uname` == "Darwin" ] ; then
    NET_CONFIG="-p 80:80 -p 3443:443"
    echo ${NET_CONFIG}
fi

mkdir -p logs
docker run --restart unless-stopped -d --name ${serverName} ${NET_CONFIG} \
    -v `pwd`/conf/:/etc/nginx/conf.d/  \
    -v `pwd`/logs:/usr/local/openresty/nginx/logs \
    nginx-lb


