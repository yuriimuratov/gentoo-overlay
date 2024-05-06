# gentoo-overlay

`eselect repository add trashed git https://github.com/yuriimuratov/gentoo-overlay.git`
`emaint sync -r trashed`

# Accept Keywords
`sudo nano /etc/portage/package.accept_keywords/trashed`

```
*/*::trashed ~amd64 ~arm64
```
