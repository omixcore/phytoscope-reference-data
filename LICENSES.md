# 参考数据来源与许可说明

本文件逐条列出 `data/` 下 9 个文件的来源、发布版本与许可状态，与 `MANIFEST.json`
一一对应。**凡无法从主仓库 provenance 或官方页面确证者，一律如实标注「需确认」，
不编造许可条款**。本文件是说明性文档，不构成法律意见；再分发前请自行核对各数据
提供方的最新使用条款。

---

## 1. Arabidopsis thaliana · TAIR10 全基因组 FASTA

- 文件：`data/species/arabidopsis/TAIR10_genomic.fna.gz`
- 来源：Ensembl Plants **release 62**，TAIR10 组装的 toplevel DNA FASTA
- 原始 URL：<https://ftp.ensemblgenomes.ebi.ac.uk/pub/plants/release-62/fasta/arabidopsis_thaliana/dna/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa.gz>
- provenance：`src/main/resources/data/species/arabidopsis/genome-sequence-provenance.json`
  （记录 7 条 record：`1`–`5`、`Mt`、`Pt`，合计 119,667,750 nt）
- 许可：**需确认**。Ensembl Plants / TAIR 的数据使用条款以官方页面为准，
  主仓库未记录明确的许可证标识符。

## 2. Arabidopsis thaliana · Araport11 完整核基因组注释（Chr1–Chr5）

- 文件：`data/species/arabidopsis/Chr1.gff3.gz` … `Chr5.gff3.gz`（5 个）
- 来源：**TAIR / Araport11 original June 2016 release**（TAIR10 组装）
- 原始 URL：<https://www.arabidopsis.org/download_files/Genes/Araport11_genome_release/Araport11_GFF3_genes_transposons.201606.gff.gz>
  （主仓库 provenance 另记录镜像下载页 `https://plantgarden.jp/en/download/t3702/t3702.G001/Araport11_GFF3_genes_transposons.201606.gff.gz`）
- provenance：`src/main/resources/data/reference-provenance.json`（`arabidopsis.bundled_resources`）
  与 `src/main/resources/data/species/arabidopsis/manifest.json`
- 说明：5 个文件为按染色体切分并各自 gzip 压缩的版本，特征坐标未改动；
  合计 788,499 特征行 / 33,997 gene-like 特征。
- 许可：**需确认**。TAIR / Araport11 使用条款以官方页面为准，主仓库未记录明确许可证。

## 3. Arabidopsis thaliana · E-MTAB-7978 表达图谱矩阵

- 文件：`data/case-studies/arabidopsis-atlas/expression.tsv`
- 来源：**EBI Expression Atlas E-MTAB-7978**，六组单 assay 条件的 gene-level TPM
- 原始 URL：<https://ftp.ebi.ac.uk/pub/databases/microarray/data/atlas/experiments/E-MTAB-7978/E-MTAB-7978-tpms.tsv>
- 文献 DOI：**10.1038/s41586-020-2094-2**
- provenance：`src/main/resources/data/case-studies/arabidopsis-atlas/manifest.json`
  （含 `samples.tsv` / `source-values.tsv` 的 SHA-256 与 24 格校验信息）
- 说明：提取时要求六个条件中每个源单元格含 5 个相同汇总分量、保留首个分量，
  不做平均、填补或转录本→基因聚合；32,833 基因 × 6 条件。
- 许可：**需确认**。EBI Expression Atlas 数据使用条款与原始文献版权以官方页面为准。

## 4. Mentha longifolia · 完整 horsemint 基因组注释

- 文件：`data/species/mint/mentha_longifolia_horsemint.gff3.gz`
- 来源：Lieberman, Henry & Comai 2025，染色体级二倍体 horsemint 基因组，
  figshare **10.6084/m9.figshare.28457522**（<https://doi.org/10.6084/m9.figshare.28457522>）
- 原始 URL：<https://ndownloader.figshare.com/files/52521323>
- provenance：`src/main/resources/data/reference-provenance.json`（`mint-genome`）
- 说明：Braker3/AUGUSTUS 注释，haplotype A 上 94,883 个基因模型 / 102,705 转录本；
  坐标逐字复制自已发布 GTF，仅补充基因/转录本/外显子层级并转写为 GFF3。
- 许可：主仓库 provenance 记为 **CC BY 4.0**，但仍**需复核** figshare 原始发布页的
  许可声明（本清单的 `license_status` 因此为 `needs_confirmation`）。

## 5. Mentha longifolia · 4 叶 TPM 表达矩阵

- 文件：`data/species/mint/mentha_longifolia_expression.tsv`
- 来源：**需确认**。主仓库 provenance 未为该矩阵记录独立的原始下载 URL、
  原始 RNA-seq 文库编号或生成脚本；仅知其为与上述 haplotype-A 组装配套的
  4 叶 TPM 面板（94,883 行）。
- 关联页面：<https://doi.org/10.6084/m9.figshare.28457522>（仅为关联基因组来源页，
  **不代表该矩阵本身的来源已确证**）
- 许可：**需确认**。在来源与许可核实前，不应再分发或声称其许可。

## 6. WSU Mint Genome Resources（小示例的出处，非本仓库文件）

- 主仓库保留的 KB 级示例 `species/mint/mentha_longifolia_chromosomes.gff3` 来自
  **WSU Mint Genome Resources**（Lange lab）`Mlong_CMEN585_v3.01b` Maker GFF3，
  同一组装亦存于 INSDC `GCA_001642375.2`。
- 来源页：<http://langelabtools.wsu.edu/mgr/sites/default/files/downloads/Mlong585_v3.01b-maker.gff>
- 许可：**需确认**。此处登记仅为完整说明「mint」数据来源；该文件不在本数据仓库中，
  仍随软件仓库以 KB 级示例形式保留。

---

## 汇总

| 数据 | 发布版本 | 许可状态 |
| --- | --- | --- |
| TAIR10 基因组 FASTA | Ensembl Plants r62 | 需确认 |
| Araport11 Chr1–Chr5 注释 | TAIR / Araport11 June 2016 | 需确认 |
| E-MTAB-7978 表达图谱 | DOI 10.1038/s41586-020-2094-2 | 需确认 |
| horsemint 完整注释 | figshare 10.6084/m9.figshare.28457522 | CC BY 4.0（provenance 记录，需复核） |
| horsemint 4 叶 TPM 矩阵 | 来源未明确 | 需确认 |
| WSU Mint Genome Resources（小示例，仅登记） | Mlong_CMEN585_v3.01b | 需确认 |

> 所有条目的 SHA-256 均在 T01 由文件实际字节**重新计算**，见 `SHA256SUMS.txt`；
> 主仓库 `reference-provenance.json` 中记录的哈希仅作交叉参考，未被照抄。
