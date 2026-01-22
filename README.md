Docker container with locked down SSH server for Borg. Let your friends make backups to your server safely. Uses SSH key authentication. Configurable bandwidth limit and storage quota.

## Usage

See `compose.yaml` for a docker-compose example.

The repository is stored in /data, the SSH server keys are stored in /keys. Losing /keys is not a disaster, just inconvenient because the client will throw man in the middle warnings until manually cleared.

In borg, use the repository address `ssh://root@ip:port/data`, replacing `ip` and `port` with the appropriate values

## Possible improvements

I'll probably do this at some point. If you would like to get it done earlier or have some other idea, don't hesitate to make a pull request!

- Provide both Debian and Alpine images
- Download Borg from official source, instead of using Alpine package
- Tag container images with Borg version. Updates will only be provided for the latest v1 and v2 release.
