if [[ $OSFAMILY == Linux ]]; then
  path=(/usr/lib/lightdm/lightdm /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin $path)
fi
