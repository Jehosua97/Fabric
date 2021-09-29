#!/bin/bash

function one_line_pem {
    echo "`awk 'NF {sub(/\\n/, ""); printf "%s\\\\\\\n",$0;}' $1`"
}

function json_ccp {
    local PP=$(one_line_pem $4)
    local CP=$(one_line_pem $5)
    sed -e "s/\${ORG}/$1/" \
        -e "s/\${P0PORT}/$2/" \
        -e "s/\${CAPORT}/$3/" \
        -e "s#\${PEERPEM}#$PP#" \
        -e "s#\${CAPEM}#$CP#" \
        ./ccp-template.json
}

ORG=1
P0PORT=7051
CAPORT=7054
PEERPEM=../../artifacts/channel/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/tlscacerts/tls-localhost-7054-ca-org1-example-com.pem
CAPEM=../../artifacts/channel/crypto-config/peerOrganizations/org1.example.com/msp/tlscacerts/ca.crt

echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM )" > connection-org1.json

ORG=2
P0PORT=9051
CAPORT=8054
PEERPEM=../../artifacts/channel/crypto-config/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/tlscacerts/tls-localhost-8054-ca-org2-example-com.pem
CAPEM=../../artifacts/channel/crypto-config/peerOrganizations/org2.example.com/msp/tlscacerts/ca.crt

echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > connection-org2.json

ORG=3
P0PORT=11051
CAPORT=10054
PEERPEM=../../artifacts/channel/crypto-config/peerOrganizations/org3.example.com/peers/peer0.org3.example.com/tls/tlscacerts/tls-localhost-10054-ca-org3-example-com.pem
CAPEM=../../artifacts/channel/crypto-config/peerOrganizations/org3.example.com/msp/tlscacerts/ca.crt


echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > connection-org4.json

ORG=4
P0PORT=11052
CAPORT=10055
PEERPEM=../../artifacts/channel/crypto-config/peerOrganizations/org4.example.com/peers/peer0.org4.example.com/tls/tlscacerts/tls-localhost-10055-ca-org4-example-com.pem
CAPEM=../../artifacts/channel/crypto-config/peerOrganizations/org4.example.com/msp/tlscacerts/ca.crt


echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > connection-org4.json

ORG=5
P0PORT=11053
CAPORT=10056
PEERPEM=../../artifacts/channel/crypto-config/peerOrganizations/org5.example.com/peers/peer0.org5.example.com/tls/tlscacerts/tls-localhost-10056-ca-org5-example-com.pem
CAPEM=../../artifacts/channel/crypto-config/peerOrganizations/org5.example.com/msp/tlscacerts/ca.crt


echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > connection-org5.json

ORG=6
P0PORT=11054
CAPORT=10057
PEERPEM=../../artifacts/channel/crypto-config/peerOrganizations/org6.example.com/peers/peer0.org6.example.com/tls/tlscacerts/tls-localhost-10057-ca-org6-example-com.pem
CAPEM=../../artifacts/channel/crypto-config/peerOrganizations/org6.example.com/msp/tlscacerts/ca.crt


echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > connection-org6.json

ORG=7
P0PORT=11055
CAPORT=10058
PEERPEM=../../artifacts/channel/crypto-config/peerOrganizations/org7.example.com/peers/peer0.org7.example.com/tls/tlscacerts/tls-localhost-10058-ca-org7-example-com.pem
CAPEM=../../artifacts/channel/crypto-config/peerOrganizations/org7.example.com/msp/tlscacerts/ca.crt


echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > connection-org7.json

ORG=8
P0PORT=11056
CAPORT=10059
PEERPEM=../../artifacts/channel/crypto-config/peerOrganizations/org8.example.com/peers/peer0.org8.example.com/tls/tlscacerts/tls-localhost-10059-ca-org8-example-com.pem
CAPEM=../../artifacts/channel/crypto-config/peerOrganizations/org8.example.com/msp/tlscacerts/ca.crt


echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > connection-org8.json

ORG=9
P0PORT=11057
CAPORT=10060
PEERPEM=../../artifacts/channel/crypto-config/peerOrganizations/org9.example.com/peers/peer0.org9.example.com/tls/tlscacerts/tls-localhost-10060-ca-org9-example-com.pem
CAPEM=../../artifacts/channel/crypto-config/peerOrganizations/org9.example.com/msp/tlscacerts/ca.crt


echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > connection-org9.json

ORG=10
P0PORT=11058
CAPORT=10061
PEERPEM=../../artifacts/channel/crypto-config/peerOrganizations/org10.example.com/peers/peer0.org10.example.com/tls/tlscacerts/tls-localhost-10061-ca-org10-example-com.pem
CAPEM=../../artifacts/channel/crypto-config/peerOrganizations/org10.example.com/msp/tlscacerts/ca.crt


echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > connection-org10.json