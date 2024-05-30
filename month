# 인수 개수 확인
if [ "$#" -eq 0 ]; then
  echo "오류: 인수가 없습니다."
  exit 1
elif [ "$#" -eq 1 ]; then
  month_num=$1

  # 숫자를 월로 환산하기
  case $month_num in
    1) month="Jan";;
    2) month="Feb";;
    3) month="Mar";;
    4) month="Apr";;
    5) month="May";;
    6) month="Jun";;
    7) month="Jul";;
    8) month="Aug";;
    9) month="Sep";;
    10) month="Oct";;
    11) month="Nov";;
    12) month="Dec";;
    *) 
      echo "존재하지 않는 달입니다."
      exit 1
      ;;
  esac

  echo "$month"

elif [ "$#" -ge 2 ]; then
  echo "오류: 인수가 너무 많습니다."
  exit 1
fi
