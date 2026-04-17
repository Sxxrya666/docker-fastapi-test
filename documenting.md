---
# ERROR: 1

## 📤 Error Output
```bash
ERROR: permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Head "http://%2Fvar%2Frun%2Fdocker.sock/_ping": dial unix /var/run/docker.sock: connect: permission denied
```

## ✅ Solution
```diff
sudo usermod -aG docker jenkins
```

## 📝 Analysis
description

## 🔗 Resources
- N/A