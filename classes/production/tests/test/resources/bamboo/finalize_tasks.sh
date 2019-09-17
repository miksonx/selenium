echo "------------------- bamboo wd --------------"
BAMBOOWD=$(pwd)
echo $BAMBOOWD


echo "-------------- LOCAL_REPOS_ROOT -------------"
export LOCAL_REPOS_ROOT=$BAMBOOWD/../../../../../
echo $LOCAL_REPOS_ROOT


echo "-------------- cd to tests/src/test/resources/docker/ -------------------"
cd $BAMBOOWD/../docker/
pwd

echo "-------------- Stopping services and cleaning up ------------"
docker-compose down --volumes
sleep 7
docker ps -a
docker-compose down --volumes
sleep 7
docker ps -a
docker-compose down --volumes
sleep 7
docker ps -a


echo "-------------- What are we leaving for others...---------"
docker ps -a
echo "--------------- Containers started after bamboo-agent ------------------"
docker ps -f since=bamboo-agent
dockerids="$(docker ps -qf since=bamboo-agent)"
#for i in "${dockerids}"; do docker stop $i; done;
#for i in "${dockerids}"; do docker rm -f $i; done;
