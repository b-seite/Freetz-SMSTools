#!/bin/sh

PATH=/bin:/usr/bin:/sbin:/usr/sbin
. /usr/lib/libmodcgi.sh

check "$SMSTOOLS3_ENABLED" yes:auto "*":man
SMSTOOLS3_MESSAGE1=`cat /tmp/flash/smstools3/message1.txt`
SMSTOOLS3_MESSAGE2=`cat /tmp/flash/smstools3/morsecode1.txt`
select "$SMSTOOLS3_LOG_LEVEL" \
  critical:logcritical \
  error:logerror \
  warning:logwarn \
  info:loginfo \
  debug:logdebug \
	"*":lognote

sec_begin '$(lang de:"Starttyp" en:"Start type")'

cat << EOF
<p>
<input id='e1' type='radio' name='enabled' value='yes'$auto_chk><label for='e1'>$(lang de:"Automatisch" en:"Automatic")</label>
<input id='e2' type='radio' name='enabled' value='no'$man_chk><label for='e2'>$(lang de:"Manuell" en:"Manual")</label>
</p>
EOF

sec_end
sec_begin '$(lang de:"SMS Empfang" en:"received SMS")'

cat << EOF
<p>
$(lang de:"Letzte empfangene SMS" en:"last received SMS")<br>
EOF
echo "$SMSTOOLS3_MESSAGE1"
cat << EOF
<br>
$(lang de:"Ausgabe in Mosrecode" en:"Translated to morse code")<br>
EOF
echo "$SMSTOOLS3_MESSAGE2"
cat << EOF
</p>
EOF

sec_end

sec_begin '$(lang de:"Logging" en:"Logging")'

cat << EOF

<p>
<label for='log_level'>$(lang de:"Log-Level" en:"Log level"): </label>
<select name='log_level' id='log_level'>
<option $logcritical_sel>critical</option>
<option $logerror_sel>error</option>
<option $logwarn_sel>warning</option>
<option $lognote_sel>notice</option>
<option $loginfo_sel>info</option>
<option $logdebug_sel>debug</option>
</select>
</p>
EOF

sec_end
