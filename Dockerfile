FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env
WORKDIR /app

COPY *.sln .

COPY NuGet.config .

COPY src/*/*.csproj ./
RUN for file in $(ls *.csproj); do mkdir -p src/${file%.*}/ && mv $file src/${file%.*}/; done

RUN ls ./src/ -a

RUN dotnet restore

# Copy everything else and build
COPY . ./
RUN dotnet publish -c Release -o out --no-restore

# Build runtime image
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app/out
ENV ASPNETCORE_URLS=http://+:80
COPY --from=build-env . .
ENTRYPOINT ["dotnet", "UmbracoNetCoreDockerExample.Web.dll"]