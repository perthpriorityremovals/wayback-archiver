#!/usr/bin/env bash
set -euo pipefail

URL_FILE="urls.txt"
LOG_FILE="archive-log.txt"

echo "Starting archive run: $(date -u)" | tee "$LOG_FILE"
echo "" | tee -a "$LOG_FILE"

while IFS= read -r raw_url || [ -n "$raw_url" ]; do
  url="$(echo "$raw_url" | xargs)"

  if [ -z "$url" ]; then continue; fi
  if [[ "$url" == \#* ]]; then continue; fi

  echo "Archiving: $url" | tee -a "$LOG_FILE"

  http_code=$(curl -sS -L \
    --connect-timeout 10 \
    --max-time 30 \
    --retry 1 \
    --retry-delay 3 \
    --user-agent "Mozilla/5.0 (compatible; PPRWaybackArchiver/1.0)" \
    -o /dev/null \
    -w "%{http_code}" \
    "https://web.archive.org/save/$url" || echo "000")

  echo "Response code: $http_code" | tee -a "$LOG_FILE"

  if [ "$http_code" = "200" ] || [ "$http_code" = "302" ]; then
    echo "Result: submitted" | tee -a "$LOG_FILE"
  else
    echo "Result: failed or timeout" | tee -a "$LOG_FILE"
  fi

  echo "-----" | tee -a "$LOG_FILE"

  sleep 10
done < "$URL_FILE"

echo ""
echo "Archive run complete: $(date -u)" | tee -a "$LOG_FILE"
