#!/bin/bash

##git clone https://github.com/adhavpavan/FabricNetwork-2.x.git

##Deleting docker containers
echo "Deliting docker containers"
docker-compose down
docker rm -f $(docker ps -a -q)
docker volume rm $(docker volume ls -q)

#Exporting the path
echo "Adding the fabric bin to the path"
export PATH=$PATH:/home/jehosua/Documents/fabric-samples/bin 
echo $PATH

#Creating the docker's organizations with the "docker-compose.yaml"
cd artifacts/channel/create-certificate-with-ca/
echo "Creating the docker organizations"
docker-compose up -d

#Creating the certificate authorities
echo "Creating the certificate authoritie"
./create-certificate-with-ca.sh
sleep 3

#Creating the genesis block
cd .. 
echo "Creating the genesis block"
./create-artifacts.sh
sleep 3
#Create the conection to the DB
cd ..
echo "Creating docker container for each peer and conecting to the DB"
docker-compose up -d
sleep 7
#Creating the channel and joning the peers to in
cd ..
echo "Creating the channel and joinig the peers"
./createChannel.sh 
sleep 3
#Deploying the chaincode
echo "Deploying the chaincode"
./deployChaincode.sh 
echo "CONGRATULATION YOUR NETWORK IS UP RUNNING"
sleep 5
#Instalacion de dependencias de API
cd api-2.0
echo "Installing the API dependencies"  
npm install

#Generating the conection for each organization
cd config
echo "Generating the cpp for each organization"
./generate-ccp.sh 

#Running the server
cd ..
echo "Running the server"
nodemon app.js

##56. Adding a new smart contract in the same channel
#cd ..
#./deployDocumentCC.sh

##Opening the HyperFabric client
#echo "Copying the hyper ledger configuration to the explorer"
#rm -rf Explorer/crypto-config
#sudo cp -r artifacts/channel/crypto-config Explorer

##Changing the name of keystore to priv_sk
#ls Explorer/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore/ | export PRIV_SK
#sudo mv Explorer/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore/22a47d8d7f58709fc7d4136fc0dde6457b107a750ff9de371205a73f865d6525_sk Explorer/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore/priv_sk
#We have to change the path /etc/data/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore/priv_sk

#Open the client in web
#cd Explorer
echo "Creating the Web interface"
docker-compose up -d
