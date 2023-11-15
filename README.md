# Container With Devpi Server

A Dockerfile image based on [python:3-alpine3.9](https://hub.docker.com/layers/library/python/3.9-alpine) that runs
a [devpi](http://doc.devpi.net) server (*a PyPi Cache*).


## Usage

After clonning repository, change current directory to devpi folder  : 
```bash
cd devpi
```
Build an image using Dockerfile present in current working directory
```ini
podman build -t <image_name> .
```

Run container instance using image created above by port forwarding container port `3141` to container host's port `3141` 
```bash
podman run -it --rm -p 3141:3141 --name devpi localhost/<image_name>

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

### Steps 

To install required packages, and to store required packages cache on devpi server's index_url (in order to use packages in offline air-gapped environment) : 
```ini
$ pip install -i http://localhost:3141/root/pypi/+simple/ <space_separated_package_names_to_be_installed>
```

To convert devpi-server's running container instance into an image : 
```ini
podman commit <container-name> <image_name>:<version-tag>
```

Then push this image into registry using `podman push` command.
