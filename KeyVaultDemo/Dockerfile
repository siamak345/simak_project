# Use the aspnet 3.1 base image as the starting point
FROM mcr.microsoft.com/dotnet/aspnet:3.1 AS base

# Set the working directory inside the container to /app
WORKDIR /app

# Expose port 80 for HTTP traffic
EXPOSE 80

# Expose port 443 for HTTPS traffic
EXPOSE 443

# Use the sdk 3.1 image for building the application
FROM mcr.microsoft.com/dotnet/sdk:3.1 AS build

# Set the working directory inside the container to /src
WORKDIR /src

# Copy the project file to the container
COPY ["KeyVaultDemo/KeyVaultDemo.csproj", "KeyVaultDemo/"]

# Restore the dependencies of the project
RUN dotnet restore "KeyVaultDemo/KeyVaultDemo.csproj"

# Copy the entire project to the container
COPY . .

# Set the working directory to the project directory
WORKDIR "/src/KeyVaultDemo"

# Build the project with the specified configuration and output path
RUN dotnet build "KeyVaultDemo.csproj" -c Release -o /app/build

# Use the build stage as the base for publishing
FROM build AS publish

# Publish the application to the specified output path
RUN dotnet publish "KeyVaultDemo.csproj" -c Release -o /app/publish

# Use the base stage as the final stage
FROM base AS final

# Set the working directory inside the container to /app
WORKDIR /app

# Copy the published files from the publish stage to the final stage
COPY --from=publish /app/publish .

# Set the entry point for the container to run the application
ENTRYPOINT ["dotnet", "KeyVaultDemo.dll"]
