# How to use:

```
docker run -d \
  --name folder_sync \
  -e SOURCE_FOLDER=/data/source \
  -e TARGET_FOLDER=/data/target \
  -v /path/on/host/source:/data/source \
  -v /path/on/host/target:/data/target \
  folder-sync
```