#!/bin/sh

pods=()
i=0
for line in `kubectl get pod`
do
    let i++
    if [ $(((i+4)%5)) = 0 -a ! $i = 1 ] ; then
        # 初期化
        pods+=($line)
    fi
done


i=0
for pod in ${pods[@]}; do
  echo $i: $pod
  let i++
done

echo "Please select target"
read ti

echo "Please input container name"
read cn

echo "command: kubectl exec -it ${pods[ti]} -c ${cn} bash" 
kubectl exec -it ${pods[ti]} -c ${cn} bash