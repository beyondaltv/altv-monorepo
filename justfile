set windows-shell := ["nu", "-c"]

default: publish run

build: build-client build-server
build-server:
    dotnet build ./src/server/Beyond.Server.Resource/Beyond.Server.Resource.csproj
build-client:
    dotnet build ./src/server/Beyond.Client.Resource/Beyond.Client.Resource.csproj

publish: publish-client publish-server
publish-server:
    dotnet publish ./src/server/Beyond.Server.Resource/Beyond.Server.Resource.csproj
publish-client:
    dotnet publish ./src/server/Beyond.Client.Resource/Beyond.Client.Resource.csproj

run:
    dotnet run --project ./src/server/Beyond.Server.Resource/Beyond.Server.Resource.csproj

update-windows: update-windows-server update-windows-modules update-windows-data

update-windows-server:
    wget -N https://cdn.alt-mp.com/voice-server/dev/x64_win32/altv-voice-server.exe https://cdn.alt-mp.com/coreclr-module/dev/x64_win32/AltV.Net.Host.dll https://cdn.alt-mp.com/coreclr-module/dev/x64_win32/AltV.Net.Host.runtimeconfig.json https://cdn.alt-mp.com/data/dev/update.json https://cdn.alt-mp.com/server/dev/x64_win32/altv-crash-handler.exe https://cdn.alt-mp.com/server/dev/x64_win32/altv-server.exe

update-windows-modules:
    wget -P ./modules -N https://cdn.alt-mp.com/coreclr-module/dev/x64_win32/modules/csharp-module.dll

update-windows-data:
    wget -P ./data -N https://cdn.alt-mp.com/data/dev/data/vehmodels.bin https://cdn.alt-mp.com/data/dev/data/vehmods.bin https://cdn.alt-mp.com/data/dev/data/clothes.bin https://cdn.alt-mp.com/data/dev/data/pedmodels.bin https://cdn.alt-mp.com/data/dev/data/rpfdata.bin https://cdn.alt-mp.com/data/dev/data/weaponmodels.bin


update-linux: update-linux-server update-linux-modules update-linux-data

update-linux-server:
    wget -N https://cdn.alt-mp.com/voice-server/dev/x64_linux/altv-voice-server https://cdn.alt-mp.com/coreclr-module/dev/x64_linux/AltV.Net.Host.dll https://cdn.alt-mp.com/coreclr-module/dev/x64_linux/AltV.Net.Host.runtimeconfig.json https://cdn.alt-mp.com/data/dev/update.json https://cdn.alt-mp.com/server/dev/x64_linux/altv-crash-handler https://cdn.alt-mp.com/server/dev/x64_linux/altv-server

update-linux-modules:
    wget -P ./modules -N https://cdn.alt-mp.com/coreclr-module/dev/x64_linux/modules/libcsharp-module.so

update-linux-data:
    wget -P ./data -N https://cdn.alt-mp.com/data/dev/data/vehmodels.bin https://cdn.alt-mp.com/data/dev/data/vehmods.bin https://cdn.alt-mp.com/data/dev/data/clothes.bin https://cdn.alt-mp.com/data/dev/data/pedmodels.bin https://cdn.alt-mp.com/data/dev/data/rpfdata.bin https://cdn.alt-mp.com/data/dev/data/weaponmodels.bin
