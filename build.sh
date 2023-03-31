#!/bin/bash

module load Java/11.0.2 || exit 1

if [[ -d ./bin ]]; then
  echo rm -r ./bin || exit 1
  rm -r ./bin || exit 1
fi
echo mkdir -p ./bin || exit 1
mkdir -p ./bin || exit 1

# compile everything and write results to ./bin/
echo javac -d ./bin/ -classpath @list_of_class_path.txt @list_of_source_files.txt || exit 1
javac -d ./bin/ -classpath @list_of_class_path.txt @list_of_source_files.txt || exit 1

# create a jar with the manifest and the files just compiled in bin/
echo jar cfm protterServer.jar manifest.txt -C bin . || exit 1
jar cfm protterServer.jar manifest.txt -C bin . || exit 1
