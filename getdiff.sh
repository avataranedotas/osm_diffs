#Consulta base
#[adiff:"2021-07-03T00:00:00Z","2021-07-04T00:00:00Z"]; area[name="Portugal"]->.a; node(area.a)[amenity=charging_station]; compare(delta:t["amenity"]);out meta;

#!/bin/bash

#obter datas de hoje e ontem
HOJE=`date -d "today 00:00" +"%Y-%m-%dT%TZ"`
ONTEM=`date -d "yesterday 00:00" +"%Y-%m-%dT%TZ"`
SEMANA=`date -d "7 day ago 00:00" +"%Y-%m-%dT%TZ"`

echo Hoje  : $HOJE
echo Ontem : $ONTEM
echo Semana: $SEMANA

#construir consulta overpass

consulta="[adiff:"\""$HOJE"\"","\""$ONTEM"\""]; area[name="\""Portugal"\""]->.a; node(area.a)[amenity=charging_station]; compare(delta:t["\""amenity"\""]);out meta;"
#consultasemana="[adiff:"\""$HOJE"\"","\""$SEMANA"\""]; area[name="\""Portugal"\""]->.a; node(area.a)[amenity=charging_station]; compare(delta:t["\""amenity"\""]);out meta;"

echo Consulta: $consulta
#echo Consultasemana: $consultasemana

#fazer consulta e gravar em ficheiro

wget -O $HOJE.osm "https://z.overpass-api.de/api/interpreter?data=$consulta"
