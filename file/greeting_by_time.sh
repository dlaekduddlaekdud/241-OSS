current_hour=$(date +"%H")

if [ "$current_hour" -ge 0 ] && [ "$current_hour" -lt 9 ]; then
  echo "Good Morning"
  exit 0
elif [ "$current_hour" -ge 9 ] && [ "$current_hour" -lt 17 ]; then
  echo "Good Afternoon"
  exit 0
elif [ "$current_hour" -ge 17 ] && [ "$current_hour" -lt 24 ]; then
  echo "Good Evening"
  exit 0
else 
  echo "시간을 판별할 수 없습니다."
  exit 1
fi
