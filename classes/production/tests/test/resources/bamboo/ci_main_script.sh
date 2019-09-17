echo "------------------- command line arguments ---------"

jiras=$(echo $1 $2 $3 $4 $5 $6 | sed "s/,/\n/g" | xargs)
echo ${jiras}

echo "------------------- bamboovar ---------"
bamboovar=${bamboo_planRepository_branchName}

echo ${bamboovar}

echo "------------------- checking if jira shall be tested ---------"
for i in $jiras
do
   item=${i}
   echo ${item}
   strlength=${#item}
   echo ${strlength}
   # check if 'item' can be found inside 'bamboovar'
   if test "${bamboovar#*$item}" != "$bamboovar" && [ "$strlength" -ge "17" ]
   then
     jira_not_to_be_tested="yes"
   else
     jira_not_to_be_tested="no"
   fi
done



echo "------------------- jira_not_to_be_tested ---------------------------"
echo ${jira_not_to_be_tested}


echo "------------------- bamboo wd --------"
BAMBOOWD=$(pwd)
echo $BAMBOOWD

echo "------------------- wd ---------------"
pwd


echo "-------------------- bamboo host ------------"
BAMBOOHOST=$(hostname)
echo $BAMBOOHOST


echo "-------------------- etc/hosts --------------"
cat /etc/hosts

echo "-------------------- containers -------------"
docker ps -a

echo "-------------------- gateway-----------------"
hostip=$(/sbin/ip route|awk '/default/ { print $3 }')
echo "gateway = "$hostip

echo "-------------- bamboo wd  ---------------"
echo $BAMBOOWD
echo "-------------- LOCAL_REPOS_ROOT -------------"
export LOCAL_REPOS_ROOT=$BAMBOOWD/../../../../../
echo $LOCAL_REPOS_ROOT

echo "------------- files in bamboo wd ------------"
ls -Rl $BAMBOOWD

echo "-------------- stopping services -------------"
echo "-------------- working dir -------------------"
pwd
echo "-------------- cd to tests/src/test/resources/docker/ -------------------"
cd $BAMBOOWD/../docker/
pwd


docker-compose down --volumes
echo "sleeping 10"
sleep 10
docker ps -a
docker-compose down --volumes
echo "sleeping 10"
sleep 10
docker ps -a


echo "--------------- starting services ------------"
echo "--------------- working dir -------------------"
pwd

# docker must run in background....otherwise the script will hang on the io
docker-compose up -d --build
# wait for all containers to start
echo "sleeping 60"
sleep 60
docker ps -a
echo "sleeping 5"
sleep 5
docker ps -a


#echo "------------ show bridge network info ---------"
#docker network inspect bridge

echo "------------- bamboo host IP -----------"
echo "------------- working dir ----------------------"
pwd

docker-compose ps -q seleniumchrome

echo "------------- COMPUTERNAME is seleniumchrome IP ----------------------"
CONTAINERID=$(docker-compose ps -q seleniumchrome)

echo $CONTAINERID
BAMBOOHOSTIP=$(docker inspect --format="{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}" $CONTAINERID)

echo $BAMBOOHOSTIP
export COMPUTERNAME=$BAMBOOHOSTIP

echo "------------  is nginxproxy IP ----------------------"
CONTAINERID=$(docker-compose ps -q myassistant)

echo $CONTAINERID
NGINXPROXY=$(docker inspect --format="{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}" $CONTAINERID)

echo $NGINXPROXY
export ASSISTANT_API=$NGINXPROXY


echo "----------- working dir -------------------------------"
pwd
echo "----------- cd to $LOCAL_REPOS_ROOT/tests -------------------------------"
cd $LOCAL_REPOS_ROOT/tests
pwd

echo "------------ starting the tests in tests/---------------------------------"
echo $jira_not_to_be_tested
if [ "$jira_not_to_be_tested" = "yes" ]
  then
/data/maven-3/bin/mvn clean test -Dtest=SmokeTest -DMAVEN_OPTS="-e -Xmx4g -Xms2g"
  else
/data/maven-3/bin/mvn clean test -Dtest=RegressionTest -DMAVEN_OPTS="-e -Xmx4g -Xms2g"
fi

