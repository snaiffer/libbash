## Install
```
sudo git clone https://github.com/snaiffer/libbash.git /usr/lib/bash
```

## Use
add:
```
source /usr/lib/bash/general.sh
```

Example:
```
#!/bin/bash

dir_script=`dirname $0`
dir_data="$dir_script/data"

source /usr/lib/bash/general.sh

printf "Setting network... "
service network restart &> /dev/null
check_status

reboot_request
```
