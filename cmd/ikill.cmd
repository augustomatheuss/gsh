alias_ikill()
{
	if [ $# -eq 0 ]
	then
		echo "No argument given."
	else
		name=$1
		options=`ps aux | awk '{ print $2, $11}' | grep -i --color $name | wc -l`
		if [ $options -eq 0 ]
		then
			echo "No process with "$1" in name."
		else
			echo "Choose a process to kill"
			for ((i=1; i<=$options; i++))
			do
				echo $i") "$(ps aux | awk '{ print $2, $11}' | grep -i --color $name | tail -n $i | head -n 1)
			done
			echo -n ">"
			read number
			if [[ $number -ge 1 && $number -le $options ]]
			then
				echo `ps aux | awk '{ print $2, $11}' | grep -i $1 | tail -n $number | head -n 1  | awk '{print $1}' | xargs kill -9`
			else
				echo "There is no option with the number "$number
			fi
		fi
	fi
}
alias ikill=alias_ikill
