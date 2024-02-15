# VS Code Server Cleanup Script

This repository contains a script designed to clean up Visual Studio Code Server files from Docker containers. The purpose of this script is to ensure that VS Code Server installations do not persist in Docker images when they are committed, keeping the images clean and minimizing their size.

## Why Use This Script?

When using Visual Studio Code's Remote Containers feature, the VS Code Server is automatically installed inside the container to facilitate the remote development environment. While this is extremely useful for development, leaving the VS Code Server files in the image can unnecessarily increase the size of the committed Docker images. Running this cleanup script before committing an image ensures that these files are removed, maintaining a leaner image that contains only your application and its dependencies.

## Script Functionality

The cleanup script performs the following actions to ensure your Docker image remains clean and efficient:

1. **Kills All VS Code Server Processes**: It searches for and terminates any running processes associated with the VS Code Server. This step ensures that no VS Code Server processes remain active, which could otherwise persist unwanted data in the image.

2. **Removes VS Code Server Directories and Files**: The script deletes the `.vscode-server` directory, which contains the VS Code Server installation and data, from both the root user's home directory and any other user directories where it might be installed. This removal significantly reduces the image size and removes unnecessary files.

3. **Cleans Temporary and Cache Files**: Additionally, the script identifies and deletes any temporary or cache files related to the VS Code Server. This step further cleans the image, ensuring that only necessary files are retained.

By performing these actions, the script helps maintain a lean Docker image, free from the bloat of development tools like the VS Code Server, which are not typically needed in production environments or when sharing images.


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
