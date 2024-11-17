wget https://github.com/flutter/flutter/raw/refs/heads/master/packages/flutter/lib/src/material/icons.dart

grep static icons.dart | grep static | grep -v _outlined | grep -v _rounded | grep -v _sharp | awk '{ print "'\''" $4 "'\'': Icons." $4 "," }' > icons_base.txt
grep static icons.dart | grep static | grep _sharp | awk '{ print "'\''" $4 "'\'': Icons." $4 "," }' > icons_sharp.txt
grep static icons.dart | grep static | grep _outlined | awk '{ print "'\''" $4 "'\'': Icons." $4 "," }' > icons_outlined.txt
grep static icons.dart | grep static | grep _rounded | awk '{ print "'\''" $4 "'\'': Icons." $4 "," }' > icons_rounded.txt