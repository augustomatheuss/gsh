alias_locks()
{
	if (test -e ~/.s4bash/locks.png)  
	then   
		i3lock -i ~/.s4bash/locks.png -e -f -I 3  
	else
		i3lock -c 000000 -e -f -I 3
	fi
}
alias locks=alias_locks