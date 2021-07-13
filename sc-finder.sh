#!/bin/bash

print_usage(){
echo "Usage: ./sc-finder.sh -u '<URL>' -c '<Cookie>' -i '<Iidentifier-1>\|<Identifier-2>'"
echo
echo "-u: URL"
echo "-c: Cookies"
echo "-i: Identifier"
echo
echo "Example: ./sc-finder.sh -u 'https://target.com/myprofile' -c 'JSESSIONID=C0E10C52075E1E5; AltoroAccounts=ODuZ34jxNzIuNDR8' -i 'Hello Admin User'"
echo "Example: ./sc-finder.sh -u 'https://target.com/myprofile' -c 'JSESSIONID=C0E10C52075E1E5; AltoroAccounts=ODuZ34yMNzIuNDR8' -i 'Hello Admin User\|Sign Off'"
}

main_scf(){
  a=$(echo "$cookie" | sed 's/[[:space:]]//g' | awk -F';' 'NF{print NF-1}' | sort -u | tail -1)
  b=$(( $a + 1 ))
  
  echo -e "\n\e[32m[+] Please Wait A Moment\e[0"
  for i in $(seq 1 $b); do
    c=$(echo "$cookie" | cut -d ';' -f $i)   			   			
    if curl -ks1 $url -H "Cookie: $c" | grep -i "$idfy" &> /dev/null; then
	echo -e "\e[93mMain Session Cookie:\e[0m $c"		  		 		      
    fi &
  done
wait
}

while getopts 'u:c:i:' flag; do
	case "$flag" in
	  u) url="${OPTARG}" ;;
	  c) cookie="${OPTARG}" ;;
	  i) idfy="${OPTARG}" ;;
	  *) print_usage
		exit 1 ;;
	esac
done

if [[ $# -gt 3 ]] ; then
	main_scf
else
	print_usage
fi
echo
echo -e "\e[92mFollow Me On\e[0m" "\e[34mTwitter\e[0m" "\e[5m\e[93m@darklotuskdb\e[0m" "\e[92mHappy Hacking\e[0m"
echo -e "\e[1mGood Day\e[0m"

