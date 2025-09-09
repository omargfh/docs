# NetLogo Documentation

This repository contains the official documentation for NetLogo, a multi-agent programmable modeling environment. The documentation is organized by version and includes comprehensive guides, tutorials, and API references.

## Repository Structure

- Each version of NetLogo has its own directory (e.g., `7.0.0/`, `7.0.0-beta2/`)
- The `latest` symlink points to the most current stable release
- Documentation includes HTML files, CSS stylesheets, JavaScript, and supporting assets

## Updating the Documentation

### Adding a New Version
1. **Build the Documentation**: Generate the documentation build for the new version
    - Ensure you have a valid clone of `NetLogo/NetLogo` repository and that SBT runs successfully.
    - Update files as needed in `$REPO/autogen/docs/**/*`.
    - Run `sbt` as instructed then use the command `allDocs` to generate the `html`, `css`, `js`, `pdf`, and static files needed.
    - You may find the generated files in `$REPO/netlogo-gui/`.
2. **Create Version Directory**: Move the built content to a directory named after the version (e.g., `7.1.0/`)
3. **Update Symlink**: If this is a new stable release, update the `latest` symlink:
   ```bash
   ln -sfn 7.1.0 latest
   ```
4. **Verify Structure**: Ensure all required files and subdirectories are present
5. **Test Links**: Verify that internal links and navigation work correctly

## Development

### Local Testing
To test documentation locally:
1. Change your terminals directory to the root of this repository.
2. Run 
```bash
➜  ./mimic-deploy.sh
➜  cd dist
➜  "Run a live server here"
```
3. Ensure navigation works correctly.