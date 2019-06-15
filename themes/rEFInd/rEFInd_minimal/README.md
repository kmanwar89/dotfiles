## Custom rEFInd-minimal Theme

[rEFInd](http://www.rodsbooks.com/refind/) is a simplistic boot manager for UEFI
based systems. This is a clean and minimal theme for it.

![Screenshot](http://i.imgur.com/WUrTxXr.jpg)

### TODO:

- Update screenshot.
- Look into more function icons.

### Usage

 1. Locate your refind EFI directory. This is commonly `/boot/EFI/refind`
    though it will depend on where you mount your ESP and where rEFInd is
    installed. `fdisk -l` and `mount` may help.

 2. Clone this repository into your refind configuration directory.

 3. To enable the theme add `include rEFInd-minimal/theme.conf` at the end of
    `refind.conf`.

Your boot entries should be auto-detected. Be careful to remove old Linux kernels and comment out all the example menu entries in `refind.conf`.

### Background

If your find the background looks blurry it may be due to the [included wallpaper][wallpaper] being an incorrect resolution for your monitor - this theme ships with a 1920x1080 resolution wallpaper. Below you can find the wallpaper source and download the correct size. If the correct size isn't available for download you can resize it yourself.

You can swap out the background with any other background you like. All you have to do is download it, make sure it is an appropiate size, and make sure it is either a BMP (with a depth of either 24, 8, 4, or 1) or a PNG. Take care to ensure that all the icons are still visible. After you have done this, simply delete the original `background.png` and replace it with your own `background.png`.

### Attribution

The original [rEFInd-minimal][theme] theme is by [Evan Purkhiser][evan].

The OS icons are from [Lightness for burg][icons] by [SWOriginal][icon-author].

The background is one I found called [Crystals][wallpaper] by [Puscifer91][bg-author] on deviantART.

[theme]: https://github.com/EvanPurkhiser/rEFInd-minimal
[evan]: https://github.com/EvanPurkhiser

[icons]: http://sworiginal.deviantart.com/art/Lightness-for-burg-181461810
[icon-author]: http://sworiginal.deviantart.com/

[wallpaper]: http://puscifer91.deviantart.com/art/Crystals-Wallpaper-4K-504839163
[bg-author]: http://puscifer91.deviantart.com/

#### Modifications I've made

- Changed background to a fancier one.
- Changed OS selector icon to a dot instead of a little arrow.
- Changed Windows icon to original one, instead of a diamond shaped one.
- Changed shutdown icon.
