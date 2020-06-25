#!/bin/sh
START_TIME=$(date -I'seconds' | sed "s/\(.*\)\(.\{2\}\)$/\1:\2/")
yarn audit 
yarn audit --json > tool-output.txt
END_TIME=$(date -I'seconds' | sed "s/\(.*\)\(.\{2\}\)$/\1:\2/")

/data-forwarder --tool-name=yarn-audit --tool-version=1.22.4 --tool-output-path=tool-output.txt --start-time="$START_TIME" --end-time="$END_TIME" --output-format=JSON --scan-env="$SCAN_ENV" --app-name="$APP_NAME" --endpoint-url="$DATA_COLLECTOR_URL" 
