# config for zenhub
ZENHUBAPI=""
GITHUBAPI=""

read -p "Enter the issue number: " ISSUE
# add RFR label
curl -H "Authorization: token $GITHUBAPI" https://api.github.com/repos/makesense/sense-chat-mobile/issues/$ISSUE/labels -X POST --data '{"labels": ["RFR"]}'
# move to review pipeline
curl -H  "X-Authentication-Token: $ZENHUBAPI" -H "Content-Type: application/json" -X POST --data '{"pipeline_id":"5d0d5dde43e42a09a0a4a7df","position":"top"}' https://api.zenhub.io/p1/repositories/143791550/issues/$ISSUE/moves
