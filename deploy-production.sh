# #!/bin/sh

# GCLOUD_PROJECT_ID=toolkit-271822
# INSTANCE_GROUP_NAME=u2d-encoder-instance-group
# INSTANCE_GROUP_ZONE=us-central1-a

# # Exit if there's any error
# set -e
# printf "\nBuilding the Typescript files ..."
# npm run build

# printf "\nBuilding docker from Dockerfile ..."
# docker build -t gcr.io/$GCLOUD_PROJECT_ID/nodejs-encoder:latest .

# printf "\nPushing the docker image to Google Container registry ..."
# docker push gcr.io/$GCLOUD_PROJECT_ID/nodejs-encoder:latest

# printf "\nStarting rolling replace of all VM instances under "
# printf $INSTANCE_GROUP_NAME
# printf " MIG ...\n"
# gcloud compute instance-groups managed rolling-action \
#     replace $INSTANCE_GROUP_NAME \
#     --zone $INSTANCE_GROUP_ZONE \
#     --project=$GCLOUD_PROJECT_ID

# printf "\nDeployment success. The new version will be available after all VMs has been replaced.\n"
