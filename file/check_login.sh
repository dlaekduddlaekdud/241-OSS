# 인수가 1개인지 확인
if [ "$#" -ne 1 ]; then
  echo "$0 <username>"
  exit 1
fi

user=$1

while true
do
  # 로그인된 유저 확인
  if who | grep -q "^$user "; then
    echo "$user 로그인함!"
    exit 0
  fi

  # 60초 대기
  sleep 60
done