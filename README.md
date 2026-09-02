# Cod Jumping Stats - Assets Submodule

This repository contains the **assets** used by the Cod Jumping Stats website.  
It is intended to be included as a **Git submodule** in the main project.

## Main Project

- **GitHub Repository:** [Cod Jumping Stats](https://github.com/Moamal-2000/cod-jumping-stats) (Private Repository)
- **Live Site:** [https://cjstats.moamalalaa.com](https://cjstats.moamalalaa.com)

## Usage

To include this repository as a submodule in your project:

```bash
git submodule add https://github.com/Moamal-2000/cod-jumping-stats-assets assets
git submodule update --init --recursive
```

## How to use image-processing script?

Just Place any `.webp` image in the directory `image-processing` and double-click `start.bat`.

> **Note for Overexposed / Bright Images:**  
> If certain images are already too bright or have intense lighting (bloom/glow), reduce the `-gamma` and `-modulate` parameters to avoid overexposure:
>
> ```powershell
> magick $_.FullName `
>     -gamma 1.15 `
>     -modulate 95,100,100 `
>     -contrast-stretch 0.1%x0.0% `
>     $pathFixed
> ```
>
> - **`-gamma 1.15`**: Lowers shadow lift to prevent blown-out highlights.
> - **`-modulate 95,100,100`**: Slightly tones down overall brightness (95%) and keeps saturation natural (100%).
