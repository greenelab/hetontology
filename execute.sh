set -o errexit

# Extract ontology codes from ontology-config filenames
ontologies=`ls ontology-config | cut --delimiter='-' --fields=2 | cut --delimiter='.' --fields=1`

# Copy ontology configuration files into the ols-neo4j-app source
cp --recursive ontology-config/. OLS/ols-apps/ols-neo4j-app/src/main/resources/

# Set the directory for OLS to output to
cd OLS
export OLS_HOME=`pwd`/ols-home

# Build OLS
mvn --quiet clean install

# Import ontologies into Neo4j
for ontology in $ontologies
do
  java -Xmx10g -jar -Dspring.profiles.active=$ontology ols-apps/ols-neo4j-app/target/ols-neo4j-app.jar
done

# Compress database
cd ols-home/neo4j
tar --create --xz --file ../../../database/hetontology.db.tar.xz *

