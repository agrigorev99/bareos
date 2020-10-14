#!/bin/bash
#   BAREOS® - Backup Archiving REcovery Open Sourced
#
#   Copyright (C) 2020-2020 Bareos GmbH & Co. KG
#
#   This program is Free Software; you can redistribute it and/or
#   modify it under the terms of version three of the GNU Affero General Public
#   License as published by the Free Software Foundation and included
#   in the file LICENSE.
#
#   This program is distributed in the hope that it will be useful, but
#   WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
#   Affero General Public License for more details.
#
#   You should have received a copy of the GNU Affero General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
#   02110-1301, USA.

IFS='
'

PREFIX=$1
if [ -z "$PREFIX" ]; then
  echo "API prefix required. Bareosfd, Bareossd or Bareosdir"
  exit 1
fi

exec >capi_1.inc

echo "/* C API functions */"
NUM=0
for i in $(cat api_definition.txt); do
  retval=$(echo $i | sed 's/ .*//g')
  funcname=$(echo $i | cut -b 5- | sed s/\(.*//g)
  prot=$(echo $i | sed s/.*\(//g | sed 's/);//g')
echo "
/* static $i */
#define ${PREFIX}_${funcname}_NUM $NUM
#define ${PREFIX}_${funcname}_RETURN $retval
#define ${PREFIX}_${funcname}_PROTO (${prot})"

((NUM=NUM+1))
done
echo "
/*Total Number of C API function pointers */
#define ${PREFIX}_API_pointers $NUM"

exec >capi_2.inc

NUM=0
for i in $(cat api_definition.txt); do
  retval=$(echo $i | sed 's/ .*//g')
  funcname=$(echo $i | cut -b 5- | sed s/\(.*//g)
  prot=$(echo $i | sed s/.*\(//g | sed 's/);//g')
  echo "#define ${PREFIX}_${funcname} (*(${PREFIX}_${funcname}_RETURN(*)${PREFIX}_${funcname}_PROTO) ${PREFIX}_API[${PREFIX}_${funcname}_NUM])
"
((NUM=NUM+1))
done

exec >capi_3.inc

NUM=0
for i in $(cat api_definition.txt); do
  retval=$(echo $i | sed 's/ .*//g')
  funcname=$(echo $i | cut -b 5- | sed s/\(.*//g)
  prot=$(echo $i | sed s/.*\(//g | sed 's/);//g')
  echo " ${PREFIX}_API[${PREFIX}_${funcname}_NUM] = (void*)${funcname};"
((NUM=NUM+1))
done
