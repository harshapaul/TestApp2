#!/bin/sh

#  upload.sh
#  AndroidStudioTravis
#
#  Created by Harshapaul Pinto on 13/02/15.
#  Copyright (c) 2014 ___v2Tech Ventures___. All rights reserved.


OUTPUTDIR="./app/build/outputs/apk"
HOCKEY_APP_ID="8d2b01a4602a0e51b4323fb65832fd36"
HOCKEY_APP_TOKEN="dc59206ef9d644f7b3a75df743876d81"

# upload via curl to Hockey app
if [ ! -z "$HOCKEY_APP_ID" ] && [ ! -z "$HOCKEY_APP_TOKEN" ]; then
echo ""
echo "***************************"
echo "* Uploading to Hockeyapp  *"
echo "***************************"
curl  \
-F "status=2" \
-F "notify=0" \
-F "notes=Version 1.1" \
-F "notes_type=0" \
-F "ipa=@$OUTPUTDIR/app-debug.apk" \
-H "X-HockeyAppToken: $HOCKEY_APP_TOKEN" \
https://rink.hockeyapp.net/api/2/apps/8d2b01a4602a0e51b4323fb65832fd36/app_versions/upload
echo "Upload finish"
fi