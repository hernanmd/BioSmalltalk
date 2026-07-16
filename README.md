[![license-badge](https://img.shields.io/badge/license-MIT-blue.svg)](https://img.shields.io/badge/license-MIT-blue.svg)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![Build Status](https://travis-ci.org/hernanmd/BioSmalltalk.svg?branch=master)](https://travis-ci.org/hernanmd/BioSmalltalk)
[![Coverage Status](https://coveralls.io/repos/github/hernanmd/BioSmalltalk/badge.svg?branch=master)](https://coveralls.io/github/hernanmd/BioSmalltalk?branch=master)

# Table of Contents

- [Description](#description)
- [Installation](#installation)
- [Features](#features)
  - [DNA Feature Visualization](#dna-feature-visualization)
  - [Pathway Modeling](#pathway-modeling)
  - [Ontology Management](#ontology-management)
  - [Curated Database Catalog](#curated-database-catalog)
  - [MAF Parsing and Mutation Analysis](#maf-parsing-and-mutation-analysis)
  - [BED Parsing and Genomic Intervals](#bed-parsing-and-genomic-intervals)
  - [SmaCC Parsers for VCF and GFF3](#smacc-parsers-for-vcf-and-gff3)
  - [PDB Parser](#pdb-parser)
  - [FASTQ and SAM Parsing](#fastq-and-sam-parsing)
  - [ORF Finding](#orf-finding)
  - [Coordinate Mapping](#coordinate-mapping)
  - [Repeat Sequence Analysis](#repeat-sequence-analysis)
  - [Sequences, Alignment, and External Tools](#sequences-alignment-and-external-tools)
- [Contribute](#contribute)
- [License](#license)

# Description

BioSmalltalk is an Open-Source (MIT-licensed) library for bioinformatics written in Smalltalk (currently [Pharo](http://www.pharo.org)).

# Installation

There are several ways to install **BioSmalltalk**. At a minimum, you need a working Pharo virtual image installed in a system. Check the [Pharo website](http://www.pharo.org) for installation information regarding the Pharo Open-Source system. 

You can also use one-liners: 

- `bash -c "$(curl -fsSL https://raw.githubusercontent.com/hernanmd/pi/master/install.sh)"` to install PI (Pharo Installer CLI) and,
- `pi image` and `pi run` to download and run the latest stable Pharo image. 

Once inside Pharo, to paste the following expressions inside Pharo, open a "Playground" window with (Cmd + O + W) or by clicking an empty area in the Pharo window and select Tools -> Playground. 

<img width="810" height="555" alt="biosmalltalk-installation" src="https://github.com/user-attachments/assets/e993fb9f-3f2d-4482-bbac-d45f37c2e0d3" />


For additional help using Pharo, please check the [free Pharo books](http://books.pharo.org/), the [awesome-pharo lists](https://github.com/pharo-open-documentation/awesome-pharo), and the [wiki](https://github.com/pharo-open-documentation/pharo-wiki). 
For a quick reference of the syntax, check the [Pharo Cheat Sheet](http://files.pharo.org/media/pharoCheatSheet.pdf)

## Standard Installation

The script should be evaluated inside the Pharo image. The current Pharo version 13.x is supported.

```smalltalk
	EpMonitor disableDuring: [
		Metacello new
			onConflictUseLoaded;
			onWarningLog;
			repository: 'github://hernanmd/biosmalltalk/repository';
			baseline: 'BioSmalltalk';
			load ].
```
In case of problems, check [Troubleshoot Install](./TROUBLESHOOT.md)

# Features

BioSmalltalk covers the core bioinformatics workflow from sequence retrieval to analysis, with no external C dependencies for most operations. The following modules are the most recent additions.

## DNA Feature Visualization

A port of the Python DnaFeaturesViewer library built on Roassal2. It renders linear and circular DNA plots with features, ruler, nucleotide sequence, amino-acid translation, and GC-content rows.

```smalltalk
| record features |
features := {
  BioDnaFeature start: 10 end: 40 strand: 1 label: 'geneA' color: Color blue.
  BioDnaFeature start: 55 end: 80 strand: -1 label: 'geneB' color: Color red }.
record := BioDnaGraphicRecord sequence: 'ATCGATCG...' features: features.
record yScale: 15; xScale: 10.
record openLinearTitled: 'My plasmid'.
record openCircularTitled: 'My plasmid'.
record openLinearWithSequenceAndTranslationTitled: 'Details' from: 1 to: 50.
record openLinearWithGCTitled: 'GC Content' windowSize: 20.
```

Linear plots support feature CRUD, overlapping multi-level features, cropping, inverted axes, local highlighting, overview+detail, custom colors, and GenBank import (`fromGenBankFile:`). Circular plots support plasmid and virus maps with rotated start positions. 22 example methods and 63 tests ship with the module.

## Pathway Modeling

Metabolic and signaling pathway modeling inspired by Biopython `Bio.Pathway`, libSBML, BioPAX, KEGG, and MetaCyc. Eight classes (`BioSpecies`, `BioComplex`, `BioCompartment`, `BioReaction`, `BioInteraction`, `BioNetwork`, `BioPathway`, `BioOntologyTerm`) support stoichiometric analysis, graph queries, and omics mapping.

```smalltalk
| pathway glc pyr r1 |
glc := BioSpecies metabolite: 'glucose'.
pyr := BioSpecies metabolite: 'pyruvate'.
r1 := BioReaction id: 'R1' name: 'glycolysis_step1'.
r1 addReactant: glc stoichiometry: 1; addProduct: pyr stoichiometry: 2.
pathway := BioPathway id: 'hsa00010' name: 'Glycolysis' organism: 'Homo sapiens'.
pathway addReaction: r1.
pathway stoichiometryMatrix.
pathway chokePoints.
pathway deadEndMetabolites.
pathway findPathsFrom: glc to: pyr.
pathway validate.
pathway mapOmicsData: expressionData.
```

Seven example methods cover glycolysis, the TCA cycle, lac operon regulation, hierarchical pathways, omics data mapping, pathway analysis, and FBA-style kinetics. Export stubs (`asSBML`, `asKGML`, `asBioPAX`) are extension points for future format conversion. 27 tests pass.

## Ontology Management

OBO 1.2 parsing and programmatic ontology construction with DAG traversal, namespace and subset support, and entity annotations carrying qualifiers and evidence. Eight classes: `BioOntology`, `BioOntologyTerm`, `BioOntologyRelationship`, `BioOntologyNamespace`, `BioAnnotation`, `BioOntologyParser`, `BioOBOOntologyParser`, `BioOWLOntologyParser`.

```smalltalk
| onto bp |
onto := BioOntology loadFromOBO: oboText.
bp := onto termById: 'GO:0008150'.
onto termsMatching: 'protein'.
onto ancestorsOf: bp.
onto annotate: aPathway withTerm: bp qualifier: #enables.
oboString := onto exportToOBO.
```

## Curated Database Catalog

`BioDatabases` ships 654 curated bioinformatics database entries across 34 categories (19 primary, 15 secondary), parsed from bioinformaticssoftwareandtools.co.in. URLs are resolved from the `click_me.php?id=N` proxy to real targets.

```smalltalk
| dbs |
dbs := BioDatabases allDatabases.  "654 entries"
dbs byCategory: 'nucleotideSequenceDatabases'.
dbs byType: #primary.
dbs searchKeyword: 'GenBank'.
```

## MAF Parsing and Mutation Analysis

Two parsers produce `BioMutationSet` from Mutation Annotation Format files: a fast line-by-line `BioMAFParser` and a SmaCC-based `BioMAFSmaCCParser` consistent with the VCF and GFF3 parsers. `BioMutation` and `BioMutationSet` provide indexing, filtering, mutation spectrum, and pathway integration.

```smalltalk
| mset |
mset := BioMutationSet fromMAFFile: '/path/to/mutations.maf'.
mset mutationsForGene: 'TP53'.
mset mutationSpectrum.
mset topMutatedGenes: 10.
mset mutationBurdenPerMB: 3000.
mset enrichPathways: pathwayCollection.
mset asMAFString.
```

## BED Parsing and Genomic Intervals

SmaCC-hybrid BED parser with automatic BED3/BED6/BED12 detection (track, browser, and comment lines skipped). `BioGenomicInterval` provides half-open interval arithmetic; `BioGenomicIntervalCollection` adds chromosome indexing, merge, sort, and overlap queries.

```smalltalk
| intervals i1 i2 |
intervals := BioGenomicIntervalCollection fromBED: '/path/to/regions.bed'.
i1 := BioGenomicInterval from: 100 to: 500 on: 'chr1' strand: '+'.
i2 := BioGenomicInterval from: 300 to: 800 on: 'chr1'.
i1 overlapsInterval: i2.          "true"
i1 intersect: i2.                 "chr1:300-500"
i1 union: i2.                     "chr1:100-800"
i1 subtract: i2.                  "chr1:100-300"
i1 promoterRegion: 1000 downstream: 200.
intervals mergeOverlapping.
intervals overlappingMutations: aMutationSet.
```

BED12 features expose exon blocks and coding length. Intervals integrate with MAF (`overlappingMutations:`), ontology (`annotateWithOntology:`), and GFF3 (`toGFF`). 43 tests pass.

## SmaCC Parsers for VCF and GFF3

The VCF 4.5 and GFF3 parsers are SmaCC-based (LALR(1)) and build rich domain models. The VCF parser exposes sample genotypes, INFO fields, and biallelic SNP predicates. The GFF3 parser supports memory-efficient streaming, type filtering, and parent-child navigation via `Parent` and `Derives_from` attributes.

```smalltalk
| vcf dl |
vcf := VCF fromFile: '/path/to/file.vcf'.
vcf fileFormat.                    "'VCFv4.5'"
dl := vcf dataLines first.
dl isBiallelicSNP.
dl hasInfoFlag: 'DB'.
dl genotypeAt: 1.
```

```smalltalk
| gff features |
gff := BioGFF3File fromFile: '/path/to/file.gff3'.
gff featureTypes.
features := gff featuresWithType: 'gene'.

BioGFF3File new streamFeaturesFromFile: '/path/to/large.gff3' block: [ :f |
  f isOfGeneType ifTrue: [ ...process gene... ] ].

gff := BioGFF3File new fromFile: '/path/to/large.gff3' filteringTypes: (Set with: 'gene' with: 'mRNA').
```

## PDB Parser

A SmaCC-based Protein Data Bank parser following the same pattern as the GFF3, VCF, and Phylip parsers. A typed record class per PDB record type (`BioPDBAtomRecord`, `BioPDBSeqResRecord`, `BioPDBHeaderRecord`, `BioPDBHelixRecord`, `BioPDBSheetRecord`, `BioPDBConectRecord`, and more) is collected into a `BioPDBFile` container. Fixed-column parsing is safe against short lines and missing numeric fields.

```smalltalk
file := BioPDBSmaCCParser parseFile: '/path/to/structure.pdb'.
file atoms size.
file atomsForChain: 'A'.
file sequenceForChain: 'A'.
file seqResRecords size.
```

Supported record types include `HEADER`, `TITLE`, `SEQRES`, `ATOM`, `HETATM`, `HELIX`, `SHEET`, `CONECT`, `MODEL`, and `ENDMDL`. 30 tests pass (7 basic + 23 advanced).

## FASTQ and SAM Parsing

Stream-based FASTQ and SAM parsers with advanced quality handling, automatic gzip support, and paired-end parsing.

`BioFASTQRecord` computes Phred scores (with Sanger/Solexa/Illumina encoding auto-detection), mean quality, GC content, N counting, and quality trimming. `BioFASTQParser` filters records by quality, length, N count, and GC range, and collects aggregate statistics.

```smalltalk
parser := BioFASTQParser onFile: 'reads.fastq.gz' asFileReference.  "auto gzip detection"
record := parser next.
record meanQuality.
record trimLowQuality: 30.
parser select: [ :r | r meanQuality >= 30 ].
parser gcContentRange: #(30.0 70.0).
stats := parser statistics.
```

GZip support is transparent: `onGZipFile:`, `onGZipBytes:`, and `onFile:` (auto-detects the `.gz` extension) decompress on the fly using Pharo's built-in `GZipReadStream`.

`BioPairedEndParser` reads R1/R2 file pairs or interleaved FASTQ, normalizes read IDs (`/1`, `/2`, Illumina `1:`/`2:`), validates pairs, filters by insert size and quality, and collects statistics. `BioInterleavedParser` handles alternated R1/R2 records.

```smalltalk
parser := BioPairedEndParser onR1: r1File r2: r2File.
parser validPairs.
parser insertSizeRange: #(200 500).
parser statistics at: #averageInsertSize.
```

`SamParser` and `SamRecord` parse all 11 mandatory SAM fields plus optional `TAG:TYPE:VALUE` tags, with bitwise-flag accessors (`isSecondary`, `isProperPair`, `isReverseComplement`, `isSupplementary`) and `tagAt:` lookup. 27 tests pass across FASTQ, SAM, gzip, and paired-end.

## ORF Finding

Open Reading Frame detection on `BioSequence`, analogous to Biopython's `find_orfs_with_trans`. Searches all six reading frames (both strands) using NCBI genetic-code tables and returns a `SortedCollection` of `BioORF` objects sorted by start position.

```smalltalk
| seq orfs |
seq := BioSequence newDNA: 'ATGAAATTTGGGTAATGAATGAAAGGGCCCTAG'.
orfs := seq findOrfsWithTranslationTable: 1 minProteinLength: 5.
orfs first start.       "1-based inclusive"
orfs first strand.     "1 or -1"
orfs first protein.    "translated sequence"
```

Coordinates are 1-based inclusive, consistent with GenBank/EMBL and Smalltalk conventions. 5 tests pass.

## Coordinate Mapping

`BioSeqCoordinatesMapper` translates between genomic, CDS, and protein coordinate systems, following the Biopython `Bio.SeqUtils.Mapper` pattern. It uses 1-based closed intervals internally (GenBank/HGVS convention) and converts to BED's 0-based half-open format on demand.

```smalltalk
mapper := BioSeqCoordinatesMapper fromExonPairs:
  { 5809->5860 . 6758->6874 . 7769->7912 }.
mapper genomicToCDS: 5810.          "c.2 (exon)"
mapper cdsToGenomicLocus: 274.       "returns a BioLocus"
mapper cdsToProtein: 274.            "p.92"
mapper proteinToGenomicLocus: 92.   "returns a BioLocus"
```

`BioCDSPosition` models exon, intron, 5' UTR (`preCDS`), and 3' UTR (`postCDS`) positions with HGVS notation (`c.52+5`, `c.-809`, `c.*15`). Genomic positions reuse the existing `BioLocus` class (with `asBedInterval`/`asGffInterval`), avoiding duplication. 17 tests pass.

## Repeat Sequence Analysis

`BioRepeatSequence` and its subclass `BioSTRSequence` model tandem repeats and microsatellites (STRs) with flanking regions, chromosome, strand, and marker metadata. STRs are classified by motif length (mono- to hexanucleotide), and alleles are exported to GFF3, VCF, CSV, and GenBank feature formats.

```smalltalk
str := BioSTRSequence new
  name: 'D13S317';
  motif: 'TATC';
  repeats: 10;
  chromosome: '13';
  markerCode: 'D13S317';
  start: 82367542; end: 82367581;
  flankingRegionLeft: 'ACGT';
  flankingRegionRight: 'TGCA';
  yourself.
str isTetraNucleotide.   "true"
str alleleSize.          "40"
str expectedPCRSize.     "48"
str asAlleleString.      "D13S317=10"
str asGFFRow.            "GFF3 row"
str asVCFRow.            "VCF row"
```

Class-side detection helpers include `findRepeatsIn:motif:`, `countTandemRepeats:in:`, and `findMotifsOfLength:in:`. 10 tests pass.

## Sequences, Alignment, and External Tools

Beyond the new modules, BioSmalltalk provides DNA/RNA/protein sequences (`BioSequence` with complement, translate, GC content, restriction maps, k-mer frequencies), FASTA/GenBank/EMBL/SwissProt/Phylip parsing, `BioAlignment` with consensus building, NCBI Entrez clients (`BioEntrezClient`), BLAST wrappers, multiple sequence alignment wrappers (MUSCLE, ClustalW/O, MAFFT, HMMER), population genetics tools (PLINK, LAMPLD, Structure, ShapeIt), haplotype block analysis, rule-based classifiers, and NGS preprocessing (Cutadapt, fastq-mcf, SAMtools).

# Contribute

**Working on your first Pull Request?** You can learn how from this *free* series [How to Contribute to an Open Source Project on GitHub](https://egghead.io/courses/how-to-contribute-to-an-open-source-project-on-github)

If you have discovered a bug or have a feature suggestion, feel free to create an issue on GitHub.
If you have any suggestions for improving this package, please get in touch or submit them on the GitHub issues page.
If you'd like to make some changes yourself, see the following:    

  - Fork this repository to your own GitHub account and then clone it to your local device
  - Do some modifications
  - Test.
  - Add <your GitHub username> to add yourself as author below.
  - Finally, submit a pull request with your changes!
  - This project follows the [all-contributors specification](https://github.com/kentcdodds/all-contributors). Contributions of any kind are welcome!

## Version management 

This project uses semantic versioning to define the releases. This means that each stable release of the project will be assigned a version number of the form `vX.Y.Z`. 

- **X** defines the major version number
- **Y** defines the minor version number 
- **Z** defines the patch version number

When a release contains only bug fixes, the patch number increases. When the release contains new features that are backward compatible, the minor version increases. When the release contains breaking changes, the major version increases. 

Thus, it should be safe to depend on a fixed major version and a moving minor version of this project.

# License
	
This software is licensed under the MIT License.

Copyright Hernán Morales Durand, 2026.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# Authors

Hernán Morales Durand

