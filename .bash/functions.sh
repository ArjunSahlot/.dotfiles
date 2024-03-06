# Commands
function mkcd() {
	if [ $# -ne 1 ]; then
		echo Missing new directory name
		return 1
	fi
	mkdir $1
	cd $1
	echo Successful
}

function clone() {
	if [ $# -ne 1 ]; then
		echo Missing path
		return 1
	fi
	if [[ $1 == *"/"* ]]; then
		git clone https://github.com/$1.git
	else
		git clone https://github.com/ArjunSahlot/$1.git
	fi
}

function newcomp() {
	echo "$@.cpp" | temp -np competitive cpp
}

function runcpp() {
	filename=$(basename -- "$1")
	filename=$(basename $filename .cpp)
	g++ -o $filename $1
	./$filename $2 $3 $4 $5 $6 $7 $8 $9
}

function rmcomp() {
	rm -v $1 $1.out $1.in
}

function getip() {
	local _host="$1"
	local _curl_base="curl --request GET"
	local _timeout="15"

	_host_ip=$($_curl_base -ks -m "$_timeout" "https://dns.google.com/resolve?name=${_host}&type=A" | \
		jq '.Answer[0].data' | tr -d "\"" 2>/dev/null)

	if [[ -z "$_host_ip" ]] || [[ "$_host_ip" == "null" ]] ; then
		echo -en "Unsuccessful\\n"
	else
		echo -en "$_host > $_host_ip\\n"
	fi
}

function getdomain() {
	local _ip="$1"
	local _curl_base="curl --request GET"
	local _timeout="15"

	_asn=$($_curl_base -ks -m "$_timeout" "http://ip-api.com/line/${_ip}?fields=as")
	_state=$(echo $?)

	if [[ -z "$_ip" ]] || [[ "$_ip" == "null" ]] || [[ "$_state" -ne 0 ]]; then
		echo -en "Unsuccessful\\n"
	else
		echo -en "$_ip > $_asn\\n"
	fi
}
