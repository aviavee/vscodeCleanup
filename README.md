# VS Code Server Cleanup Script

This repository contains a script designed to clean up Visual Studio Code Server files from Docker containers. The purpose of this script is to ensure that VS Code Server installations do not persist in Docker images when they are committed, keeping the images clean and minimizing their size.

## Why Use This Script?

When using Visual Studio Code's Remote Containers feature, the VS Code Server is automatically installed inside the container to facilitate the remote development environment. While this is extremely useful for development, leaving the VS Code Server files in the image can unnecessarily increase the size of the committed Docker images. Running this cleanup script before committing an image ensures that these files are removed, maintaining a leaner image that contains only your application and its dependencies.

## How to Use

Adding the Cleanup Script to an Existing Container

If you have an existing container you'd like to clean up before committing, you can add the cleanup script directly to it. Here's how:

1. Copy the cleanup script to your container:

   ```bash
   docker cp cleanup_vscode_server.sh <container_id_or_name>:/path/to/yourapp/vscodecleanup.sh
   ```

2. Make the script executable within the container:

   ```bash
   docker exec <container_id_or_name> chmod +x /path/to/yourapp/vscodecleanup.sh
   ```

3. Run the cleanup script inside the container:

   ```bash
   docker exec <container_id_or_name> /path/to/yourapp/vscodecleanup.sh
   ```

4. Committing Your Docker Image

    After running the cleanup script, you can commit your Docker image as usual, now cleaned of VS Code Server files:

    ```bash
    docker commit <container_id_or_name> <repository>:<tag>
    ```

## Contributing

Contributions to improve the cleanup script or its documentation are welcome! Please feel free to open an issue or submit a pull request.

## License

This software is released under the MIT License.

---

This project is not affiliated with Microsoft or Visual Studio Code. It is an independent tool designed to help manage Docker images used with the VS Code Remote Containers feature.
