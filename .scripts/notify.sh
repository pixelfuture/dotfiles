# !/bin/bash

# send title and message to display notification
# notify.sh MyTitle "Here is a long message"

# will fail script if it fails
# by default scripts will continue even after failure
set -e
# by default piped commands will not fail
# this overrides that and let's you know early if something fails
set -o pipefail

if [ $# -eq 0 ]; then
  echo "missing title and message"
  exit 64
fi
TITLE=$1
MESSAGE=$2
osascript -e 'display notification "'"$MESSAGE"'" with title "'"$TITLE"'"' 
