#!/bin/bash

check() {
  login=$1
  password=$2

  echo [$login] $password
  echo $password | pwscore $login
}


echo NG case
check rnishimo 'Arupaka42'
check rnishimo 'arupaka42tokyo'
check rnishimo 'ArupakaTokyo'
check rnishimo 'AAAArupaka42Tokyo'
check rnishimo 'rnishimo42Tokyo'
check root 'Arupaka42'
check root 'arupaka42tokyo'
check root 'ArupakaTokyo'
check root 'AAAArupaka42Tokyo'
check root 'root42Tokyo'


echo OK case
check rnishimo 'Arupaka42Tokyo'
check rnishimo 'ARUPAKA42TOKYO'
check rnishimo 'AAArupaka42tokyo'
check root 'Arupaka42Tokyo'
check root 'ARUPAKA42TOKYO'
check root 'AAArupaka42tokyo'
