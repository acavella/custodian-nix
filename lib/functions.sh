join_domain () {
	read -p "Target domain: " domainName
	read -p "Username (Domain Admin): " domainAdmin
	yum install -y sssd realmd oddjob oddjob-mkhomedir adcli samba-common samba-common-tools
	realm discover $domainName
	realm join $domainName -U $domainAdmin
}
