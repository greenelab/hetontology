# Biological ontologies as hetnets in Neo4j

This repository creates a Neo4j database of prominent biological ontologies. The import is accomplished using the EBI's [`ols-neo4j-app`](https://github.com/EBISPOT/OLS/tree/master/ols-apps/ols-neo4j-app "EBISPOT/OLS on GitHub"). The compressed Neo4j database ([`hetontology.db.tar.xz`](database/hetontology.db.tar.xz)) can be easily deployed to a Neo4j instance to bring the convenience of the Cypher query language to ontologies.

The available ontologies are listed in [`ontology-config`](ontology-config) and include:

+ the [Gene Ontology](http://geneontology.org/)
+ the [Human Disease Ontology](http://disease-ontology.org/)
+ the [Uberon](http://uberon.org) of anatomical structures

See [this discussion](https://github.com/EBISPOT/OLS/issues/104 "EBISPOT/OLS#104: Creating a Neo4j instance of an ontology") for additional information.

## Execution

The import is performed by running `sh execute.sh`.
