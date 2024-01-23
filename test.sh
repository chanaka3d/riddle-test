#!/bin/bash

# Initial URL
url="https://www.letsrevolutionizetesting.com/challenge"

# Loop until the script encounters a different response
while true; do
    # Make a request and store the response
    response=$(curl -s -H "Accept: application/json" "$url")

    # Extract the 'follow' URL from the response using awk
    follow_url=$(echo $response | awk -F '"' '/"follow":/ {print $4}')
    
    sleep 1
    # Check if the 'follow' URL is present
    if [[ -z $follow_url ]]; then
        echo "Different response received: $response"
        break
    else
        echo "Following URL: $follow_url"
        url=$follow_url
    fi
done
