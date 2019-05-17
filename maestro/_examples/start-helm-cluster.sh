#!/bin/sh
# this script is for local testing using KinD
# https://github.com/kubernetes-sigs/kind
kind create cluster
export KUBECONFIG="$(kind get kubeconfig-path --name="kind")"
kubectl --namespace kube-system create serviceaccount tiller
kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller
helm init
helm init --service-account tiller --upgrade
sleep 3