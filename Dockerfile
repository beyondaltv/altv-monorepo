# Build stage

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /opt/source
COPY . .
RUN dotnet publish "./src/server/Beyond.Client.Resource/Beyond.Client.Resource.csproj"
RUN dotnet publish "./src/server/Beyond.Server.AltV.Resource/Beyond.Server.AltV.Resource.csproj"

# Run stage

FROM mcr.microsoft.com/dotnet/runtime:8.0
RUN apt update && apt install -y wget libatomic1 libstdc++6 gcc
WORKDIR /opt/app
COPY --from=build /opt/source/resources ./resources
COPY ./setup.sh .
COPY ./server.toml .
RUN ./setup.sh

EXPOSE 7788
ENTRYPOINT [ "./altv-server" ]
