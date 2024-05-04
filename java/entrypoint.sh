#!/bin/bash
cd /home/container || exit 1

# Configure colors
PURPLE='\033[0;35m' 
RESET_COLOR='\033[0m'

# Print Current Java Version
java -version

# Set environment variable that holds the Internal Docker IP
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# Replace Startup Variables
# shellcheck disable=SC2086
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo -e "STARTUP /home/container: ${MODIFIED_STARTUP}"

# Run the Server
# shellcheck disable=SC2086
echo "   _  __         __                _  __        __   "
echo "  / |/ /__ ___  / /___ _____  ___ / |/ /__  ___/ /__ "
echo " /    / -_) _ \/ __/ // / _ \/ -_)    / _ \/ _  / -_)"
echo "/_/|_/\__/ .__/\__/\_,_/_//_/\__/_/|_/\___/\_,_/\__/ "
echo "        /_/                                         "
echo -e "========================================================================================================"
echo -e "${PURPLE}Thanks for choosing NeptuneNode! If you have any issues don't hesitate to contact us on discord at discord.gg/neptunenode ${RESET_COLOR}"
echo -e "========================================================================================================"
eval ${MODIFIED_STARTUP}




