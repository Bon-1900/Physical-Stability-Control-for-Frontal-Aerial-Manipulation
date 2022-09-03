#!/bin/bash
# NOTE : Quote it else use array to avoid problems #
FILES="$HOME/Documents/QGroundControl Daily/Logs/exp1.2.5"
cd "$FILES"
for FILE in *
do
  echo "Processing $FILE file..."
  FOLDER=${FILE%.ulg}
  # echo "${FILE%.ulg}"
  mkdir $FOLDER
  mv $FILE $FOLDER
  cd "$FOLDER"
  ulog2csv "$FILE"
  cd ..
done
cd "$FILES"

# find and replace file name
# find . -name "*.ulg" -exec rename 's/1.2.2/1.2.3/' {} ";" 