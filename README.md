# Container With Devpi Server

A Dockerfile image based on [python:3-alpine3.9](https://hub.docker.com/layers/library/python/3.9-alpine) that runs
a [devpi](http://doc.devpi.net) server (*a PyPi Cache*).


To install required packages, and to store required package cache on devpi server's index_url (in order to use packages in offline air-gapped environment) : 
- Update `requirements.txt` file with the list of required package dependencies before image build. These listed packages in `requirements.txt` will be installed as a part of image build.

## Usage

After clonning repository, change current directory to devpi folder  : 
```bash
cd devpi
```
Build an image using Dockerfile present in current working directory
```bash
podman build -t <image_name> .
```
Alternatively you can specify version of Python packages to be pulled by providing build parameter `PYTHON_PACKAGE_VERSION`.
```bash
podman build -t <image_name> --build-arg PYTHON_PACKAGE_VERSION=3.8 .
```

Run container instance using image created above by port forwarding container port `3141` to container host's port `3141` 
```bash
podman run -it --rm -p 3141:3141 --name devpi localhost/<image_name>

```

### pip

Use a configuration similar to this in your `~/.pip/pip.conf`:

```ini
[global]
index-url = http://<devpi_server_url>/root/pypi/+simple/
```

### setuptools

Use a configuration similar to this in your `~/.pydistutils.cfg`:

```ini
[easy_install]
index_url = http://<devpi_server_url>/root/pypi/+simple/
```
In case, to run devpi-server on localhost system :  `<devpi_server_url>` ~ `localhost` 


