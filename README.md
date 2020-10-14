# [Umbraco 9 (.NET Core) Docker Example](https://github.com/thecogworks/umbraco-core-docker-example) &middot; [![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](../LICENSE.md)

An example project with pre-configured Docker container to run and test the latest Umbraco build.

<p align="center">
  <img src="docs/img/umbraco-and-docker.png" alt="Umbraco + Docker" />
</p>

## Installation & Usage

1. [Download Docker](https://docs.docker.com/get-docker/) and install it if you don't have it on your machine yet.

2. Set up/change the password for the SA database user specified in _configs/ms.sql.env_ file.

```bash
SA_PASSWORD=examplepasswordtodb
ACCEPT_EULA=Y
```

3. Run the following command in the directory with _docker-compose.yml_ file:

```cmd
> docker-compose up -d
```

4. After successfull build (it may take a while at the first time!), visit: _localhost:8080_ (default configuration).

5. Configure the database on the created MSSQL server instance by connecting to it using e.g. SQL Management Studio. 

## Resources:

[.NET Core Alpha Release](https://umbraco.com/blog/net-core-alpha-release/)

[Umbraco, Docker and Kubernetes - Should We Care?](https://skrift.io/issues/umbraco-docker-and-kubernetes-should-we-care/)