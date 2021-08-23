# docker_nginx_lb


```bash
$ docker build -t nginx-lb .
```

```bash
$ sh run.sh
```


```bash
# webssh
docker run -d -p 5032:5032 --log-driver json-file --log-opt max-file=1 --log-opt max-size=100m --restart always --name webssh -e TZ=Asia/Shanghai -e savePass=true jrohy/webssh
```
