default: publish run

build:
    dotnet build ./src/server/Beyond.Server.Resource/Beyond.Server.Resource.csproj

run:
    dotnet run --project ./src/server/Beyond.Server.Resource/Beyond.Server.Resource.csproj

publish:
    dotnet publish ./src/server/Beyond.Server.Resource/Beyond.Server.Resource.csproj

update: update-server update-modules update-data

update-server:
    wget -N https://cdn.alt-mp.com/voice-server/dev/x64_linux/altv-voice-server https://cdn.alt-mp.com/coreclr-module/dev/x64_linux/AltV.Net.Host.dll https://cdn.alt-mp.com/coreclr-module/dev/x64_linux/AltV.Net.Host.runtimeconfig.json https://cdn.alt-mp.com/data/dev/update.json https://cdn.alt-mp.com/server/dev/x64_linux/altv-crash-handler https://cdn.alt-mp.com/server/dev/x64_linux/altv-server

update-modules:
    wget -P ./modules -N https://cdn.alt-mp.com/coreclr-module/dev/x64_linux/modules/libcsharp-module.so

update-data:
    wget -P ./data -N https://cdn.alt-mp.com/data/dev/data/vehmodels.bin https://cdn.alt-mp.com/data/dev/data/vehmods.bin https://cdn.alt-mp.com/data/dev/data/clothes.bin https://cdn.alt-mp.com/data/dev/data/pedmodels.bin https://cdn.alt-mp.com/data/dev/data/rpfdata.bin https://cdn.alt-mp.com/data/dev/data/weaponmodels.bin
