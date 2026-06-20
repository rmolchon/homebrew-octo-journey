#!/bin/bash

while : ; do
  read -p "Enter your GitHub username: " username

  check=$(curl -s "https://api.github.com/users/$username")
  if echo "$check" | jq -e '.message == "Not Found"' > /dev/null 2>&1; then
    echo "Username not found. Please try again."
    continue
  fi

  break
done

page=1
total=0
while : ; do
  response=$(curl -s "https://api.github.com/users/$username/repos?page=$page&per_page=100")

  count=$(echo "$response" | jq -r '. | length')
  total=$((total + count))

  if [ "$count" -eq 0 ]; then
    break
  fi

  ((page++))
done

last_repo=$(curl -s "https://api.github.com/users/$username/repos?sort=pushed&direction=desc&per_page=1")
repo_name=$(echo "$last_repo" | jq -r '.[0].name')
pushed_at=$(echo "$last_repo" | jq -r '.[0].pushed_at')
epoch=$(date -jf "%Y-%m-%dT%H:%M:%SZ" "$pushed_at" "+%s" 2>/dev/null)
formatted=$(TZ=America/New_York date -r "$epoch" "+%B %-d, %Y at %-I:%M %p %Z" 2>/dev/null)

echo "Total repositories found: $total"
echo "Last repo worked on: $repo_name (last pushed: $formatted)"