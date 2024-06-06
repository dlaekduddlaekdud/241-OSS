region_codes=("02 서울" "031 경기" "032 인천" "033 강원" "041 충남" "042 대전" "043 충북" "044 세종" "051 부산" "052 울산" "053 대구" "054 경북" "055 경남" "061 전남" "062 광주" "063 전북" "064 제주")

# 전화번호부가 저장된 파일
PHONEBOOK="phonebook.txt"

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <name> <phone_number>"
    exit 1
fi

name=$1
number=$2

if ! [[ "$number" =~ ^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$ ]]; then
    echo "Invalid phone number format. Use: XXX-XXXX-XXXX or XX-XXXX-XXXX"
    exit 1
fi

region_code=${number%%-*}
region=""

for entry in "${region_codes[@]}"; do
    code=${entry%% *}
    name_region=${entry##* }
    if [ "$region_code" == "$code" ]; then
        region="$name_region"
        break
    fi
done

if [ -z "$region" ]; then
    echo "Unknown area code: $region_code"
    exit 1
fi

# 검색
if grep -q "^$name " "$PHONEBOOK"; then
    existing_entry=$(grep "^$name " "$PHONEBOOK")
    existing_number=$(echo "$existing_entry" | cut -d' ' -f2)
    if [ "$existing_number" == "$number" ]; then
        echo "The same phone number already exists for $name."
        exit 0
    else
        sed -i "/^$name /d" "$PHONEBOOK"
    fi
fi

echo "$name $number $region" >> "$PHONEBOOK"

sort -o "$PHONEBOOK" "$PHONEBOOK"

echo "Phonebook updated successfully."
