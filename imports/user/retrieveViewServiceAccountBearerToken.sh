#!/bin/bash

kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep view-user | awk '{print $1}')
