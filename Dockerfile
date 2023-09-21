from maven as build
workdir /app
copy . .
run mvn install

from openjdk:11.0
workdir /app
copy --from=build /app/target/devops-integration.jar /app/
expose 8080
cmd ["java","-jar","devops-integration.jar"]