netsh interface ipv4 set interface "本地连接 2" weakhostreceive=enabled
netsh interface ipv4 set interface "本地连接 2" weakhostsend=enabled
netsh interface ipv4 set interface "loop" weakhostreceive=enabled
netsh interface ipv4 set interface "loop" weakhostsend=enabled
