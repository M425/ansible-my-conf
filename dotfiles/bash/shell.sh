freeupmem() {
  sudo -s -- bash -c 'free && sync && echo 3 > /proc/sys/vm/drop_caches && free'
}

=() {
    calc="${@//p/+}"
    calc="${calc//x/*}"
    bc -l <<<"scale=10;$calc"
}

