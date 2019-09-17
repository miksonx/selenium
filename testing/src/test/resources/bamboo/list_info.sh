echo "-------------------------- Containers --------------------------"
docker ps -a

echo "-------- Containers that have exited ---------------------------"
docker ps -f "status=exited"

DOCKERIDS=$(docker ps -qf "status=exited")
echo "Contaners that have exited = "$DOCKERIDS

#for i in "${DOCKERIDS}"; do docker inspect -s $i; done;
for i in "${DOCKERIDS}"; do docker rm -f $i; done;

echo "-------------------------- BAMBOOWD ----------------------------"
BAMBOOWD=$(pwd)
echo $BAMBOOWD
#ls -Rl $BAMBOOWD

echo "-------------------------  Gateway -----------------------------"
hostip=$(/sbin/ip route|awk '/default/ { print $3 }')
echo "gateway = "$hostip

echo "------------------------- BAMBOOHOST ---------------------------"
BAMBOOHOST=$(hostname)
echo $BAMBOOHOST


echo "-----------------------END OF SCRIPT ---------------------------"







