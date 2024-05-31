# 입력된 월 표준 형식으로 변환하는 함수 capitalize_month 선언
capitalize_month() {
  local month=$1    # 지역변수 month
  case ${month,,}   # month 변수에 저장된 값 소문자로 변환
  in
    jan* | 1) echo "Jan" ;;  # 1~12 패턴 매칭
    feb* | 2) echo "Feb" ;;
    mar* | 3) echo "Mar" ;;
    apr* | 4) echo "Apr" ;;
    may* | 5) echo "May" ;;
    jun* | 6) echo "Jun" ;;
    jul* | 7) echo "Jul" ;;
    aug* | 8) echo "Aug" ;;
    sep* | 9) echo "Sep" ;;
    oct* | 10) echo "Oct" ;;
    nov* | 11) echo "Nov" ;;
    dec* | 12) echo "Dec" ;;
    *) echo "Invalid month" ;;
  esac
}

# 윤년인지 확인하는 함수
is_leap_year() {
  local year=$1
  if (( year % 4 != 0 )); then
    return 1
  elif (( year % 400 == 0 )); then
    return 0
  elif (( year % 100 == 0 )); then
    return 1
  else
    return 0
  fi
}

# 각 월 일수 정의
get_days_in_month() {
  local month=$1
  local year=$2
  if [[ $month == "Jan" || $month == "Mar" || $month == "May" || $month == "Jul" || $month == "Aug" || $month == "Oct" || $month == "Dec" ]]; 
  then
    echo 31
  elif [[ $month == "Apr" || $month == "Jun" || $month == "Sep" || $month == "Nov" ]]; 
  then
    echo 30
  elif [[ $month == "Feb" ]];
  then
    if is_leap_year $year;
    then
      echo 29
    else
      echo 28
    fi
  else
    echo "Invalid month"
    return 1
  fi
}

month=$(capitalize_month "$1") # 월 변환
date=$2
year=$3

# 메인 스크립트 실행
if [ "$#" -ne 3 ]; then # 3개의 인수 전달되지 않은 경우
  echo "입력값 오류"
  exit 1
fi

if [ "$month" == "Invalid month" ];
then
  echo "유효하지 않은 월: ${1}는 유효하지 않습니다"
  exit 1
fi

if ! [[ "$date" =~ ^[0-9]+$ ]] || ! [[ "$year" =~ ^[0-9]+$ ]]; # ^는 문자열 시작, $는 문자열 끝, +는 1개 이상 반복 => 문자열 전체가 하나 이상의 숫자로만 구성되어야 함. `~=`는 정규표현식 매칭에서 활용
then
  echo "유효하지 않은 날짜: ${1} ${2} ${3}는 유효하지 않습니다"
  exit 1
fi

# 날짜 출력
echo "${month^} $date $year"
