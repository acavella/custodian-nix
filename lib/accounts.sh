add_user () {
	# Assign variables
	user="$arg1"
	read -s -p "Enter password : " pw
	
	# Check if user exists
	egrep "^$user" /etc/passwd >/dev/null
	if [ $? -eq 0 ]; then
		echo "$user exists!"
		exit 1
	else
		pass=$(perl -e 'print crypt($ARGV[0], "password")' $pw)
		useradd -m -p $pass $user
		[ $? -eq 0 ] && echo "User has been added!" || echo "Failed to add user!"
	fi
}
inactive_accounts () {
	# Assign variables

	# 

