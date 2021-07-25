#!/opt/bin/bash
VBOXIP=192.168.x.x
FINALPATH=/opt/share/xupnpd/www/
FINALPATH2=/opt/share/xupnpd/playlists/
FINALM3U=recs1.m3u

XMLMEM=$(curl -k -L -s "http://$VBOXIP/cgi-bin/HttpControl/HttpControlApp?OPTION=1&Method=GetRecordsList&Externals=YES&ExternalIP=$VBOXIP&Port=55555")

#xmlstarlet sel -t -c "count(//ThreadGroup)" xmlfile

TMPDATA0=$(echo $XMLMEM | xml sel -t -m "/record-list/record" -v "channel-name" -o "|" -v "programme-title" -o "|" -v "url" -o "|" -v "state" -n)
TMPDATA3=$(echo $XMLMEM | xml sel -t -v '//url' -n)
TMPDATA3=$(sed 's/127.0.0.1/'$VBOXIP'/g' <<< $TMPDATA3)

#readarray -t url <<<"$TMPDATA3"
#arraylength=${#url[@]}

readarray -t all <<<"$TMPDATA0"
arraylength=${#all[@]}

readarray -t -n $arraylength recorded <<<"$TMPDATA0"

M3UREADY="#EXTM3U"

for (( i=0; i<${arraylength}; i++ ));
do
    IFS="|" read -r recitem1 recitem2 recitem3 recitem4 <<<"${recorded[$i]}"
    if [ -z "$recitem2" ]; then recitem2="Unknown"; fi
    if [ "$recitem4" != "recorded" ]; then continue; fi

    M3UREADY="${M3UREADY}\n#EXTINF:-1,""${recitem2} - ${recitem1}"
    M3UREADY="${M3UREADY}\n${recitem3}"
done

echo -e $M3UREADY > $FINALPATH/$FINALM3U
#echo -e $M3UREADY > $FINALPATH2/$FINALM3U
#UPLOADRES=$(curl -k -L -s -F file=@"$FINALPATH/$FINALM3U" http://$VBOXIP/cgi-bin/FileManager/FileManagerApp)
