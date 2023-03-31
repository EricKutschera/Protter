#!/bin/bash

module load Java/11.0.2 || exit 1
module load texlive || exit 1

DVISVGM_PATH="$(which dvisvgm)" || exit 1
CONFIG_PATH='protter.config'

echo setting path to dvisvgm in config file
echo sed -i 's<^dvisvgmPath = .*$<dvisvgmPath = '"${DVISVGM_PATH}"'<' "${CONFIG_PATH}" || exit 1
sed -i 's<^dvisvgmPath = .*$<dvisvgmPath = '"${DVISVGM_PATH}"'<' "${CONFIG_PATH}" || exit 1
echo

java -jar protterServer.jar
