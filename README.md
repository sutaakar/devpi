# Container With Devpi Server

A Dockerfile image based on [python:3-alpine3.9](https://hub.docker.com/layers/library/python/3.9-alpine) that runs
a [devpi](http://doc.devpi.net) server (*a PyPi Cache*).


## Usage

After clonning repository, change current directory to devpi folder : 
```bash
cd devpi
podman build -t <image_name> .
```

```bash
docker run -it --rm -p 3141:3141 --name devpi localhost/<image_name>

```

### pip

Use a configuration similar to this in your `~/.pip/pip.conf`:

```ini
[global]
index-url = http://localhost:3141/root/pypi/+simple/
```

### setuptools

Use a configuration similar to this in your `~/.pydistutils.cfg`:

```ini
[easy_install]
index_url = http://localhost:3141/root/pypi/+simple/
```
