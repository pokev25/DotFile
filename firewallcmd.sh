#!/bin/bash

function  usage {
    echo "USAGE: $0 param"
    echo ""
    echo "$0 -i block-ip1,block-ip2"
    echo "$0 -d block-ip1,block-ip2"
    echo "$0 -f block-ip-file"
    exit 1
}

if [ "$#" -lt 1 ]; then
    usage;
fi

PARAM="f:i:h:d";

while getopts $PARAM opt; do
  case $opt in
    f)
        while IFS='' read -r line || [[ -n "$line" ]]; do
            # echo "Block IP: $line"

            if [ -z "$IPS" ];then
                IPS="$line";
            else
                IPS="$IPS,$line";
            fi
        done < "$OPTARG"
        ;;
    i)
        IPS=$OPTARG;
        RULE="--add-rich-rule";
        ;;
    d)
        IPS=$OPTARG;
        RULE="--remove-rich-rule";
        ;;

    *)
        usage;
        ;;
  esac
done

#echo "To be blocked IPS=$IPS"

IFS=','
for ip in $IPS; do
    CMD="firewall-cmd ${RULE}='rule family=\"ipv4\" source address=\"${ip}\" drop'"
    echo "${CMD}  --permanent" | bash -x

done

echo ""
RELOAD="firewall-cmd --reload"
echo "${RELOAD}" | bash -x

firewall-cmd --list-rich-rule | awk '{print $4}'
