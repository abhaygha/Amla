FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["TestProject.csproj", "./"]
RUN dotnet restore "TestProject.csproj"
COPY . .
RUN dotnet build "TestProject.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "TestProject.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "TestProject.dll"]
