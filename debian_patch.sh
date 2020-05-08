#!/bin/bash
sed "s/PREFIX\ \:\=\ \/usr\/local/PREFIX\ \:\=\ \/usr/g" -i Makefile
sed 's/PK_EXEC_DEST \:\= \\\/usr\\\/local\\\/bin/PK_EXEC_DEST \:\= \\\/usr\\\/bin/g' -i Makefile
sed "s/iwconfig/\/usr\/sbin\/iwconfig/g" -i get_iw_signal
