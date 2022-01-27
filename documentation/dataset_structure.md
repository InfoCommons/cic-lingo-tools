
Structure of the Lingo4g datasets
=================================

Datasets contain two pieces:
- JSON configuration
- data files


JSON configuration
------------------

The configuration file has JSON objects corresponding to:

- fields
- source
- dictionaries
- indexer
- queryParsers
- analysis


Data files
-----------

Lingo will index any data files, as long as they are in the data directory and
match the "source" designation in the config file.
