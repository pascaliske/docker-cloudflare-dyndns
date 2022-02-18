#!/bin/sh

# ensure required variables are set
if [ -z "${CF_API_TOKEN}" ]; then
    echo "Required variable \$CF_API_TOKEN is empty!"
    exit 2
fi

if [ -z "${DOMAIN}" ]; then
    echo "Required variable \$DOMAIN is empty!"
    exit 2
fi

if [ -z "${NAME}" ]; then
    echo "Required variable \$NAME is empty!"
    exit 2
fi

# fetch public IP
IP=$(curl -s "${IP_SERVICE:-ifconfig.co}" | grep -Eo '[0-9\.]+')

# IP is not available
if [ -z "${IP}" ]; then
    echo "Could not retrieve IP from \"${IP_SERVICE:-ifconfig.co}\"."
    exit 3
fi

# fetch zone ID associated with the domain
ZONES=$(curl -s -X GET -H "Content-Type: application/json" -H "Authorization: Bearer ${CF_API_TOKEN}" "https://api.cloudflare.com/client/v4/zones")
ZONE_ID=$(echo "${ZONES}" | jq -r ".result[] | select(.name == \"${DOMAIN}\") | .id")

# fetch record ID associated with the domain
RECORDS=$(curl -s -X GET -H "Content-Type: application/json" -H "Authorization: Bearer ${CF_API_TOKEN}" "https://api.cloudflare.com/client/v4/zones/${ZONE_ID}/dns_records")
RECORD_ID=$(echo "${RECORDS}" | jq -r ".result[] | select(.type == \"A\" and .name == \"${NAME}.${DOMAIN}\") | .id")

if [ -z "${RECORD_ID}" ]; then
    echo "Could not retrieve DNS record."
    exit 3
fi

# send request with name, domain to update DNS record
DATA="{\"type\": \"A\", \"name\": \"${NAME}.${DOMAIN}\", \"content\": \"${IP}\"}"
RESPONSE=$(curl -s -X PUT -H "Content-Type: application/json" -H "Authorization: Bearer ${CF_API_TOKEN}" -d "${DATA}" "https://api.cloudflare.com/client/v4/zones/${ZONE_ID}/dns_records/${RECORD_ID}")
SUCCESS=$(echo "$RESPONSE" | jq -r ".success")

if [ "${SUCCESS}" != true ]; then
    echo "Could not update DNS record."
    exit 3
fi

# output info
echo "${NAME}.${DOMAIN} -> ${IP}"
