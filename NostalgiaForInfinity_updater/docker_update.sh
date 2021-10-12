#!/bin/bash

TG_TOKEN=""
TG_CHAT_ID=""
TG_FT_BOT_ID=""
ROOT_PATH=""

NFI_PATH="${ROOT_PATH}/NostalgiaForInfinity/NostalgiaForInfinityNext.py"
FT_PATH="${ROOT_PATH}/freqtrade/ft_userdata/user_data/strategies/NostalgiaForInfinityNext.py"
GIT_URL="https://github.com/iterativv/NostalgiaForInfinity"

# Go to NFI directory
cd $(dirname ${NFI_PATH})

# Fetch latest tags
git fetch --tags

# Get tags names
latest_tag=$(git describe --tags `git rev-list --tags --max-count=1`)
current_tag=$(git describe --tags)

# Create a new branch with the latest tag name and copy the new version of the strategy
if [ "$latest_tag" != "$current_tag" ]; then

        # Checkout to latest tag and update the NFI in Freqtrade folder
        git checkout tags/$latest_tag -b $latest_tag || git checkout $latest_tag 
        cp $NFI_PATH $FT_PATH

        # Get tag to which the latest tag is pointing
        latest_tag_commit=$(git rev-list -n 1 tags/${latest_tag})
		
		# Compose the main message send by the bot
        curl -s --data "text=NFI is updated to tag: *${latest_tag}* . Please wait for reload..." \
                --data "parse_mode=markdown" \
                --data "chat_id=$TG_CHAT_ID" \
                "https://api.telegram.org/bot${TG_TOKEN}/sendMessage"

        sleep 120

        cd $(dirname ${FT_PATH})
        docker-compose down > /dev/null &&
        docker-compose build --pull > /dev/null &&
        docker-compose up -d --remove-orphans > /dev/null &&
        docker system prune --volumes -af > /dev/null

        curl -s --data "text=NFI reload has been completed!" \
                --data "parse_mode=markdown" \
                --data "chat_id=$TG_CHAT_ID" \
                "https://api.telegram.org/bot${TG_TOKEN}/sendMessage"
fi