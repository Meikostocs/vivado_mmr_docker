# 🚀 Run Vivado in Docker

## 📦 Installation

Clone the repository:

```
git clone git@github.com:Meikostocs/vivado_mmr_docker.git
cd vivado_mmr_docker
```

# Vivado Docker Setup Guide

## 📦 Setup

The `setup.sh` script prepares your Docker workspace. It will automatically create the following directories:

- `installer/`: where the Vivado installer will be placed  
- `vivado/`: mapped to `/opt/` in the Docker container (recommended location for your Vivado installation and projects)

---

### 📁 Step 1: Add the Vivado Installer

Once the `installer/` directory has been created, move your **Vivado installer** file inside it.

Then make sure to:


1. Make it executable:

    ```bash
    chmod +x vivado.bin
    ```

2. Extract its contents to the current directory:

    ```bash
    ./vivado.bin --noexec --target ./
    ```

> ⚠️ Replace `vivado.bin` with the actual filename of your Vivado installer if different.

---

### 🚀 Step 2: Launch the Container

Return to the main project directory and run:

```bash
./run.sh
```

- On first launch, you may be prompted to enter your **AMD credentials** (used to validate or download files).  
- After authentication, the installation will proceed automatically.

---

### ✅ Next Runs

Once the setup is complete, any future call to `./run.sh` will directly open Vivado inside the Docker container.

Your Vivado projects should be saved inside the `/opt/` directory (mapped to `vivado/` locally), ensuring that all your work is persistent across container sessions.


---

## 📁 Directory Structure

- `vivado/` → This is mounted to `/opt` inside the Ubuntu container.  
  It is recommended to install Vivado **and store your projects** in `/opt` so they will be available under the `vivado/` folder on your host.

- `installer/` → This should contain the Vivado installer binary (e.g., `Vivado_2023.2.bin`).


---

## 💡 Usage Tips

- To open Vivado in the future, just run:

```
./run.sh
```
