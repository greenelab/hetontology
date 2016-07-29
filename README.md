# Biological ontologies as hetnets in Neo4j

This repository creates a Neo4j database of prominent biological ontologies. The import is accomplished using the EBI's [`ols-neo4j-app`](https://github.com/EBISPOT/OLS/tree/master/ols-apps/ols-neo4j-app "EBISPOT/OLS on GitHub"). The compressed Neo4j database ([`hetontology.db.tar.xz`](database/hetontology.db.tar.xz)) can be easily deployed to a Neo4j instance to bring the convenience of the Cypher query language to ontologies.

The available ontologies are listed in [`ontology-config`](ontology-config) and include:

+ the [Gene Ontology](http://geneontology.org/)
+ the [Human Disease Ontology](http://disease-ontology.org/)
+ the [Uberon](http://uberon.org) of anatomical structures

Each ontology is configured according to its properties file (see  for example [`application-doid.properties`](ontology-config/application-doid.properties)). Currently, ontology annotations, such as Gene Ontology Annotations (term–gene associations) are not included.

See [this discussion](https://github.com/EBISPOT/OLS/issues/104 "EBISPOT/OLS#104: Creating a Neo4j instance of an ontology") for additional information.

## Execution

The import is performed by running `sh execute.sh`.

## Running a local Hetonology Neo4j instance

You can easily create a local Neo4j instance of the Hetontology database. Just run the following commands from the directory where you would like the database directory to exist. The Hetontology Neo4j Browser should then become available at http://localhost:7474.

```sh
# Remove database if exists. Then download the database into hetontology.db
URL=https://github.com/greenelab/hetontology/blob/ols-neo4j-app/database/hetontology.db.tar.xz?raw=true
DB_DIR=hetontology.db
rm --recursive --force $DB_DIR
mkdir $DB_DIR
curl --location --silent $URL | tar --extract --xz --directory $DB_DIR

# Launch Neo4j from Docker and use hetontology.db as the database
# Neo4j will become available on http://localhost:7474
docker pull neo4j:3.0.3
docker run \
  --publish=7474:7474 \
  --volume=`pwd`/$DB_DIR:/data/databases/graph.db \
  --env=NEO4J_AUTH=none \
  --env=NEO4J_dbms_allowFormatMigration=true \
  neo4j:3.0.3
```
