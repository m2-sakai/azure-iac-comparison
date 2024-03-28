#!/bin/bash

terraform init -upgrade

terraform plan -out main.tfplan

terraform apply main.tfplan