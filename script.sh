#!/usr/bin/bash
# curl http://wttr.in/Perm?format=j1 | head -n 34
# echo "get data from curl..."
data=$(curl -H "Accept: application/json" 'https://check-host.net/check-http?host=check-host.net&max_nodes=3')
# echo "data resieved..."
# echo $data | jq
# echo "---   "

# echo "get nodes data..."
nodes=$(echo $data | jq '.nodes')
# echo "get request_id..."
req_id=$(echo $data | jq '.request_id' | tr -d '"')
# echo "get nodes' names"
node_names=$(echo $nodes | jq 'to_entries[].key')
# echo "get nodes' values"
node_values=$(echo $nodes | jq 'to_entries[].value')
# echo "get first node's name"
node1_name=$(echo $node_names | jq -s '.[0]' | tr -d '"')
# echo "get first node's value fields"
fields=$(echo $node_values | jq -s '.[0]')
# echo "get each field"
country=$(echo $fields | jq '.[1]' | tr -d '"')
city=$(echo $fields | jq '.[2]' | tr -d '"')
address=$(echo $fields | jq '.[3]' | tr -d '"')
# echo "check variables"
# echo $node1_name
# echo $country
# echo $city
# echo $address
# echo "generate output string"
string="<b>$node1_name:</b> $country, $city, $address; request_id=$req_id<br>"
# echo "check output string"
echo $string
