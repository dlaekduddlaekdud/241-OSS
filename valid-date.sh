#!/bin/bash

# 입력된 월 표준 형식으로 변환
capitalize_month() {
  local month=$1
  case ${month,,} in
    jan* | 1) echo "Jan" ;;
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

# 윤년인지 확인하기
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

# Main script execution starts here
if [ "$#" -ne 3 ]; then
  echo "입력값 오류"
  exit 1
fi

month=$(capitalize_month "$1")
date=$2
year=$3

if [ "$month" == "Invalid month" ]; then
  echo "유효하지 않은 월: ${1}는 유효하지 않습니다"
  exit 1
fi

if ! [[ "$date" =~ ^[0-9]+$ ]] || ! [[ "$year" =~ ^[0-9]+$ ]]; then
  echo "유효하지 않은 날짜: ${1} ${2} ${3}는 유효하지 않습니다"
  exit 1
fi

# Days in each month
declare -A days_in_month
days_in_month=( ["Jan"]=31 ["Feb"]=28 ["Mar"]=31 ["Apr"]=30 ["May"]=31 ["Jun"]=30 ["Jul"]=31 ["Aug"]=31 ["Sep"]=30 ["Oct"]=31 ["Nov"]=30 ["Dec"]=31 )

# Adjust February days for leap years
if is_leap_year "$year"; then
  days_in_month["Feb"]=29
fi

# Validate the date
if (( date < 1 || date > ${days_in_month[$month]} )); then
  echo "유효하지 않은 날짜: ${month} ${date} ${year}는 유효하지 않습니다"
  exit 1
fi

# Print valid date in capitalized form
echo "${month^} $date $year"
