display_help () {
echo "
custudian.sh: ./custodian.sh [function] [args]
    Assists with common administrative activities.
    
    The variable CDPATH defines the search path for the directory containing
    DIR.  Alternative directory names in CDPATH are separated by a colon (:).
    A null directory name is the same as the current directory.  If DIR begins
    with a slash (/), then CDPATH is not used.
    
    Functions:
      csr	Generates a private key and certificate signing request.
      		Argument specifies CN value, full RDN defined in 
		conf/openssl.conf
		Example: custodian.sh csr YOUR_CN_HERE

      bulkcsr	Generates multiple private keys and certificate signing requests.
      		Argument specifies txt file containing list of CN values.
		Example: custodian.sh bulkcsr path/cnlist.txt
"
}
