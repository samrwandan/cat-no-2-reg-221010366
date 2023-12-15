#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <positive_integer>"
    exit 1
fi

if ! [[ $1 =~ ^[0-9]+$ ]]; then
    echo "Error: Argument must be a positive integer"
    exit 1
fi

number=$1

sum_digits=0
product_digits=1
is_palindrome="true"
is_prime="true"

for ((i=0; i<${#number}; i++)); do
    digit=${number:$i:1}
    sum_digits=$((sum_digits + digit))
    product_digits=$((product_digits * digit))
done

for ((i=0; i<${#number}/2; i++)); do
    if [ ${number:$i:1} != ${number: -$(($i+1)):1} ]; then
        is_palindrome="false"
        break
    fi
done

for ((i=2; i<$number; i++)); do
    if [ $(($number % $i)) -eq 0 ]; then
        is_prime="false"
        break
    fi
done

echo "Sum of digits: $sum_digits"
echo "Product of digits: $product_digits"
echo "Is palindrome: $is_palindrome"
echo "Is prime: $is_prime"