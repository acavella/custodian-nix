generate_csr () {
	# Assign serial number variable
	read -p "Device serial number: " serialNum

	# Generate private key and signing request
	echo "Generating ECDSA private key for $serialNum"
	cp $BIN_PATH/conf/dmccts.conf /tmp/$serialNum.conf
	echo "CN=$serialNum" >> /tmp/$serialNum.conf
	/usr/bin/openssl ecparam -name secp384r1 -genkey -noout -out $serialNum.key
	/usr/bin/openssl req -new -config /tmp/$serialNum.conf -sha384 -key $serialNum.key -out $serialNum.csr
	rm -f /tmp/$serialNum.conf
}
