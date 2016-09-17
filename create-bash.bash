#!/usr/bin/env bash

#
# This script creates a new Bash script file.
# It inserts the shebang line and sets the file to be executable.
#
# Arguments:
# $1 The name of the file (typically has .bash extension)
#

printf '#!/usr/bin/env bash\n\necho "hello world"' > $1
chmod +x $1

