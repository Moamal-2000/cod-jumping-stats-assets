# Cod Jumping Stats - Assets Submodule

This repository contains the **assets** used by the Cod Jumping Stats website.  
It is intended to be included as a **Git submodule** in the main project.

## Main Project

- **GitHub Repository:** [Cod Jumping Stats](https://github.com/Moamal-2000/cod-jumping-stats) (Private Repository)
- **Live Site:** [https://cjstats.moamalalaa.com](https://cjstats.moamalalaa.com)

## Requirements

Before using the scripts, install the following tools:

### 1. Git

Git is required to clone the repository and manage submodules.

1. Download [Git for Windows](https://git-scm.com/download/win).
2. Run the installer and follow the setup instructions.
3. Open PowerShell and verify the installation:

   ```powershell
   git --version
   ```

### 2. ImageMagick

ImageMagick is required to process and convert images.

1. Download the [ImageMagick Windows installer](https://imagemagick.org/script/download.php#windows) from the official website.
2. Run the installer and enable the option to add the application directory to the system `PATH`, if available.
3. Complete the installation.
4. Open a **new PowerShell window** and verify the installation:

   ```powershell
   magick -version
   ```

If either command is not recognized, check the installation and ensure the tool's executable directory is included in your system's `PATH`.

## Usage

To include this repository as a submodule in your project:

```bash
git submodule add https://github.com/Moamal-2000/cod-jumping-stats-assets assets
git submodule update --init --recursive
```

## How to use the image-processing script?

Place any `.webp` image in the `image-processing` directory and double-click `start.bat`.

## Note for Overexposed / Bright Images

If certain images are already too bright or have intense lighting (bloom/glow), reduce the `-gamma` and `-modulate` parameters to avoid overexposure:

```powershell
magick $_.FullName `
    -gamma 1.15 `
    -modulate 95,100,100 `
    -contrast-stretch 0.1%x0.0% `
    $pathFixed
```

- **`-gamma 1.15`**: Adjusts gamma to reduce excessive brightness in the processed image.
- **`-modulate 95,100,100`**: Slightly reduces brightness to 95% while keeping saturation and hue unchanged.

## License

This repository, including the PowerShell conversion scripts and associated assets, is licensed under the [MIT License](LICENSE).
