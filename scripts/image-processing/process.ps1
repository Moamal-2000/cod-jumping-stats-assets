# 1. Create all folder structures
$dir1 = "fixed_darkness"
$dir1920 = "1920"
$dirJpeg = Join-Path $dir1920 "jpeg"
$dir512 = "512"

New-Item -ItemType Directory -Force $dir1, $dir1920, $dirJpeg, $dir512 | Out-Null

# 2. Automatically process each WebP file
Get-ChildItem -File | Where-Object {
    $_.Extension -ieq '.webp'
} | ForEach-Object {
    $baseName = $_.BaseName

    $pathFixed     = Join-Path $dir1 "$baseName.webp"
    $path1920Webp  = Join-Path $dir1920 "$baseName.webp"
    $path1920Jpeg  = Join-Path $dirJpeg "$baseName.jpeg"
    $path512Webp   = Join-Path $dir512 "$baseName.webp"

    # Step 1: Enhance lighting and save to fixed_darkness
    magick $_.FullName `
        -gamma 1.45 `
        -modulate 105,125,100 `
        -contrast-stretch 0.1%x0.0% `
        $pathFixed

    # Step 2: Resize to 1920x1080 in WebP format
    magick $pathFixed -resize 1920x1080! $path1920Webp

    # Step 3: Generate a 1920x1080 JPEG copy directly from the enhanced image
    magick $pathFixed -resize 1920x1080! -quality 92 $path1920Jpeg

    # Step 4: Resize to 512x288 in WebP format
    magick $pathFixed -resize 512x288! $path512Webp
}