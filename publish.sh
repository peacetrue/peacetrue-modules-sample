#!/bin/bash

cd ../peacetrue-dictionary && ./gradlew :peacetrue-dictionary-service-impl:publishToMavenLocal
cd ../peacetrue-user && ./gradlew :peacetrue-user-service-impl:publishToMavenLocal
cd ../peacetrue-attachment && ./gradlew :peacetrue-attachment-service-impl:publishToMavenLocal
#cd ../peacetrue-dictionary && ./gradlew :peacetrue-dictionary-service-impl:publishToMavenLocal
#cd ../peacetrue-dictionary && ./gradlew :peacetrue-dictionary-service-impl:publishToMavenLocal
