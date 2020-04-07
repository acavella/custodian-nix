generate_csr () {
	# Assign serial number variable
	if [[ ! -n $arg1 ]];
	then
		read -p "Enter Common Name (CN): " CN
	else
		CN="$arg1"
	fi

	# Generate private key and signing request
	echo "Generating ECDSA private key for $CN"
	cp $BIN_PATH/conf/openssl.conf /tmp/$CN.conf
	echo "CN=$CN" >> /tmp/$CN.conf
	/usr/bin/openssl ecparam -name secp384r1 -genkey -noout -out $CN.key
	/usr/bin/openssl req -new -config /tmp/$CN.conf -sha384 -key $CN.key -out $CN.csr
	rm -f /tmp/$CN.conf
}
