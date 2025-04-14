# 🚀 Run Vivado in Docker

## 📦 Installation

Clone the repository:

```
git clone git@github.com:Meikostocs/vivado_mmr_docker.git
cd vivado_mmr_docker
```

Make the setup file executable:

```
chmod +x setup.sh
```

The `setup.sh` script configures your Docker workspace. It will create the `installer/` and `vivado/` directories.

---

## 📁 Directory Structure

- `vivado/` → This is mounted to `/opt` inside the Ubuntu container.  
  It is recommended to install Vivado **and store your projects** in `/opt` so they will be available under the `vivado/` folder on your host.

- `installer/` → This should contain the Vivado installer binary (e.g., `Vivado_2023.2.bin`).

> 🔧 Make sure to update the installer filename in the `docker-compose.yaml` under the `args` section:
```yaml
args:
  SETUP_FILE: installer/<vivado_installer.bin>
```

---

## ▶️ Running the Container

Once everything is set up, run:

```
./run.sh
```

This will open an interactive shell inside the container.

If it's your first time launching it, you'll need to install Vivado manually. From inside the container:

1. Run the installer script (`Vivado_2023.2.bin`) and follow the on-screen instructions.
2. **Important:** Install Vivado into `/opt/` to ensure the installation is persistent.
3. Once installed, navigate to the Vivado binary folder and launch it:

```
cd /opt/Vivado/<version>/bin/
./vivado
```

---

## 💡 Usage Tips

- To open Vivado in the future, just run:

```
./run.sh
```
- Navigate into ```/opt/Vivado/<version>/bin/``` folder and launch ```vivado```.
- Save all your projects inside `/opt` (which maps to `vivado/` on the host) to keep them safe and persistent.
- The container has X11 forwarding enabled, so Vivado will open graphically if your host is properly configured.
