# set vars for convienence
_APPDIR=$(dirname $rvm_current_rvmrc 2> /dev/null)
_VIM=$(which vim)
_GVIM=$(which gvim)
_SED=$(which sed)
_GREP=$(which grep)

# vimify [vim|gvim] 123445:12
# vimify [vim|gvim] 123445
# vimify [vim|gvim] path/to/file:12
# vimify [vim|gvim] path/to/file +12
# vimify [vim|gvim] path/to/file
function vimify() {
	# determine format of parameter(s)
	# for gvim the path should be the last parameter
	v_line=''
	v_ptid=''
	v_path=''
	v_param=''
	v_whichvim=''
	if (test 'gvim' == $1); then
		v_param='--remote-tab-silent'
		v_whichvim=$_GVIM
		unset $1
	elif (test 'vim' == $1); then
		v_whichvim=$_VIM
		unset $1
	fi

	for var in "$@"; do
    if (echo $var | $_GREP -qE '^\+[0-9]+$'); then
			v_line=$var
			continue
    elif (echo $var | $_GREP -qE '^[0-9]+$'); then
			v_ptid=$var
			continue
    elif (echo $var | $_GREP -qE '^[0-9]+:[0-9]+$'); then
			v_line="+"$(echo $var | $_SED -e '/.*:\([0-9]\+\)/!d;s//\1/')
			v_ptid=$(echo $var | $_SED -e '/\([0-9]\+\):.*/!d;s//\1/')
			continue
		elif (echo $var | $_GREP -qiE '^/?([a-z0-9_.-]+/)*[a-z0-9_.-]+$'); then
			v_path=$var
			continue
		elif (echo $var | $_GREP -qiE '^/?([a-z0-9_.-]+/)*[a-z0-9_.-]+:[0-9]+$'); then
			v_line="+"$(echo $var | $_SED -e '/.*:\([0-9]\+\)/!d;s//\1/')
			v_path=$(echo $var | $_SED -e '/\(.*\):.*/!d;s//\1/')
			continue
		fi
	done

	# get the path from the pivitol id
	if [ ! -z $v_ptid ]; then
		v_path=$(locate_pt $v_ptid)
	fi

	# either open vim/gvim or show the params
	if [ ! -z $v_path ]; then
		if [ ! -z $v_whichvim ]; then
      $v_whichvim ${v_param} ${v_line} ${v_path} 2> /dev/null
		else
			echo "${v_param} ${v_line} ${v_path}"
		fi
	else
		echo "Path or Pivotal Tracker id not found."
	fi

}

# usage: see vimify
# alias for vimify vim 
function v() {
	vimify vim $@
}

# usage: see vimify
# alias for vimify gvim 
function g() {
	vimify gvim $@
}

# provide a path or PT id
function cucumber() {
	cd $_APPDIR
	if [ -f "$@" ];
	then
		bundle exec cucumber --require features -f pretty "$@"
	else
		line=$(echo "$@" | $_SED -e '/.*:\([0-9]\+\)/!d;s//\1/')
		param=$(echo "$@" | $_SED 's/:.*//')
    if [ $(echo $param | $_GREP -oE '^[0-9]+$') ];
		then
			param=$(locate_pt "$param")
		fi
		if [ -z $line ];
		then
			bundle exec cucumber --require features -f pretty "$param"
		else
			bundle exec cucumber --require features -f pretty "$param:$line"
		fi
	fi
	cd -
}

# return the absolute path for a pivotal tracker id
function locate_pt() {
	echo $($_GREP -ril "$@" ${_APPDIR}/features/*)
}

function get_pt() {
#cat features/sprint_5_patient_request/patient_request/patient_creates_an_email_request.feature | sed -e '/^.*pivotaltracker.com\/story\/show\/\([0-9]\+\)/!d;s//\1/'
  cat "$@" | sed -e '/^.*pivotaltracker.com\/story\/show\/\([0-9]\+\)/!d;s//\1/'
}

# change dir back to appdir
function cdapp(){
	if [ ! -z "$_APPDIR" ]; then
		cd $_APPDIR
	else
		cd .
	fi
}
