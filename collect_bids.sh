#!/bin/sh

sed -n '/bid=/{s,^.*href=",,; s/".*$//; s,^,http://www.worlduc.com,; p;}' total.htm
