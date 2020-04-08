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

bulk_csr () {
	# Assign source file to first argument
	input="$arg1"

	# Generate private key and signing request for each line of input
	while IFS= read -r line
	do
		echo "Generating ECDSA private key for $line"
        	cp $BIN_PATH/conf/openssl.conf /tmp/$line.conf
        	echo "CN=$line" >> /tmp/$line.conf
        	/usr/bin/openssl ecparam -name secp384r1 -genkey -noout -out $line.key
        	/usr/bin/openssl req -new -config /tmp/$line.conf -sha384 -key $line.key -out $line.csr
        	rm -f /tmp/$line.conf
	done < "$input"
}
