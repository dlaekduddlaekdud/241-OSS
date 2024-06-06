# 들어오는 인수 개수 프린트
echo "전체 인수 개수: $#"

# 들어오는 모든 인수 프린트
echo "입력된 인수: $*"

# 모든 인수 순회하면서 하나씩 프린트
for var in "$*"
do
  echo [1] $var
done

for var in "$@"
do
  echo [2] $var
done

for var in $*
do
  echo [3] $var
done

