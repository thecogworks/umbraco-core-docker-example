FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env
WORKDIR /app

COPY *.sln ./

COPY NuGet.config ./

COPY src/*/*.csproj ./
RUN for file in $(ls *.csproj); do mkdir -p src/${file%.*}/ && mv $file src/${file%.*}/; done

RUN dotnet restore

# Copy everything else and build
COPY . ./
RUN dotnet build -c Release -o ./out/build

FROM build-env AS publish
RUN dotnet publish -c Release -o ./out/publish --no-restore

COPY ./src/UmbracoNetCoreDockerExample.Web/umbraco ./out/publish/umbraco

# Build runtime image
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app
ENV ASPNETCORE_URLS=http://+:80
COPY --from=publish /app/out/publish ./

ENTRYPOINT ["dotnet", "UmbracoNetCoreDockerExample.Web.dll"]